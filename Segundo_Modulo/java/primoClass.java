//Soma do numeros primos no intervalo até 1000
public class primoClass {
public static void main(String args[]) {
int total=0;
 for (int i=0;i<=1000; i++) {
 boolean ehprimo = true;
 for(int j= i-1;j >=2;j--){
    if(i % j == 0){
 ehprimo = false;
    }
 }
    if(ehprimo){
   total =total + i;
    }
 }
 System.out.print(total); 
 } 
 } 


