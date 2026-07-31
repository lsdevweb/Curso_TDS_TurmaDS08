const prompt = require (`prompt-sync`)();

function trianguloNumeros(){
let numero = Number(prompt("Digite o número maior que zero(0):"));
for (let i= 1;i<= numero;i++){
let repete = "";
for(let a = 1;a <= i;a++){
repete = repete +i ;
}console.log(repete)
    
}
}
trianguloNumeros();
