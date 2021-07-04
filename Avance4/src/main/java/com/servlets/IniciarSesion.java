package com.servlets;

import controles.FabricaFachadaControl;
import controles.IFachada;
import dominio.Admor;
import dominio.Normal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IniciarSesion extends HttpServlet {

    private final IFachada fachada = FabricaFachadaControl.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IniciarSesion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IniciarSesion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("txtcorreo");
        String pass = request.getParameter("txtpassword");

        List<Normal> listaNormal = fachada.buscarTodasNormal();
        List<Admor> listaAdmon = fachada.buscarTodasAdmor();
        for (Admor admor : listaAdmon) {
            if (admor.getEmail().equals(correo) && admor.getContrasenia().equals(pass)) {
                request.setAttribute("admin", admor);
                request.getRequestDispatcher("postAdmin.html").forward(request, response);
            }
        }
        
        for (Normal normal : listaNormal) {
            if (normal.getEmail().equals(correo) && normal.getContrasenia().equals(pass)) {
                request.setAttribute("normal", normal);
                request.getRequestDispatcher("postNormal.html").forward(request, response);
            }
        }
        
        response.sendRedirect("index.html");
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

}
