const prompt = require('prompt-sync')();

function somaFatoriais(){
let numDigitado= Number(prompt("Digite um número:"));
let soma=0;
for(let i=1;i<=numDigitado;i++){
    let fatorial =1;
    for(let j=1;j<=i;j++){
        fatorial = fatorial * j;
    }
    soma =soma + fatorial;
}
console.log("A soma dos fatoriais de 1 até " + numDigitado + " é: " + soma);
}
somaFatoriais();
