/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import beans.Cesta;
import beans.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.swing.UIManager.getString;
import utils.ConexionDB;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(name = "servletPro", urlPatterns = {"/servletPro"})
public class servletPro extends HttpServlet {

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
        String op = request.getParameter("op");
        if (op.equals("listar")) {

            try {
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select*from productos");
                ResultSet rs = psta.executeQuery();

                ArrayList<Producto> lista = new ArrayList<>();
                while (rs.next()) {
                    Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getInt(7));
                    lista.add(p);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("catalogo.jsp").forward(request, response);

            } catch (Exception e) {
            }
        } else if (op.equals("comprar")) {
            HttpSession sesion = request.getSession();

            ArrayList<Cesta> carrito;

            if (sesion.getAttribute("carrito") == null) {
                carrito = new ArrayList<Cesta>();
            } else {
                carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            }
            String cod = request.getParameter("cod");
            String nom = request.getParameter("nom");
            double pre = Double.parseDouble(request.getParameter("pre"));

            int indice = -1;
            int can = 0;

            for (int i = 0; i < carrito.size(); i++) {
                Cesta c2 = carrito.get(i);
                if (c2.getCod().equals(cod)) {
                    indice = i;
                    can = c2.getCan();
                    break;
                }
            }
            if (indice == -1) {
                Cesta c = new Cesta(cod, nom, pre, 1);
                carrito.add(c);
            } else {
                int can2 = can + 1;
                Cesta c3 = new Cesta(cod, nom, pre, can2);
                carrito.set(indice, c3);
            }
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("cesta.jsp");

        } else if (op.equals("agregar")) {
            HttpSession sesion = request.getSession();

            ArrayList<Cesta> carrito;

            if (sesion.getAttribute("carrito") == null) {
                carrito = new ArrayList<Cesta>();
            } else {
                carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            }
            String cod = request.getParameter("cod");
            String nom = request.getParameter("nom");
            double pre = Double.parseDouble(request.getParameter("pre"));

            int indice = -1;
            int can = 0;

            for (int i = 0; i < carrito.size(); i++) {
                Cesta c2 = carrito.get(i);
                if (c2.getCod().equals(cod)) {
                    indice = i;
                    can = c2.getCan();
                    break;
                }
            }
            if (indice == -1) {
                Cesta c = new Cesta(cod, nom, pre, 1);

                carrito.add(c);
            } else {
                int can2 = can + 1;
                Cesta c3 = new Cesta(cod, nom, pre, can2);
                carrito.set(indice, c3);
            }
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("servletPro?op=listar");

        } else if (op.equals("eliminar")) {
            HttpSession sesion = request.getSession();
            ArrayList<Cesta> carrito;
            if (sesion.getAttribute("carrito") == null) {
                carrito = new ArrayList<Cesta>();
            } else {
                carrito = (ArrayList<Cesta>) sesion.getAttribute("carrito");
            }

            String idProducto = request.getParameter("cod");

            for (int j = 0; j < carrito.size(); j++) {
                if (carrito.get(j).getCod().equals(idProducto)) {
                    carrito.remove(j);
                }
            }

            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("cesta.jsp");

        } 
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
String action=request.getParameter("action");
HttpSession sesion = request.getSession();
if(action.equalsIgnoreCase("update")){
ArrayList<Cesta> carrito=(ArrayList<Cesta>) sesion.getAttribute("carrito");
String []quantity=request.getParameterValues("quantity");
    for (int i = 0; i < carrito.size(); i++) {
carrito.get(i).setCan(Integer.parseInt(quantity[i]));
        
    }
            sesion.setAttribute("carrito", carrito);
request.getRequestDispatcher("cesta.jsp").forward(request, response);



}


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
