public class RectangleWithConstructor {
    
    public static void area(Integer length, Integer breadth){
        Integer a;
        a = length * breadth;
        system.debug('area =' + a);
    }
    
    public static void perimeter(Integer length, Integer breadth){
        Integer p;
		p = 2 * (length + breadth);
		system.debug('perimeter =' + p);
    }
}