const prompt = require('prompt-sync')();
function desenharQuadrado() {
    let tam = Number(prompt("Digite o tamanho do quadrado: "));
    let caractere = prompt("Digite o caractere para desenhar o quadrado: ");
    for (let i = 0; i < tam; i++) {
        let linha = '';
        for (let a= 0; a < tam; a++) {
            linha += caractere;
        }
        console.log(linha);
    }
     
}
desenharQuadrado();
