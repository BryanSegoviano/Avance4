package dominio;

import dominio.Comentario;
import dominio.Usuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-07-02T15:34:40")
@StaticMetamodel(Comun.class)
public class Comun_ extends Post_ {

    public static volatile SingularAttribute<Comun, Usuario> usuario;
    public static volatile ListAttribute<Comun, Comentario> comentarios;

}