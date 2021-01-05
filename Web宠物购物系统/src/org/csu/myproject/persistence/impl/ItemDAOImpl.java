package org.csu.myproject.persistence.impl;

import org.csu.myproject.domain.Item;
import org.csu.myproject.persistence.DBUtil;
import org.csu.myproject.persistence.ItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ItemDAOImpl implements ItemDAO {

    private static final String GET_ITEM_LIST_BY_PRODUCT="SELECT itemId,productId,listPrice,unitCost,supplierId,status,attr1,attr2,attr3,attr4,attr5 FROM item WHERE productId=?";
    private static final String GET_ITEM="SELECT itemId,productId,listPrice,unitCost,supplierId,status,attr1,attr2,attr3,attr4,attr5 FROM item WHERE itemId=?";
    private static final String GET_INVENTORY_QUANTITY="SELECT quantity FROM inventory WHERE itemId=?";
    private static final String UPDATE_INVENTORY_QUANTITY="UPDATE inventory SET quantity=quantity-? WHERE itemId=?";
    @Override
    public void updateInventoryQuantity(Map<String, Object> param) {
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_INVENTORY_QUANTITY);
            String itemId=param.keySet().iterator().next();
            Integer increment=(Integer)param.get(itemId);
            preparedStatement.setInt(1,increment.intValue());
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
    public int getInventoryQuantity(String itemId) {
        int result=-1;
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_INVENTORY_QUANTITY);
            preparedStatement.setString(1,itemId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                result=resultSet.getInt(1);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Item> getItemListByProduct(String productId) {
        List<Item>itemList=new ArrayList<>();
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_ITEM_LIST_BY_PRODUCT);
            preparedStatement.setString(1,productId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                Item item=new Item();
                item.setItemId(resultSet.getString(1));
                item.setQuantity(this.getInventoryQuantity(resultSet.getString(1)));
                item.setProductId(resultSet.getString(2));
                item.setListPrice(resultSet.getBigDecimal(3));
                item.setUnitCost(resultSet.getBigDecimal(4));
                item.setSupplierId(resultSet.getInt(5));
                item.setStatus(resultSet.getString(6));
                item.setAttribute1(resultSet.getString(7));
                item.setAttribute2(resultSet.getString(8));
                item.setAttribute3(resultSet.getString(9));
                item.setAttribute4(resultSet.getString(10));
                item.setAttribute5(resultSet.getString(11));
                itemList.add(item);
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return itemList;
    }

    @Override
    public Item getItem(String itemId) {
        Item item=null;
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_ITEM);
            preparedStatement.setString(1,itemId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                item=new Item();
                item.setItemId(resultSet.getString(1));
                item.setQuantity(this.getInventoryQuantity(resultSet.getString(1)));
                item.setProductId(resultSet.getString(2));
                item.setListPrice(resultSet.getBigDecimal(3));
                item.setUnitCost(resultSet.getBigDecimal(4));
                item.setSupplierId(resultSet.getInt(5));
                item.setStatus(resultSet.getString(6));
                item.setAttribute1(resultSet.getString(7));
                item.setAttribute2(resultSet.getString(8));
                item.setAttribute3(resultSet.getString(9));
                item.setAttribute4(resultSet.getString(10));
                item.setAttribute5(resultSet.getString(11));
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return item;
    }
}
