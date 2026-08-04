const prompt = require (`prompt-sync`)();
/*Exercicio 8-Tabela de Multiplicação-
Criar uma função chamada tabelaMultiplicao()
Exibir de 1 a 10*/
function tabelaMultiplicacao(){
    let num = parseInt(prompt("Digite um número para ver a tabuada:"));
    let tabuada ="";
    for(count =1;count<=10;count++)
        tabuada += num+" x "+count+" = "+
               num*count+"\n";
        console.log(tabuada);
}

tabelaMultiplicacao();

