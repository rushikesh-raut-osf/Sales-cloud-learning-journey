public class Rectangle {
	Integer length = 10, breadth = 20;
    public void area(){
        Integer a;
        a = length * breadth;
        system.debug('area =' + a);
    }
    
    public void perimeter(){
        Integer p;
		p = 2 * (length + breadth);
		system.debug('perimeter =' + p);
    }
}