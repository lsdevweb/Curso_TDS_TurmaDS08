//crie uma classe chamada tabuadaSeven.
//Declare uma variavel int multiplicador = 1.
//Use a estrutura while para calcular e exibir no terminal a tabuada do 7( de 7*1 á 7*10)usando o System.out.printf

public class tabuadaSeven {
    public static void main(String[] args) {
        int numero = 7;
        int multiplicador = 1; 

        while (multiplicador <= 10) {
            System.out.printf("%d x %d = %d\n", numero, multiplicador, (numero * multiplicador));
            multiplicador++;        
        }
    }
}