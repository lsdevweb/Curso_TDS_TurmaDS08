//Exercício 6 – Pirâmide Completa-Crie uma função chamada piramideCompleta(). Solicite um número inteiro positivo.Exiba uma pirâmide centralizada*/
 const prompt = require('prompt-sync')();


function piramideCompleta() {
  let numero = Number(prompt("Digite o número de linhas da pirâmide:"));

  for (let i = 1; i <= numero; i++) {
    let espacos = " ".repeat(numero - i);
    let asteriscos = "*".repeat(2 * i - 1);
    console.log(espacos + asteriscos);
  }
}

piramideCompleta();
