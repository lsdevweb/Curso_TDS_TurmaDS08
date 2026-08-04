const prompt = require (`prompt-sync`)();
//Criar uma chamada desenharX()-Solicitar um numero impar,maior ou igual a 5
//Desenhe a letra x utilizando *
function desenharX(){
let numero ="";
  while (true) {
    numero = Number(prompt("Digite um número ímpar maior ou igual a 5:"));
    if (numero >= 5 && numero % 2 !== 0) {
      break;
    }
   console.log("Digite um número válido");
  }
  for (let i = 1;i <=numero;i++){
  let linha= "";
  for(let a = 1; a <= numero; a++){
    if(i=== a || a ===(numero - i + 1)){
          linha += "*";
    }else {
        linha += " "; //parte espaço em branco aonde não tem *
      }
  }
  console.log(linha);
  }
  
}
desenharX();