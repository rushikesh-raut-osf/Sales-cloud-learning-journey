trigger OpportunityStageAlert on Opportunity (after update) {
    List<Opportunity_Stage_Alert__e> eventsToPublish = new List<Opportunity_Stage_Alert__e>();
    Set<Id> ownerIds = new Set<Id>();

    for (Opportunity opp : Trigger.new) {
        if (opp.OwnerId != null) {
            ownerIds.add(opp.OwnerId);
        }
    }

    Map<Id, User> ownersById = ownerIds.isEmpty()
        ? new Map<Id, User>()
        : new Map<Id, User>([
            SELECT Id, Name
            FROM User
            WHERE Id IN :ownerIds
        ]);

    for (Opportunity newOpp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(newOpp.Id);
        if (oldOpp == null) {
            continue;
        }

        if (newOpp.StageName != oldOpp.StageName) {
            eventsToPublish.add(new Opportunity_Stage_Alert__e(
                OpportunityId__c = String.valueOf(newOpp.Id),
                OpportunityName__c = newOpp.Name,
                OldStage__c = oldOpp.StageName,
                NewStage__c = newOpp.StageName,
                Amount__c = newOpp.Amount,
                OwnerName__c = ownersById.containsKey(newOpp.OwnerId)
                    ? ownersById.get(newOpp.OwnerId).Name
                    : null
            ));
        }
    }

    if (!eventsToPublish.isEmpty()) {
        EventBus.publish(eventsToPublish);
    }
}
