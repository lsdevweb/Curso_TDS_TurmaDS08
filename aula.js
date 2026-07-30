const prompt = require (`prompt-sync`)();
/*Lista de Exercicios-Professor Adriano-Funções*/
/*ATIVIDADE 1*/
let contador ="";
function piramideNumerica(){
let numero = Number(prompt("Digite o número maior que zero(0):"));
for (let i= 1;i<= numero;i++){
 contador += i + " "; 
    console.log(contador)
}
}
piramideNumerica();

