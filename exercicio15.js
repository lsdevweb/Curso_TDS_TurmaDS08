const prompt = require('prompt-sync')();
/*sequencia de letras, de a ate a letra digitada;*/
let contador = "";

function sequenciaLetras() {
  let letra = prompt("Digite uma letra: ").toLowerCase();
  const alfabeto = "abcdefghijklmnopqrstuvwxyz";

  for (let i = 0; i < alfabeto.length; i++) {
    let letraAtual = alfabeto[i];
    contador += letraAtual + " ";
    console.log(contador);

    // Se chegou na letra que o usuário digitou, o laço para
    if (letraAtual === letra) {
      break; 
    }
  }
}

sequenciaLetras();
