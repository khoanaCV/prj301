/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    
    private List<Order> orders;

    public Cart() {
        this.orders = new ArrayList<>();
    }

    public Cart(List<Order> orders) {
        this();
        this.orders = orders;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
    
    public void add(Order order) {
        this.orders.add(order);
    }
    
}
