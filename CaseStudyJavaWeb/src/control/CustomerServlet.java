package control;

import dao.DAO;
import entity.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/showCustomer")
public class CustomerServlet extends HttpServlet {
    public CustomerServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        DAO dao = new DAO();
        List<Customer> list = new ArrayList<>();
        list = dao.getAllCustomer();
        request.setAttribute("listp", list);
    // Tạo đối tượng RequestDispatcher
    // để Forward (chuyển tiếp) yêu cầu tới index.jsp
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("index.jsp");

        // Forward (Chuyển tiếp) yêu cầu, để hiển thị dữ liệu trên trang JSP.
        dispatcher.forward(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. get data from dao
        DAO dao = new DAO();
            // 2. set data to jsp
        List<Customer> list = new ArrayList<>();
        list.add(new Customer(1, "nhac", "12/12/2000", "213424", "nam",
                "2142343","nahc@gmai","1","adsfdf"));
        request.setAttribute("listp", list);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
