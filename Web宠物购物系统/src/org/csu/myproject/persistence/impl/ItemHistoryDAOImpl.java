package org.csu.myproject.persistence.impl;

import org.csu.myproject.domain.ItemHistory;
import org.csu.myproject.persistence.DBUtil;
import org.csu.myproject.persistence.ItemHistoryDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemHistoryDAOImpl implements ItemHistoryDAO {

    private static final String UPDATE_ITEM_HISTORY="INSERT INTO itemhistory (userId,itemId,productId,category,historyDate) VALUES (?,?,?,?,?)";
    private static final String GET_ITEM_HISTORY="SELECT userId,itemId,productId,category,historyDate FROM itemhistory WHERE userId=?";

    @Override
    public void UpdateItemHistory(String userId, ItemHistory itemHistory) {
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_ITEM_HISTORY);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,itemHistory.getItemId());
            preparedStatement.setString(3,itemHistory.getProductId());
            preparedStatement.setString(4,itemHistory.getCategory());
            preparedStatement.setTimestamp(5,itemHistory.getHistoryDate());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public List<ItemHistory> getItemHistoryListByUserId(String userId) {
        List<ItemHistory>itemHistoryList=new ArrayList<>();
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_ITEM_HISTORY);
            preparedStatement.setString(1,userId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                ItemHistory itemHistory=new ItemHistory();
                itemHistory.setUserId(resultSet.getString(1));
                itemHistory.setItemId(resultSet.getString(2));
                itemHistory.setProductId(resultSet.getString(3));
                itemHistory.setCategory(resultSet.getString(4));
                itemHistory.setHistoryDate(resultSet.getTimestamp(5));
                itemHistoryList.add(itemHistory);
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return itemHistoryList;
    }
}
