package org.csu.myproject.service;

import org.csu.myproject.domain.Account;
import org.csu.myproject.domain.Log;
import org.csu.myproject.domain.Profile;
import org.csu.myproject.persistence.UserDAO;
import org.csu.myproject.persistence.UserDAOImpl;

public class UserServiceImpl implements UserService{
    private UserDAO userDAO;
    private String msg;

    public UserServiceImpl()
    {
        this.userDAO=new UserDAOImpl();
    }

    public Account login(String username, String password)
    {
        return userDAO.findUserByUsernameAndPassword(username,password);
    }

    public boolean usernameExist(String username)
    {
        return userDAO.getUserByUsername(username);
    }

    public int register(Account account)
    {
        if(usernameExist(account.getUserName()))
        {
            msg="用户已经存在";
            return 0;
        }
        else
        {
            return userDAO.addUser(account);
        }
    }

    public String getMsg()
    {
        return msg;
    }

    @Override
    public Profile getProfileById(String userId) {
        return userDAO.findProfileById(userId);
    }

    @Override
    public int editAccount(Account account, Profile profile) {
        return userDAO.editUser(account,profile);
    }

    @Override
    public Log getLogById(String userId) {
        return userDAO.findLogsByUserId(userId);
    }
}
