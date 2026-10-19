public class tabuadacomFor {
    public static void main(String args[]) {
        for (int tabuada = 3; tabuada <= 6; tabuada++) {
            System.out.printf("--- Tabuada do %d ---%n", tabuada);
            for (int i = 1; i <= 10; i++) {
                System.out.printf("%d x %d = %d%n", tabuada, i, i * tabuada);
            }
            
            System.out.println(); 
        } 
    }
}

