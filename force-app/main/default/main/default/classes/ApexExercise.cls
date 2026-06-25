public class ApexExercise {
    Integer length = 10, breadth = 20;
    public void area(){
        Integer a;
        a = length * breadth;
        system.debug('area =' + a);
    }
    
    public Integer perimeter(Integer length, Integer breadth){
        Integer p;
		p = 2 * (length + breadth);
		system.debug('perimeter =' + p);
        return p;
    }
}