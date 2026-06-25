public class Exercise {

    public static void executePractice() {

        // Step 1: Insert 5 Accounts using List
        List<Account> accList = new List<Account>();

        for(Integer i = 1; i <= 5; i++) {
            accList.add(new Account(Name = 'Test Account ' + i));
        }

        if(!accList.isEmpty()) {
            insert accList;
        }

        // Step 2: Insert 5 Opportunities related to Accounts
        List<Opportunity> oppList = new List<Opportunity>();

        for(Account acc : accList) {
            Opportunity opp = new Opportunity(
                Name = 'Opportunity for ' + acc.Name,
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(30),
                AccountId = acc.Id
            );

            oppList.add(opp);
        }

        if(!oppList.isEmpty()) {
            insert oppList;
        }

        // Step 3: Create Set of Account Ids
        Set<Id> accountIds = new Set<Id>();

        for(Account acc : accList) {
            accountIds.add(acc.Id);
        }

        // Create Set of Opportunity Ids
        Set<Id> opportunityIds = new Set<Id>();

        for(Opportunity opp : oppList) {
            opportunityIds.add(opp.Id);
        }

        System.debug('Account Id Set => ' + accountIds);
        System.debug('Opportunity Id Set => ' + opportunityIds);

        // Step 4: Create Map<Opportunity Id, Opportunity>
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>();

        for(Opportunity opp : oppList) {
            oppMap.put(opp.Id, opp);
        }

        // Step 5: Iterate Map through Keys
        System.debug('===== Iterating Map Through Keys =====');

        for(Id oppId : oppMap.keySet()) {
            Opportunity opp = oppMap.get(oppId);

            System.debug(
                'Opp Id: ' + oppId +
                ' | Opp Name: ' + opp.Name +
                ' | Account Id: ' + opp.AccountId
            );
        }

        // Step 6: Iterate Map through Values
        System.debug('===== Iterating Map Through Values =====');

        for(Opportunity opp : oppMap.values()) {
            System.debug(
                'Opp Name: ' + opp.Name +
                ' | Stage: ' + opp.StageName +
                ' | Account Id: ' + opp.AccountId
            );
        }
    }
}