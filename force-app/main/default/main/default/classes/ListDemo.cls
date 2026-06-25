public class ListDemo {
    public static void demo(){
        List<String> color = new List<String>();
		color.add('red');
        color.add('blue');
        color.add('neon green');
        color.add('black');
        color.add('purple');
		system.debug('list contains .... ' + color);
		system.debug('list contains color at index 4.... ' + color[4]);	
    }
    
     public static void demo1(){
        List<Integer> intList = new List<Integer>();
		List<Integer> intList2 = new List<Integer>();
		intList.add(50);
        intList.add(1025);
        intList.add(9857);
        intList.add(8574);
        intList.add(2523);
		system.debug('list contains .... ' + intList);
		system.debug('list contains color at index 4.... ' + intList[4]);	
        intList.add(2, 1000);
		system.debug('list contains .... ' + intList);
        intList.set(1, 2000);
		system.debug('list contains .... ' + intList);
		intList2.add(5);
        intList2.add(7);
        intList2.add(6);
        intList2.add(3);
        intList2.add(2);
		intList.addAll(intList2);
		system.debug('list contains .... ' + intList);
		system.debug('list contains .... ' + intList2);
		intList2.clear();
		system.debug('list contains 1111 .... ' + intList2);

		intList2 = intList.clone();
        system.debug('list contains 1 .... ' + intList);
		system.debug('list contains 2.... ' + intList2);
        
         if(intList.contains(10)){
             system.debug('Yes');
         } else {
             system.debug('no');
         }

         if(intList.equals(intList2)){
             system.debug('equals');
         } else {
             system.debug('Not equals');
         }
		system.debug(intList.get(2));
        system.debug(intList.indexOf(10));
         
         if(intList.isEmpty()){
             system.debug('Empty');
         } else {
             system.debug('Not Empty');
         }
         
         intList.remove(4);
		system.debug(intList);
		intList.sort();
		system.debug('sort : ' + intList);
    }
    
    public static List<Account>	demoAcc(){
        List<Account> accList = new List<Account>();
        for (Integer i=1; i<=5; i++) {
            Account acc = new Account();
			acc.Name = 'Briliant-' + i;
			acc.Phone = '8652685823';
			accList.add(acc);
        }
		insert accList;
		return accList;
    }

    public static void demo3(){
        List<Opportunity> oppList = new List<Opportunity>();
        List<Account> accList = demoAcc();
        for (Integer i=0; i<5; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'New Business Deal' + i;
            opp.StageName = 'Prospecting' + i;
            opp.CloseDate = Date.today().addDays(30);
            opp.AccountId = accList[i].Id;
            oppList.add(opp);
        }
		insert oppList;
    }
    
    public static void demo4() {
    
        List<Employee__c> employeeList = new List<Employee__c>();
        List<Account> accList = demoAcc();
    
        for (Integer i = 0; i < 5; i++) {
    
            Employee__c emp = new Employee__c();
    
            emp.Name = 'Rushikesh Raut ' + i;
            emp.Salary__c = 100000;
            emp.Department__c = 'Finance';
            emp.Account__c = accList[i].Id;
    
            employeeList.add(emp);
        }
    
        insert employeeList;
    }
}