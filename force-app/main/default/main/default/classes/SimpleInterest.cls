public class SimpleInterest {
	Decimal p = 10000, r = 10, t = 3;
    public void calculate(){
        Decimal a;
        a = (p * r * t)/100;
        system.debug('SI =' + a);
    }
}