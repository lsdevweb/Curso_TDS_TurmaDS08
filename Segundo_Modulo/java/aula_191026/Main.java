public class Main{
public static void main(String[]args){
    ContaBancaria conta1 = new ContaBancaria("Carlos" , "1001");
    ContaBancaria conta2 = new ContaBancaria("Mariana" , "1002");
    conta1.depositar(350.00);
    conta2.depositar(1200.00);
  System.out.println("---Extrato Conta  Carlos---");
  conta1.exibirExtrato();
  System.out.println("\n---Extrato Conta Mariana---");
 conta2.exibirExtrato();
}
};