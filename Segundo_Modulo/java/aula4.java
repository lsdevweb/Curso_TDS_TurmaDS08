public class aula4 {
    public static void main(String args[]) {
        double valorCompra = 250.00;
        double porcentagemDesconto = 0; 
        
        if (valorCompra >= 300.00) {
            porcentagemDesconto = 15.0;
        }
        else if (valorCompra >= 150.00) {
            porcentagemDesconto = 10.0;
        }
        else {
            porcentagemDesconto = 0.0; 
        }
        
        double valorFinal = valorCompra * (100 - porcentagemDesconto) / 100; 
        
        // Using printf
        System.out.printf("Valor Original: R$ %.2f%n", valorCompra);
        System.out.printf("Porcentagem do desconto: %.2f%%%n", porcentagemDesconto); // Use %.2f for double
        System.out.printf("Valor Final a pagar: R$ %.2f%n", valorFinal);
    }
}
