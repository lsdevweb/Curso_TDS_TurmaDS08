/*Exercício 12 – Número Triangular
Crie uma função chamada numeroTriangular().
Solicite um número inteiro.
Verifique se ele é um número triangular.
Caso seja, informe ao usuário.
Caso contrário, informe que não é.*/

 const prompt = require('prompt-sync')();
function verificarTriangular(numero) {
  if (numero < 0) {
    console.log("Este número não é Triangular");
    return;
  }
//Para encontar o i
  let i = 1;
  while (i * (i + 1) < numero * 2) {
    i++;
  //Enquanto a multiplicação de dois números seguidos for menor que o dobro do número digitado,cai somar +1 no i.
  }
  // Formula
  if ((numero * 2) / i === i + 1) {
    console.log("Este número é Triangular");
  } else {
    console.log("Este número não é Triangular");
  }
}
let numeroDigitado = Number(prompt("Digite o numero:"));
verificarTriangular(numeroDigitado);
