package service;

import model.Employee;
import repository.EmployeeRepository;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> getEmployeeList() {
        return employeeRepository.getEmployeeList();
    }

    @Override
    public Employee getEmployeeId(int id) {
        return employeeRepository.getEmployeeId(id);
    }

    @Override
    public int getIdMax() {
        return employeeRepository.getIdMax();
    }

    @Override
    public void addNewEmployee(Employee employee) {
        employeeRepository.addNewEmployee(employee);
    }

    @Override
    public void updateEmployeeId(Employee employee) {
        employeeRepository.updateEmployeeId(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeRepository.deleteEmployee(id);
    }
}
