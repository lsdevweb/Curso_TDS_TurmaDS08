//Um número perfeito é um número natural que é igual à soma de todos os seus divisores próprios positivos (excluindo ele mesmo)

public class numeroPerfeito{
    public static void main(String args[]){
        int numero = 28;
        int total = 0;
        for(int i= 1;i < numero;i++){
            if(numero % i == 0){
                total += i;
                System.out.printf("%d %n",i);
            }
        }
        if(total == numero){
            System.out.println("É um número perfeito");
        }else{
            System.out.println("Não é  um número perfeito");
        }
    }
}