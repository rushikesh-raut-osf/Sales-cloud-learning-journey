public class Circle {
	Decimal r = 7;
    public void circlearea(){
        Decimal ci;
        ci = 3.14 * 7 * 7;
		system.debug('Circle Area =' + ci);
	}
    
    public void circumference(){
        Decimal cc;
		cc = 3.14 * 2 * r;
		system.debug('circumference =' + cc);
    }
}