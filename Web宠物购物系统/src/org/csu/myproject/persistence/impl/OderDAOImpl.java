package org.csu.myproject.persistence.impl;

import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Item;
import org.csu.myproject.domain.Order;
import org.csu.myproject.persistence.DBUtil;
import org.csu.myproject.persistence.ItemDAO;
import org.csu.myproject.persistence.OrderDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OderDAOImpl implements OrderDAO {

    private static final String GET_ORDER_LIST="SELECT orderid,userid,orderdate,shipaddr1,shipaddr2,shipcity,shipstate,shipzip,shipcountry,billaddr1,billaddr2,billcity,billstate,billzip,billcountry,courier,totalprice,billtofirstname,billtolastname,shiptofirstname,shiptolastname,creditcard,exprdate,cardtype,locale FROM orders WHERE userid=?";
    private static final String UPDATE_ORDER="INSERT INTO orders (orderid,userid,orderdate,shipaddr1,shipaddr2,shipcity,shipstate,shipzip,shipcountry,billaddr1,billaddr2,billcity,billstate,billzip,billcountry,courier,totalprice,billtofirstname,billtolastname,shiptofirstname,shiptolastname,creditcard,exprdate,cardtype,locale) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SEARCH_ORDER_BY_ORDER_ID="SELECT orderid,userid,orderdate,shipaddr1,shipaddr2,shipcity,shipstate,shipzip,shipcountry,billaddr1,billaddr2,billcity,billstate,billzip,billcountry,courier,totalprice,billtofirstname,billtolastname,shiptofirstname,shiptolastname,creditcard,exprdate,cardtype,locale FROM orders WHERE orderid=?";
    private static final String UPDATE_CUSTOM_RECORD="INSERT INTO customrecord (userId,orderId,itemId,quantity,total) VALUES (?,?,?,?,?)";
    private static final String GET_CUSTOM_RECORD="SELECT userId,orderId,itemId,quantity,total FROM customrecord WHERE userId=? AND orderId=?";
    private static final String GET_ORDER_ID="SELECT*FROM orders";

    @Override
    public Order getOrderByOrderId(int orderid) {
        Order order=new Order();
        try {
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SEARCH_ORDER_BY_ORDER_ID);
            preparedStatement.setInt(1,orderid);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                order.setOrderId(resultSet.getInt(1));
                order.setUserId(resultSet.getString(2));
                order.setOrderDate(resultSet.getDate(3));
                order.setShipAddr1(resultSet.getString(4));
                order.setShipAddr2(resultSet.getString(5));
                order.setShipCity(resultSet.getString(6));
                order.setShipState(resultSet.getString(7));
                order.setShipZip(resultSet.getString(8));
                order.setShipCountry(resultSet.getString(9));
                order.setBillAddr1(resultSet.getString(10));
                order.setBillAddr2(resultSet.getString(11));
                order.setBillCity(resultSet.getString(12));
                order.setBillState(resultSet.getString(13));
                order.setBillZip(resultSet.getString(14));
                order.setBillCountry(resultSet.getString(15));
                order.setCourier(resultSet.getString(16));
                order.setTotalPrice(resultSet.getBigDecimal(17));
                order.setBillToFirstName(resultSet.getString(18));
                order.setBillToLastName(resultSet.getString(19));
                order.setShipToFirstName(resultSet.getString(20));
                order.setShipToLastName(resultSet.getString(21));
                order.setCreditCard(resultSet.getString(22));
                order.setExprdate(resultSet.getString(23));
                order.setCardType(resultSet.getString(24));
                order.setLocale(resultSet.getString(25));
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public int getOrderId() {
        int newOrderId=0;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_ORDER_ID);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                newOrderId=resultSet.getInt(1);
            }
            newOrderId++;
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return newOrderId;
    }

    @Override
    public List<Order> getOrderList(String userId) {
        List<Order>orderList=new ArrayList<>();
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_ORDER_LIST);
            preparedStatement.setString(1,userId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                Order order=new Order();
                order.setOrderId(resultSet.getInt(1));
                order.setUserId(resultSet.getString(2));
                order.setOrderDate(resultSet.getDate(3));
                order.setShipAddr1(resultSet.getString(4));
                order.setShipAddr2(resultSet.getString(5));
                order.setShipCity(resultSet.getString(6));
                order.setShipState(resultSet.getString(7));
                order.setShipZip(resultSet.getString(8));
                order.setShipCountry(resultSet.getString(9));
                order.setBillAddr1(resultSet.getString(10));
                order.setBillAddr2(resultSet.getString(11));
                order.setBillCity(resultSet.getString(12));
                order.setBillState(resultSet.getString(13));
                order.setBillZip(resultSet.getString(14));
                order.setBillCountry(resultSet.getString(15));
                order.setCourier(resultSet.getString(16));
                order.setTotalPrice(resultSet.getBigDecimal(17));
                order.setBillToFirstName(resultSet.getString(18));
                order.setBillToLastName(resultSet.getString(19));
                order.setShipToFirstName(resultSet.getString(20));
                order.setShipToLastName(resultSet.getString(21));
                order.setCreditCard(resultSet.getString(22));
                order.setExprdate(resultSet.getString(23));
                order.setCardType(resultSet.getString(24));
                order.setLocale(resultSet.getString(25));
                orderList.add(order);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public void UpdateOrder(Order order) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_ORDER);
            preparedStatement.setInt(1,order.getOrderId());
            preparedStatement.setString(2,order.getUserId());
            preparedStatement.setDate(3, order.getOrderDate());
            preparedStatement.setString(4,order.getShipAddr1());
            preparedStatement.setString(5,order.getShipAddr2());
            preparedStatement.setString(6,order.getShipCity());
            preparedStatement.setString(7,order.getShipState());
            preparedStatement.setString(8,order.getShipZip());
            preparedStatement.setString(9,order.getShipCountry());
            preparedStatement.setString(10,order.getBillAddr1());
            preparedStatement.setString(11,order.getBillAddr2());
            preparedStatement.setString(12,order.getBillCity());
            preparedStatement.setString(13,order.getBillState());
            preparedStatement.setString(14,order.getBillZip());
            preparedStatement.setString(15,order.getBillCountry());
            preparedStatement.setString(16,order.getCourier());
            preparedStatement.setBigDecimal(17,order.getTotalPrice());
            preparedStatement.setString(18,order.getBillToFirstName());
            preparedStatement.setString(19,order.getBillToLastName());
            preparedStatement.setString(20,order.getShipToFirstName());
            preparedStatement.setString(21,order.getShipToLastName());
            preparedStatement.setString(22,order.getCreditCard());
            preparedStatement.setString(23,order.getExprdate());
            preparedStatement.setString(24,order.getCardType());
            preparedStatement.setString(25,order.getLocale());
            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void UpdateCustomRecord(String userId, int orderId, CartItem cartItem) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_CUSTOM_RECORD);
            preparedStatement.setString(1,userId);
            preparedStatement.setInt(2,orderId);
            preparedStatement.setString(3,cartItem.getItem().getItemId());
            preparedStatement.setInt(4,cartItem.getQuantity());
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
    public List<CartItem> getCustomRecord(String userId, int orderId) {
        List<CartItem>customRecordList=new ArrayList<>();
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_CUSTOM_RECORD);
            preparedStatement.setString(1,userId);
            preparedStatement.setInt(2,orderId);
            ResultSet resultSet=preparedStatement.executeQuery();
            ItemDAO itemDAO=new ItemDAOImpl();
            while(resultSet.next())
            {
                CartItem cartItem=new CartItem();
                Item item=itemDAO.getItem(resultSet.getString(3));
                cartItem.setItem(item);
                cartItem.setQuantity(resultSet.getInt(4));
                customRecordList.add(cartItem);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return customRecordList;
    }
}
