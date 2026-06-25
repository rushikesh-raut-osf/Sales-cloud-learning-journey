public class sObjectDemo {
    public static ID createAccount(){
        Account acc = new Account();
		acc.Name = 'Test';
        acc.Phone = '8652685823';
		acc.Active__c = 'Yes';
        insert acc;
        return acc.Id;
    }
    
    public static void createContact(){
        Contact con = new Contact();
        con.FirstName = 'John';
        con.LastName = 'Doe';
        con.Phone = '8652685823';
        con.Email = 'john.doe@test.com';

        insert con;
    }
    
     public static void createOpportunity(){

        Opportunity opp = new Opportunity();
        opp.Name = 'New Business Deal';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today().addDays(30);

        insert opp;
    }

    public static void createEmployee() {
        Account acc = [
            SELECT Id
            FROM Account
            WHERE Name = 'MGREWQ'
            LIMIT 1
        ];
        Employee__c emp = new Employee__c(
            Name = 'John Smith',
            Salary__c = 75000,
            Department__c = 'IT',
            Account__c = acc.Id
        );
    
    	insert emp;
    }
    
     public static void createEmployee2() {
        Employee__c emp = new Employee__c();
         	Id accId = createAccount();
            emp.Name = 'Rushikesh Raut';
            emp.Salary__c = 100000;
            emp.Department__c = 'Finance';
         	emp.Account__c = accId;
    		insert emp;
    }
}