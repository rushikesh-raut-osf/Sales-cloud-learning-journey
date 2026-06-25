public class soqlDemo {
    public static void soqlExer(){
        List<aggregateResult> result = [SELECT AccountId, Sum(Amount) FROM Opportunity Group by AccountId];
        system.debug(result);
        
        for (aggregateResult ar : result){
            system.debug(ar.get('AccountId'));
			system.debug(ar.get('expr0'));
        }
    }
}