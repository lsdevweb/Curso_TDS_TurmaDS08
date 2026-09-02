/*Exercício 9 – Soma Acumulada
Crie uma função chamada somaAcumulada().
Solicite um número inteiro positivo.
Mostre a soma acumulada até cada linha.
Exemplo
Digite: 5
1 = 1
1 + 2 = 3
1 + 2 + 3 = 6
1 + 2 + 3 + 4 = 10
1 + 2 + 3 + 4 + 5 = 15*/
const prompt = require(`prompt-sync`)();
function somaAcumulada() {
    let numero = Number(prompt("Digite um número inteiro positivo: "));
    let soma = 0;

    for (let i = 1; i <= numero; i++) {
        soma = soma + i
        let acumulado = "";
        //  do 1 até o "i"
        for (let a = 1; a <= i; a ++) {
     //  compara 'a' com 'i' 
            acumulado += a + (a < i ? " + " : "");
        }

        console.log(acumulado + " = " + soma);
    }
}

somaAcumulada();