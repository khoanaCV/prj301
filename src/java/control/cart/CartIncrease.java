
package control.cart;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/cartinc"})
public class CartIncrease extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println(":D ???");
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        
//        if (a == null) {
//            request.getRequestDispatcher("Login.jsp").forward(request, response);
//            return;
//        }
        
        int uid = a.getId();
        String oid = request.getParameter("oid");
        
        DAO dao = new DAO();
        
        System.out.println("increase");
        dao.increaseOrder(a, Integer.valueOf(oid));
        
        response.sendRedirect("cartDetails");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println(":D ???");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println(":D ???");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
