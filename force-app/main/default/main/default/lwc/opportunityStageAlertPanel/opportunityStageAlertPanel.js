import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';

const CHANNEL_NAME = '/event/Opportunity_Stage_Alert__e';

export default class OpportunityStageAlertPanel extends LightningElement {
    subscription = null;
    alerts = [];

    connectedCallback() {
        this.initializeEmpApi();
    }

    disconnectedCallback() {
        this.unsubscribeFromChannel();
    }

    get hasAlerts() {
        return this.alerts.length > 0;
    }

    async initializeEmpApi() {
        try {
            const empEnabled = await isEmpEnabled();
            if (!empEnabled) {
                this.showToast('Streaming Disabled', 'EMP API is not enabled for this org/session.', 'warning');
                return;
            }

            setDebugFlag(false);
            onError((error) => {
                const message = this.extractErrorMessage(error);
                this.showToast('Streaming Error', message, 'error');
            });

            await this.subscribeToChannel();
        } catch (error) {
            this.showToast('Initialization Error', this.extractErrorMessage(error), 'error');
        }
    }

    subscribeToChannel() {
        return subscribe(CHANNEL_NAME, -1, (event) => {
            const payload = event?.data?.payload || {};
            const newAlert = {
                id: event?.data?.event?.replayId || Date.now(),
                opportunityName: payload.OpportunityName__c || 'Unknown Opportunity',
                oldStage: payload.OldStage__c || 'Unknown',
                newStage: payload.NewStage__c || 'Unknown',
                amountDisplay: payload.Amount__c != null ? String(payload.Amount__c) : 'N/A',
                ownerName: payload.OwnerName__c || 'Unknown'
            };

            this.alerts = [newAlert, ...this.alerts].slice(0, 20);
            this.showToast(
                'Opportunity Stage Updated',
                `${newAlert.opportunityName}: ${newAlert.oldStage} -> ${newAlert.newStage}`,
                'success'
            );
        }).then((response) => {
            this.subscription = response;
            return response;
        });
    }

    unsubscribeFromChannel() {
        if (!this.subscription) {
            return;
        }

        unsubscribe(this.subscription, () => {
            this.subscription = null;
        });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }

    extractErrorMessage(error) {
        if (!error) {
            return 'Unknown error';
        }

        if (typeof error === 'string') {
            return error;
        }

        if (error.message) {
            return error.message;
        }

        return JSON.stringify(error);
    }
}
