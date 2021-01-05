package org.csu.myproject.persistence.impl;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Item;
import org.csu.myproject.persistence.CartDAO;
import org.csu.myproject.persistence.DBUtil;
import org.csu.myproject.persistence.ItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAOImpl implements CartDAO {
    private static final String REMOVE_ITEM_FROM_CART="DELETE FROM cart WHERE userId=? AND itemId=?";
    private static final String GET_CART_BY_USER_ID="SELECT userId,itemId,quantity,instock,total FROM cart WHERE userId=?";
    private static final String ADD_ITEM_TO_CART="INSERT INTO cart (userId,itemId,quantity,instock,total) VALUES(?,?,?,?,?)";
    private static final String UPDATE_CART="UPDATE cart SET quantity=?,total=? WHERE userId=? AND itemId=?";

    private static final String ADD_ITEM_TO_CART_RECORD="INSERT INTO cartrecord (userId,itemId,quantity,instock,total) VALUES(?,?,?,?,?)";
    private static final String UPDATE_CART_RECORD="UPDATE cartrecord SET quantity=?,total=? WHERE userId=? AND itemId=?";

    @Override
    public void removeItemFromCart(String userId, String itemId) {
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(REMOVE_ITEM_FROM_CART);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,itemId);
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public Cart getCartByUserId(String userId) {
        Cart cart=new Cart();
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_CART_BY_USER_ID);
            preparedStatement.setString(1,userId);
            ResultSet resultSet=preparedStatement.executeQuery();
            ItemDAO itemDAO=new ItemDAOImpl();
            while(resultSet.next())
            {
                CartItem cartItem=new CartItem();
                cartItem.setItem(itemDAO.getItem(resultSet.getString(2)));
                cartItem.setQuantity(resultSet.getInt(3));
                cartItem.setInStock(resultSet.getInt(4)>0);
                cart.cartItemList.add(cartItem);
                cart.cartItemMap.put(cartItem.getItem().getItemId(),cartItem);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return cart;
    }

    @Override
    public void addItemToCart(String userId, Item item, boolean isInStock) {
        CartItem cartItem=new CartItem();
        cartItem.setItem(item);
        cartItem.setInStock(isInStock);
        cartItem.setQuantity(1);
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(ADD_ITEM_TO_CART);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,item.getItemId());
            preparedStatement.setInt(3,cartItem.getQuantity());
            preparedStatement.setInt(4,isInStock?1:0);
            preparedStatement.setBigDecimal(5,cartItem.getTotal());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCart(String userId, CartItem cartItem) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_CART);
            preparedStatement.setInt(1,cartItem.getQuantity());
            preparedStatement.setBigDecimal(2,cartItem.getTotal());
            preparedStatement.setString(3,userId);
            preparedStatement.setString(4,cartItem.getItem().getItemId());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void addItemToCartRecord(String userId, Item item, boolean isInStock) {
        CartItem cartItem=new CartItem();
        cartItem.setItem(item);
        cartItem.setInStock(isInStock);
        cartItem.setQuantity(1);
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(ADD_ITEM_TO_CART_RECORD);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,item.getItemId());
            preparedStatement.setInt(3,cartItem.getQuantity());
            preparedStatement.setInt(4,isInStock?1:0);
            preparedStatement.setBigDecimal(5,cartItem.getTotal());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCartRecord(String userId, CartItem cartItem) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_CART_RECORD);
            preparedStatement.setInt(1,cartItem.getQuantity());
            preparedStatement.setBigDecimal(2,cartItem.getTotal());
            preparedStatement.setString(3,userId);
            preparedStatement.setString(4,cartItem.getItem().getItemId());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
