package org.csu.myproject.service;

import org.csu.myproject.domain.*;
import org.csu.myproject.persistence.*;
import org.csu.myproject.persistence.impl.*;

import java.util.List;

public class CatalogService {
    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private ItemDAO itemDAO;
    private CartDAO cartDAO;
    private OrderDAO orderDAO;
    private ItemHistoryDAO itemHistoryDAO;

    public CatalogService()
    {
        productDAO=new ProductDAOImpl();
        categoryDAO=new CategoryDAOImpl();
        cartDAO=new CartDAOImpl();
        itemDAO=new ItemDAOImpl();
        orderDAO=new OderDAOImpl();
        itemHistoryDAO=new ItemHistoryDAOImpl();
    }
    public List<Category>getCategoryList()
    {
        return categoryDAO.getCategoryList();
    }

    public Category getCategory(String categoryId)
    {
        return categoryDAO.getCategory(categoryId);
    }

    public List<Product> getProductListByCategory(String categoryId)
    {
        return productDAO.getProductListByCategory(categoryId);
    }

    public Product getProduct(String productId)
    {
        return productDAO.getProduct(productId);
    }

    public List<Product> searchProductList(String keyword)
    {
        return productDAO.searchProductList("%" + keyword.toLowerCase() + "%");
    }

    public List<Item>getItemListByProduct(String productId)
    {
        return itemDAO.getItemListByProduct(productId);
    }

    public Item getItem(String itemId)
    {
        return itemDAO.getItem(itemId);
    }

    public boolean isItemInStock(String itemId)
    {
        return itemDAO.getInventoryQuantity(itemId)>0;
    }

    public void removeItemFromCart(String userId, String itemId)
    {
        cartDAO.removeItemFromCart(userId,itemId);
    }

    public Cart getCartByUserId(String userId)
    {
        return cartDAO.getCartByUserId(userId);
    }

    public void addItemToCart(String userId, Item item, boolean isInStock)
    {
        cartDAO.addItemToCart(userId,item,isInStock);
    }

    public void updateCart(String userId, CartItem cartItem)
    {
        cartDAO.updateCart(userId,cartItem);
    }

    public List<Order> getOrderList(String userId)
    {
        return orderDAO.getOrderList(userId);
    }

    public void UpdateOrder(Order order)
    {
        orderDAO.UpdateOrder(order);
    }

    public void UpdateCustomRecord(String userId, int orderId, CartItem cartItem)
    {
        orderDAO.UpdateCustomRecord(userId,orderId,cartItem);
    }

    public List<CartItem> getCustomRecord(String userId, int orderId)
    {
        return orderDAO.getCustomRecord(userId,orderId);
    }

    public int getOrderId()
    {
        return orderDAO.getOrderId();
    }

    public Order getOrderByOrderId(int orderid)
    {
        return  orderDAO.getOrderByOrderId(orderid);
    }

    public void addItemToCartRecord(String userId, Item item, boolean isInStock)
    {
        cartDAO.addItemToCartRecord(userId,item,isInStock);
    }

    public void updateCartRecord(String userId, CartItem cartItem)
    {
        cartDAO.updateCartRecord(userId,cartItem);
    }

    public void UpdateItemHistory(String userId, ItemHistory itemHistory)
    {
        itemHistoryDAO.UpdateItemHistory(userId,itemHistory);
    }

    public List<ItemHistory> getItemHistoryListByUserId(String userId)
    {
        return itemHistoryDAO.getItemHistoryListByUserId(userId);
    }
}
