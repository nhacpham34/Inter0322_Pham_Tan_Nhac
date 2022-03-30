import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CreateEmployeeServlet",urlPatterns = "/creatNewEmployee")
public class CreateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inputNameEpl = request.getParameter("inputNameEpl");
        String inputIdCardEpl = request.getParameter("inputIdCardEpl");
        String inputEmailEpl = request.getParameter("inputEmailEpl");
        String inputSdtEpl = request.getParameter("inputSdtEpl");
        PrintWriter  writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Thêm nhân viên: " + inputNameEpl +" " + inputIdCardEpl + " " +inputEmailEpl+ " " + inputSdtEpl+  " </h1>");

        writer.println("<html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
