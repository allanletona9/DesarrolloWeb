/*Imprime el numero dependiendo del parametro que esta recibiendo del html*/
function imprimirValores(numero)
{
    document.calculator.ans.value+=numero; /*Funcion predeterminada de js para poder imprimir valores*/
}

function resultado()
{
    document.calculator.ans.value=eval(document.calculator.ans.value); /*Funcion predeterminada para realizar el calculo de la operacion*/
}