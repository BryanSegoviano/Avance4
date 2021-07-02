/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import controles.FabricaFachadaControl;
import controles.IFachada;
import dominio.Municipio;
import dominio.Normal;
import dominio.Usuario;
import dominio.enums.Genero;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Bryan
 */
public class CrearCuenta extends HttpServlet {

    private final IFachada fachada = FabricaFachadaControl.getInstance();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrearCuenta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearCuenta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String genero = request.getParameter("genero");
        String telefono = request.getParameter("telefono");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String estado = request.getParameter("estado");
        String municipio = request.getParameter("municipio");
        String correo = request.getParameter("correoElectronico");
        String contrasenia = request.getParameter("contrasenia");
//        Part avatar = request.getPart("avatar");

        Genero generoEnum = getGeneroEnum(genero);
        Date fechaConvertida = FechaConvertida(fechaNacimiento);
        Municipio municipioConvertido = getMunicipio(municipio);
//        byte[] avatarConvertido = imagenConvertida(avatar);

        Usuario nuevoUsuario = new Normal(nombre,
                correo,
                contrasenia,
                telefono,
                municipioConvertido,
                fechaConvertida,
                generoEnum);
        
        System.out.println(nuevoUsuario);
        fachada.guardarNormal((Normal) nuevoUsuario);
        request.getRequestDispatcher("index.html").forward(request, response);
        
//        System.out.println(nombre);
//        System.out.println(apellido);
//        System.out.println(generoEnum);
//        System.out.println(telefono);
//        System.out.println(fechaConvertida);
//        System.out.println(estado);
//        System.out.println(municipioConvertido);
//        System.out.println(correo);
//        System.out.println(contrasenia);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Genero getGeneroEnum(String genero) {
        return genero.equals(Genero.HOMBRE.toString()) ? Genero.HOMBRE : Genero.MUJER;
    }

    private Municipio getMunicipio(String municipio) {
        List<Municipio> municipioLista = fachada.buscarComoMunicipio(municipio);
        Municipio municipioConvertido = municipioLista.get(0);
        return municipioConvertido;
    }

    private Date FechaConvertida(String fechaNacimiento) {
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimientoConvertida = null;
        try {
            fechaNacimientoConvertida = formatoFecha.parse(fechaNacimiento);
        } catch (ParseException ex) {
            System.out.println(ex);
        }
        return fechaNacimientoConvertida;
    }

    private byte[] imagenConvertida(Part avatar) {
//      String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        try {
            InputStream fileContent = avatar.getInputStream();
            byte[] avatarConvertido = IOUtils.toByteArray(fileContent);
            return avatarConvertido;
        } catch (IOException ex) {
            System.out.println(ex);
        }
        return null;
    }

}
