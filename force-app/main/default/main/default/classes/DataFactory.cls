public class DataFactory {

 

    public static List<Account> createAccount(String accName, Integer count, boolean isInsert){

        

        List<Account> accList = new List<Account>();

        

        for(Integer i=1; i<=count; i++){

            Account acc = new Account();

            acc.Name = 'Test ' + i;

            accList.add(acc);

        }

        

        if(isInsert){

            insert accList;

        }

        return accList;

    }

}