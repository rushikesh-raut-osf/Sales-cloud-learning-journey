public class mapDemo {
    public static void mapDemo1(){
        Map<Integer, String> mapDemoScript = new Map<Integer, String>();
        mapDemoScript.put(7, 'Red');
		mapDemoScript.put(2, 'Blue');
        system.debug('map Contains....' + mapDemoScript);
    }
}