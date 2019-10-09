<!DOCTYPE html>
<html>
    <head>
        <title>Contacto</title>
        <link rel="stylesheet" href="css/estiloContacto.css">
    </head>
    
    <body>
        <div class="contenedor">
            <h1><center>CONTACTO</center></h1>
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<?php if(!$enviado && isset($nombre)) echo $nombre?>">
                <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo" value="<?php if(!$enviado && isset($correo)) echo $correo?>">
                <textarea name="mensaje" class="form-control" id="mensaje" placeholder="Mensaje"><?php if(!$enviado && isset($mensaje)) echo $mensaje?></textarea>

                <?php if(!empty($errores)): ?>
                    <div class="alert error">
                        <?php echo $errores; ?>
                    </div>
                <?php elseif($enviado): ?>
                    <div class="alert correcto">
                        <p>Enviado Correctamente</p>
                    </div>
                <?php endif ?>

                <input type="submit" name="submit" class="btn btn-primary"value="Enviar Mensaje">

                <nav><a href="index.html" class="regresar"> Regresar </a></nav>
            </form>
        </div>
    </body>
</html>