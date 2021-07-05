<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/publicarstyles.css" />
        <title>Publicar post</title>
    </head>

    <body>

        <c:if test="${normal == null && admin == null}">
            <c:redirect url="index.html"></c:redirect>
        </c:if>

        <main id="main">
            <section id="posts">
                <header>
                    <h1>Hola usuario, ¿Qué estás pensando?</h1>
                </header>
                <article class="post">
                    <section class="publicaciones">
                        <textarea class="publicacion" rows="15" required></textarea>

                        <c:if test="${normal != null}">
                            <input
                                type="checkbox"
                                value="PublicacionAnclada"
                                id="anclado"
                                disabled
                                /><label for="anclado" id="lblAnclado">Publicacion Anclada</label>

                            <a href="postNormal.jsp"
                               ><input
                                    type="button"
                                    value="Publicar"
                                    id="publicar-btn"
                                    class="buttons"
                                    /></a>
                            <a href="postNormal.jsp"
                               ><input
                                    type="button"
                                    value="Cancelar"
                                    id="cancelar-btn"
                                    class="buttons"
                                    /></a>
                            </c:if>

                        <c:if test="${admin != null}">
                            <input
                                type="checkbox"
                                value="PublicacionAnclada"
                                id="anclado"
                                /><label for="anclado" id="lblAnclado">Publicacion Anclada</label>

                            <a href="postAdmin.jsp"
                               ><input
                                    type="button"
                                    value="Publicar"
                                    id="publicar-btn"
                                    class="buttons"
                                    /></a>
                            <a href="postAdmin.jsp"
                               ><input
                                    type="button"
                                    value="Cancelar"
                                    id="cancelar-btn"
                                    class="buttons"
                                    /></a>
                            </c:if>

                    </section>
                </article>
            </section>
        </main>
    </body>
</html>
