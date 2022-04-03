package service;

import model.Employee;

import java.util.List;

public interface EmployeeService {
    public List<Employee> getEmployeeList();
    public Employee getEmployeeId( int id);
    public int getIdMax();
    public void addNewEmployee (Employee employee);
    public void updateEmployeeId(Employee employee);
    public void deleteEmployee(int id);
}
