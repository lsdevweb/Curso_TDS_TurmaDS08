/*Exercício 11 – Sequência Alternada
Crie uma função chamada sequenciaAlternada().
Solicite um número.
Mostre todos os números até ele alternando o sinal positivo e negativo.
Exemplo
Digite: 10
1
-2
3
-4
5
-6
7
-8
9
-10
Exemplo=​let ativo = true; 
for (let i = 0; i < 4; i++) { 
 console.log(ativo);
 ativo = !ativo; // Inverte o valor atual
}*/
 const prompt = require('prompt-sync')();
function sequenciaAlternada(){
let digitaNum = Number(prompt("Digite um numero:"));
let positivo = true;
for (let i = 0; i < digitaNum; i++) {
  let contador = i + 1;
  if (positivo) {
    console.log( contador );
  } else {
    console.log("-"+ contador );
  }
  positivo = !positivo; 
}
}
sequenciaAlternada();
