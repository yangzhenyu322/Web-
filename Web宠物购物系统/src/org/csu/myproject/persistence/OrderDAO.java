package org.csu.myproject.persistence;

import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Order;

import java.util.List;

public interface OrderDAO {
    List<Order>getOrderList(String userId);

    void UpdateOrder(Order order);

    void UpdateCustomRecord(String userId, int orderId, CartItem cartItem);

    List<CartItem>getCustomRecord(String userId,int orderId);

    int getOrderId();

    Order getOrderByOrderId(int orderid);
}
