package controller;
import model.Employee;
import service.EmployeeService;
import service.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet" , urlPatterns = "/showEmployee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createNewEmployee(request,response);
                break;
            case "update":
                updateEmployee(request,response);
                break;
            case "delete":
                deleteEmployeeList(request,response);
                break;

            default:
                getEmployeeList(request,response);
                break;
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "create":
                response.sendRedirect("employeehdl.jsp");
                break;
            case "update":
                goUpdate(request,response);
                break;
            default:
                getEmployeeList(request,response);
                break;
        }
    }


    private void getEmployeeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("liste", employeeService.getEmployeeList());
        // Forward (Chuyển tiếp) yêu cầu, để hiển thị dữ liệu trên trang JSP.
        request.getRequestDispatcher("/employee.jsp").forward(request, response);
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = employeeService.getIdMax() + 1;
        System.out.println(id);
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        int edu = Integer.parseInt(request.getParameter("edu"));
        int position = Integer.parseInt(request.getParameter("position"));
        long price = Long.parseLong(request.getParameter("price"));

        Employee employee = new Employee(id,name,dateOfBirth,idCard,sdt,email,edu,position,price);
        employeeService.addNewEmployee(employee);
        System.out.println("them roi ne");
        response.sendRedirect("/showEmployee");

    }

    private void goUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("employee", employeeService.getEmployeeId(id));
        request.getRequestDispatcher("/employeeEdit.jsp").forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        int edu = Integer.parseInt(request.getParameter("edu"));
        int position = Integer.parseInt(request.getParameter("position"));
        long price = Long.parseLong(request.getParameter("price"));

        Employee employee = new Employee(id,name,dateOfBirth,idCard,sdt,email,edu,position,price);
        employeeService.updateEmployeeId(employee);
        System.out.println("update roi ne");
        response.sendRedirect("/showEmployee");
    }
    private void deleteEmployeeList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        response.sendRedirect("/showEmployee");
    }
}
