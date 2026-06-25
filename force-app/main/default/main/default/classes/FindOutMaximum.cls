public class FindOutMaximum {
    public static void findMaz(Integer l, Integer b){
        if(l > b){
            system.debug('Number l is maximum');
        } else {
            system.debug('Number b is maximum');
        }
    }
    
     public static void voteEligibilty(Integer age){
        if(age >= 18){
            system.debug('Eligible for vote');
        } else {
            system.debug('Not eligible');
        }
    }
    
     public static void evenOdd(Integer num){
        if(Math.mod(num, 2) == 0){
            system.debug('number is even');
        } else {
            system.debug('number is odd');
        }
    }

     public static void inchFeet(Integer totalInches){
        if(totalInches >= 12){
            Integer feet = totalInches / 12;
            Integer inches = Math.mod(totalInches, 12);
            system.debug('feet =' + feet);
			system.debug('inch =' + inches);
        }
    }
}