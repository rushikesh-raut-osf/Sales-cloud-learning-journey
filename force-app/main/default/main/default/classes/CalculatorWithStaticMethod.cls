public class CalculatorWithStaticMethod {

    public static Integer addition(Integer num1, Integer num2){

        Integer sum;

        sum = num1 + num2;

        System.debug('Sum = ' + sum);

        return sum;

    }

    

    public static Integer subtraction(Integer num1, Integer num2){

        Integer sub;

        sub = num1 - num2;

        System.debug('Sub = ' + sub);

        return sub;

    }

    

    public static Integer multiplication(Integer num1, Integer num2){

        Integer mul;

        mul = num1 * num2;

        System.debug('Mul = ' + mul);

        return mul;

    }

    

    public static Integer division(Integer num1, Integer num2){

        Integer div;

        div = num1 / num2;

        System.debug('Division = ' + div);

        return div;

    }

}