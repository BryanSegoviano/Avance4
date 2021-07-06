<%@page import="com.utils.CargarImagen"%>
<%@page import="dominio.Usuario"%>
<%@page import="java.util.Base64"%>
<%@page import="dominio.Normal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/posts.css" />
        <title>Posts</title>
    </head>

    <body>

        <c:if test="${normal == null}">
            <c:redirect url="index.html"></c:redirect>
        </c:if>

        <main id="main">
            <section id="datos">
                <figure>                   
                    <%out.print(CargarImagen.cargarImagen((Normal) session.getAttribute("normal")));%>                           
                </figure>
                <p>${normal.getNombreCompleto()} - Normal</p>
                <a href="publicar.jsp"><input type="button" value="Publicar" id="publicar-btn" class="buttons" /></a>
                <a href="index.html"><input type="button" value="Cerrar Sesion" id="cerrar-sesion-btn" class="buttons" /></a>
            </section>
            <section id="posts">
                <header>
                    <h2>Posts</h2>
                </header>

                <article class="post">
                    <p class="usuario">Usuario1</p>
                    <p class="fecha-post">
                        Fecha: <time><strong>25/06/2021 15:03</strong></time>
                    </p>

                    <h4><mark>Anclado</mark></h4>
                    <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Labore
                        quidem doloribus non velit voluptatum eius rem quis, facilis quos
                        similique corrupti voluptate, nobis, dolor dicta esse. Tempora
                        adipisci assumenda accusantium labore quia atque aliquam suscipit
                        autem, nemo itaque rem sed asperiores beatae ipsam reiciendis
                        delectus accusamus aspernatur repudiandae quasi magni.
                    </p>
                </article>

                <article class="post">
                    <p class="usuario">Usuario1</p>
                    <p class="fecha-post">
                        Fecha: <time><strong>25/06/2021 15:03</strong></time>
                    </p>
                    <a href="publicar.html"><input type="button" value="Editar" class="editar" />
                    </a>
                    <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Labore
                        quidem doloribus non velit voluptatum eius rem quis, facilis quos
                        similique corrupti voluptate, nobis, dolor dicta esse. Tempora
                        adipisci assumenda accusantium labore quia atque aliquam suscipit
                        autem, nemo itaque rem sed asperiores beatae ipsam reiciendis
                        delectus accusamus aspernatur repudiandae quasi magni.
                    </p>
                    <section class="comentarios">
                        <h3>Comentarios</h3>
                        <div>
                            <p class="usuario">Usuario1</p>
                            <p class="fecha-post">
                                Fecha: <time><strong>25/06/2021 15:03</strong></time>
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Consequuntur minima, repellat accusamus labore cupiditate nemo
                                vitae officia aut, optio, quaerat possimus. Delectus voluptatum,
                                repudiandae eius ducimus nostrum doloremque sapiente iste!
                            </p>
                        </div>
                        <textarea class="comentario" rows="2"></textarea>
                        <input type="button" value="Comentar" class="comentar" />
                    </section>
                </article>
            </section>
        </main>
    </body>

</html>
