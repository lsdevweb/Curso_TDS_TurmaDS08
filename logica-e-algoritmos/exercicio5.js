/*Exercício 5 – Escada Alinhada à Direita
Crie uma função chamada escadaDireita().
Solicite um número.
Desenhe uma escada utilizando *.

Exemplo
Digite: 5
*
**
***
****
******/

 const prompt = require('prompt-sync')();

function escadaDireita(){
let numero = Number(prompt("Digite o número maior que zero(0):"));
for (let i= 1;i<= numero;i++){
let espacos = " ".repeat(numero - i);
let asteriscos = "*".repeat(i);
console.log(espacos + asteriscos);

}
}
escadaDireita();
