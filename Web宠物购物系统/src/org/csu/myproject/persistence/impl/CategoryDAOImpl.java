package org.csu.myproject.persistence.impl;

import org.csu.myproject.domain.Category;
import org.csu.myproject.persistence.CategoryDAO;
import org.csu.myproject.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {
    private static final String GET_CATEGORY_LIST="SELECT catid AS categoryId,name,descn AS description FROM CATEGORY";
    private static final String GET_CATEGORY="SELECT catid AS categoryId,name,descn AS description FROM CATEGORY WHERE catid=?";
    @Override
    public List<Category> getCategoryList() {
        List<Category>categoryList=new ArrayList<>();
        try
        {
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_CATEGORY_LIST);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                Category category=new Category();
                category.setCatid(resultSet.getString(1));
                category.setName(resultSet.getString(2));
                category.setDescn(resultSet.getString(3));
                categoryList.add(category);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public Category getCategory(String categoryId) {
        Category category=null;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_CATEGORY);
            preparedStatement.setString(1,categoryId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                category=new Category();
                category.setCatid(resultSet.getString(1));
                category.setName(resultSet.getString(2));
                category.setDescn(resultSet.getString(3));
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return category;
    }
}
