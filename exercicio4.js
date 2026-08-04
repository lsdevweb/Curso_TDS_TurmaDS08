//Exercício 4 – Moldura-Crie uma função chamada desenharMoldura().Solicite ao usuário:• altura• larguraDesenhe uma moldura utilizando o caractere *.//
 const prompt = require('prompt-sync')();
function desenharMoldura(){
  const altura = Number(prompt("Digite a altura do objeto:");
  const largura = Number(prompt("Digite a largura do objeto:");
  //condição que coloquei para sair um minimo de moldura
  if(altura < 2 || largura < 2){
    console.log("A altura e a largura devem ser de no minimo 2.");
    return;
  }
  //laço de repetição
   for (let i = 0; i < altura; i++) {
    // Primeira ou ultima linha 
    if (i === 0 || i === altura - 1) {
      console.log("*".repeat(largura));
    } else {
      //  espaço Linhas do meio
      //Calcula a quantidade exata de espaços em branco internos descontando as duas laterais.
      const meio = " ".repeat(largura - 2);
      console.log("*" + meio + "*");
    }
  }
}
desenharMoldura();
