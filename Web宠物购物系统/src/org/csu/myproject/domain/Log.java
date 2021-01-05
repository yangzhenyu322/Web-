package org.csu.myproject.domain;

import java.util.ArrayList;

public class Log {
    ArrayList<CartLog> carts=new ArrayList<>();
    ArrayList<OrdersLog> orders=new ArrayList<>();

    public ArrayList<CartLog> getCarts() {
        return carts;
    }

    public void setCarts(ArrayList<CartLog> carts) {
        this.carts = carts;
    }

    public ArrayList<OrdersLog> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<OrdersLog> orders) {
        this.orders = orders;
    }
}
