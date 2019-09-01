var usuario = prompt("Cual es tu peso?");
      var planeta = parseInt(prompt("Elige tu planeta.\n 1. Marte \n 2. Jupiter"));
      var peso = parseInt(usuario);
      var g_tierra = 9.8;
      var g_marte = 3.7;
      var g_jupiter = 24.8;
      var peso_final;

      if(planeta==1)
      {
        peso_final = (peso*g_marte)/g_tierra;
        planeta ="Marte";
      }
      else if(planeta==2) {
        peso_final = (peso*g_jupiter)/g_tierra;
        planeta = "Jupiter";
      }
      else {
        document.write("No selecciono una opcion valida\n");
        peso_final = 0;
        planeta = "Kripton"
      }
      peso_final = parseInt(peso_final);
      document.write("Tu peso en "+planeta+" es: <strong>"+peso_final+" KG</strong>");