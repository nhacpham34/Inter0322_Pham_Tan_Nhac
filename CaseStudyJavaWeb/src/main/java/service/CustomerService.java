package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    public List<Customer>  getCustomerList();
    public Customer getIdCustomer(int id);
    public int getIdMax();
//    public void addCustomerIndex(int index, Customer customer);
    public void addCustomerList(Customer customer);
    public void updateCustomerId(Customer customer, int id);
    public void deleteCustomer (int id);

}
