public class ContaBancaria {
    //Atributos
    String titular;
    String numeroConta; 
    
    double saldo;
    //Construtor
    public ContaBancaria(String titular,String numeroConta){
        this.titular = titular;
        this.numeroConta = numeroConta;
        this.saldo = 0.0;
    }
    //Metodo
    public void depositar(double valor){
        this.saldo += valor;
    }
    //exibir extrato
     public void exibirExtrato(){
      System.out.printf("Titular: %s%n",this.titular);
      System.out.printf("Número Da Conta: %s%n",this.numeroConta);
      System.out.printf("Saldo Atualizado: R$ %.2f%n" , this.saldo);
    }
  };