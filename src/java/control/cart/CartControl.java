/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control.cart;

import dao.DAO;
import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "cartControl", urlPatterns = {"/cartDetails"})
public class CartControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //DAO.main(null);
        System.out.println("?????????????");

        response.setContentType("text/html;charset=UTF-8");
        //b1: get data from dao
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        
        if (a == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        
        Cart c = dao.getCart(a);
        if (c != null) {
            System.out.println(c.getOrders().size());
            request.setAttribute("cart", c);
            request.setAttribute("list", c.getOrders());
            System.out.println(c.getOrders().toString());
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("CartEmpty.jsp").forward(request, response);
        }
        //b2: set data to jsp
        
        //404 -> url
        //500 -> jsp properties
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
        processRequest(request, response);
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
