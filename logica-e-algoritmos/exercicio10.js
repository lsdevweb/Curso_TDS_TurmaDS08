 const prompt = require('prompt-sync')();
/*Exercício 10 – Escada Invertida
Crie uma função chamada escadaInvertida().
Solicite um número.
Exiba o seguinte padrão.
Exemplo
Digite: 5
12345
1234
123
12
1*/
function escadaInvertida(){
let numero = Number(prompt("Digite um numero positivo:"));
for(let i = numero;i >= 1;i --){
let limite = "";
for(let a = 1;a <= i;a++ ){
limite += a;
}
console.log(limite);
}
}
escadaInvertida();
