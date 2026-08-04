/*https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Date-link de estudo de sintaxe*/
 const prompt = require('prompt-sync')();
/*Exercício 3 – Relógio Digital
Crie uma função chamada relogioDigital().
Simule um relógio digital mostrando todas as horas do dia.
O formato deve ser:
00:00
00:01
00:02
...
23:59
Utilize apenas estruturas de repetição.*/
function relogioDigital() {
  let horas_dia = [];
  for (let hora = 0; hora < 24; hora++) {
    for (let minuto = 0; minuto < 60; minuto++) {
      // Formata para ter sempre 2 dígitos(pesquisado)
      const hFormatada = String(hora).padStart(2, '0');
      const mFormatado = String(minuto).padStart(2, '0');
      horas_dia.push(hFormatada + ":" + mFormatado);
    }
  }
 return horas_dia;
}
const resultado = relogioDigital();
// pesquisado para sair um embaixo do outro
console.log(resultado.join( '\n') );

