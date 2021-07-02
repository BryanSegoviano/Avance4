<%-- 
    Document   : crear_cuenta
    Created on : 2 jul. 2021, 13:38:00
    Author     : Alfon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear cuenta</title>
        <link rel="stylesheet" href="css/estilo_crear_cuenta.css">
    </head>
    <body>
        <main>
            <header>
                <h1>Crear cuenta</h1>
                <label class="menasje1" id="mensaje1">Ingrese los datos solicitados para crear una cuenta
                    nueva</label>
            </header>
            <section>
                <form action="CrearCuenta" method="POST" id="formulario_registro" class="registro">
                    <div class="nombre">
                        <input type="text" placeholder="Nombre" required id="registro_nombre" name="nombre">
                        <input type="text" placeholder="Apellidos" required id="registro_apellidos" name="apellido">
                    </div>
                    <p></p>
                    <label class="sexo">Hombre </label> 
                    <input type="radio" name="genero" id="checkboxH" value="HOMBRE">
                    <label class="sexo"> Mujer</label>
                    <input type="radio" name="genero" id="checkboxM" value="MUJER">
                    <p></p>
                    <label >Telefono:</label><input type="tel" required name="telefono">
                    <p></p>
                    <label>Fecha de nacimiento: </label>
                    <input type="date" name="fechaNacimiento" required/>
                    <p></p>
                    <label>Avatar:</label>
                    <input required type="file" name="avatar" accept="image/*" formenctype="multipart/form-data">
                    <p></p>
                    <div class="label_ubicacion">
                        <label for="estado">Estado: </label><select required name="estado" id="estado">
                            <option value="Sonora">Sonora</option>
                            <option value="Sinaloa">Sinaloa</option>
                        </select>

                    </div>
                    <div>
                        <label>Municipio: </label>
                        <select name="municipio" id="registro_ciudad">
                            <optgroup label="Sonora">
                                <option value="Obregon">Obregon</option>
                                <option value="Hermosillo">Hermosillo</option>
                                <option value="Navojoa">Navojoa</option>
                            </optgroup>
                            <optgroup label="Sinaloa">
                                <option value="Los Mochis">Los Mochis</option>
                                <option value="Culiacán"> Culiacán</option>
                                <option value="Guasave">Guasave</option>
                            </optgroup>
                        </select>
                    </div>
                    <p></p>
                    <input type="email" placeholder="Correo Electronico" required name="correoElectronico"
                           id="registro_correo" pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$">
                    <p></p>
                    <input type="password" placeholder="Contraseña" name="contrasenia" id="registro_contra">
                    <footer>
                        <a href="index.html"><input type="submit" value="Registrarse" id="registrarse"></a>
                        <a href="index.html"><input type="button" value="Cancelar" id="cancelar"></a>
                    </footer>
                </form>
            </section>
        </main>
    </body>
</html>
