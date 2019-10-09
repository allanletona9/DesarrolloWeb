<?php
    require "conexionbd.php";

    /*String de conexion*/
    $conexion = conexion_bd('contactodw', 'root', '');

    if(!$conexion)
    {
        //header('Location: error.php');
        die();
    }

    $errores = "";
    $enviado = "";

    if(isset($_POST['submit']))
    {
        $nombre = $_POST['nombre'];
        $correo = $_POST['correo'];
        $mensaje = $_POST['mensaje'];

        if(!empty($nombre)){
            $nombre = trim($nombre);
            $nombre = filter_var($nombre, FILTER_SANITIZE_STRING);
        }
        else {
            $errores .= "Ingrese un nombre" . "<br>";
        }

        if(!empty($nombre)){
            $correo = filter_var($correo, FILTER_SANITIZE_EMAIL);
            
            if(!filter_var($correo, FILTER_VALIDATE_EMAIL)){
                $errores .= "Ingrese un correo valido". "<br>";
            }
            
        }

        else {
            $errores .= "Ingrese un correo" . "<br>";
        }

        if(!empty($mensaje))
        {
            $mensaje = htmlspecialchars($mensaje);
            $mensaje = trim($mensaje);
            $mensaje = stripslashes($mensaje);

        }
        else {
            $errores .= "Ingrese un mensaje" . "<br>";
        }

        if(!$errores)
        {
            $enviar_a = 'se.allanletona@gmail.com';
            $asunto = 'Correo Enviado Desde Curriculum';
            $mensaje_preparado = "De: ".$nombre."\n";
            $mensaje_preparado .= "Correo: ".$correo."\n";
            $mensaje_preparado .= "Mensaje ".$mensaje;

            //mail($enviar_a, $asunto, $mensaje_preparado);

            /*Query para insertar los datos a la BD*/
            $sqlInsertarDatos = $conexion->prepare('
                INSERT INTO datos(nombre, correo, mensaje)
                VALUES (:nombre, :correo, :mensaje)');

            $sqlInsertarDatos->execute(array(
                ':nombre' => $nombre,
                ':correo' => $correo,
                ':mensaje' =>$mensaje
            ));

            header('Location: contacto.php');


            $enviado = true;

        }
    }

        require "contacto.view.php";


?>