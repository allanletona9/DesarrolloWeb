function imprimirValores(numero)
{
    document.calculator.ans.value+=numero;
}

function resultado()
{
    document.calculator.ans.value=eval(document.calculator.ans.value);
}