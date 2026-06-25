public class CollectionWithLoop {
    public static void collectionLoop(){
        List<Account> accList = new List<Account>();
        Set<Id> accId = new Set<Id>();
		Map<Id, Account> accIdmap = new Map<Id, Account>();
        accList = [SELECT Id, Name 
                         FROM Account 
                         LIMIT 10];
        system.debug('List');
        if(!accList.isEmpty()){
            for(Account acc : accList){
                system.debug(acc);
            }
        }
        
        system.debug('Set');
        if(!accId.isEmpty()){
            for(Id acc : accId){
				system.debug(acc);
            }
        }
        
        system.debug('Map');
        if(!accIdmap.isEmpty()){
            for(Id i : accIdmap.keySet()){
                system.debug(i);
            }
        }

        system.debug('Map');
        if(accIdmap.size() > 0){
            for(Account acc : accIdmap.values()){
                system.debug(acc);
            }
        }

    }
}