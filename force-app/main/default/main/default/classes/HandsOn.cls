public class HandsOn {
    public static void problem1(){
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
		Set<Id> accIds = new Set<Id>();
        if (accList != null && !accList.isEmpty()){
            for (Account acc : accList){
                accIds.add(acc.Id);
            }
            system.debug('These are account IDS' + accIds);
        }
    }
    
     public static void problem2(){
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
        Map<Id, Account> accMap = new Map<Id, Account>();
        for (Account acc : accList) {
            accMap.put(acc.Id, acc);
        }
        for (Id accId : accMap.keySet()) {
            Account accRecord = accMap.get(accId);
            System.debug('Account ID: ' + accId + ', Name: ' + accRecord.Name);
        }

    }
    	public static void problem3(){
            // Step 1: Query 5 Account records
            List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
            
            // Step 2: Create Map directly from list (no loop)
            Map<Id, Account> accMap = new Map<Id, Account>(accList);
            
            // Step 3: Display values of the map
            for (Account acc : accMap.values()) {
                System.debug('Account ID: ' + acc.Id + ', Name: ' + acc.Name);
            }

    	}
}