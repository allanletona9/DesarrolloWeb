
function aleatorio() 
{    
   var randomArr = Array.apply(null, Array(10)).map(function(item, index)
 {
    return Math.floor(Math.random() * 50)
});
document.getElementById('resultado').innerHTML = JSON.stringify(randomArr, 0, 4);
    
    var arr1 = randomArr[0];
    var arr2 = randomArr[1];
    var arr3 = randomArr[2];
    var arr4 = randomArr[3];
    var arr5 = randomArr[4];
    var arr6 = randomArr[5];
    var arr7 = randomArr[6];
    var arr8 = randomArr[7];
    var arr9 = randomArr[8];
    var arr10 = randomArr[9];
    
     document.getElementById('arreglo1').innerHTML = arr1; 
     document.getElementById('arreglo2').innerHTML = arr2; 
     document.getElementById('arreglo3').innerHTML = arr3; 
     document.getElementById('arreglo4').innerHTML = arr4; 
     document.getElementById('arreglo5').innerHTML = arr5; 
     document.getElementById('arreglo6').innerHTML = arr6; 
     document.getElementById('arreglo7').innerHTML = arr7; 
     document.getElementById('arreglo8').innerHTML = arr8; 
     document.getElementById('arreglo9').innerHTML = arr9; 
     document.getElementById('arreglo10').innerHTML = arr10; 

    arregloAOrdenar=burbuja(randomArr); 

    var maximo = Math.max(...randomArr);
    var minimo = Math.min(...randomArr);
    document.getElementById("minimo").innerHTML = minimo;
    document.getElementById("maximo").innerHTML = maximo;
}
  
    function mostrar()
    {
    var arr1 = arregloAOrdenar[0];
    var arr2 = arregloAOrdenar[1];
    var arr3 = arregloAOrdenar[2];
    var arr4 = arregloAOrdenar[3];
    var arr5 = arregloAOrdenar[4];
    var arr6 = arregloAOrdenar[5];
    var arr7 = arregloAOrdenar[6];
    var arr8 = arregloAOrdenar[7];
    var arr9 = arregloAOrdenar[8];
    var arr10 = arregloAOrdenar[9];
        
     document.getElementById('arreglo1').innerHTML = arr1; 
     document.getElementById('arreglo2').innerHTML = arr2; 
     document.getElementById('arreglo3').innerHTML = arr3; 
     document.getElementById('arreglo4').innerHTML = arr4; 
     document.getElementById('arreglo5').innerHTML = arr5; 
     document.getElementById('arreglo6').innerHTML = arr6; 
     document.getElementById('arreglo7').innerHTML = arr7; 
     document.getElementById('arreglo8').innerHTML = arr8; 
     document.getElementById('arreglo9').innerHTML = arr9; 
     document.getElementById('arreglo10').innerHTML = arr10; 
        
     document.getElementById('resultado1').innerHTML = arregloAOrdenar;     
    }

    function burbuja(arreglo){
    for(i=0;i<(arreglo.length-1);i++)
    for(j=0;j<(arreglo.length-i);j++){
        if(arreglo[j]>arreglo[j+1]){
             aux=arreglo[j];
             arreglo[j]=arreglo[j+1];
             arreglo[j+1]=aux;
        }
    }
    return arreglo
}