package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Account;
import org.csu.myproject.domain.Profile;
import org.csu.myproject.service.UserService;
import org.csu.myproject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditAccountServlet extends HttpServlet {
    private static final String EDIT_SUCCESS="editAccountForm";
    private Account account;
    private Profile profile;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session=req.getSession();
        UserService userService=new UserServiceImpl();

        //修改用户数据
        account=(Account) session.getAttribute("loginUser");
        profile=userService.getProfileById(account.getUserId());


        //处理密码输入
        String password=req.getParameter("account.password");
        String repeatedPassword=req.getParameter("account.repeatedPassword");
        if((password==null  || password.equals(""))&&(repeatedPassword ==null || repeatedPassword.equals(""))){ //两个密码均为空，不修改密码
            getParametersExceptPassword(req,session);
            int result=userService.editAccount(account,profile);
            session.setAttribute("msg","修改用户信息成功(密码无修改)");
            session.setAttribute("loginUser",account);
        }else{ //若有一个密码不为空
            if(!password.equals(repeatedPassword)){ //密码不一致
                session.setAttribute("msg","请检查两次密码是否一致！");
            }else { //密码一致时
                if(password.equals(account.getPassword())){ //新密码与原密码一致
                    session.setAttribute("msg","请检查两次密码是否一致！");
                }else {
                    getParameters(req,session);
                    int result=userService.editAccount(account,profile);
                    session.setAttribute("msg","修改用户信息成功(密码修改成功)");
                    session.setAttribute("loginUser",account);
                }
            }
        }

        req.getRequestDispatcher(EDIT_SUCCESS).forward(req,resp);
    }

    public void getParametersExceptPassword(HttpServletRequest req,HttpSession session){
        account.setUserId(((Account)req.getSession().getAttribute("loginUser")).getUserId());
        account.setFirstName(req.getParameter("account.firstName"));
        account.setLastName(req.getParameter("account.lastName"));
        account.setEmail(req.getParameter("account.email"));
        account.setPhone(req.getParameter("account.phone"));
        account.setAddr1(req.getParameter("account.address1"));
        account.setAddr2(req.getParameter("account.address2"));
        account.setCity(req.getParameter("account.city"));
        account.setState(req.getParameter("account.state"));
        account.setZip(req.getParameter("account.zip"));
        account.setCountry(req.getParameter("account.country"));

        profile.setLangpref(req.getParameter("account.languagePreference"));
        profile.setFavcategory(req.getParameter("account.favouriteCategoryId"));
        profile.setMylistopt(Boolean.parseBoolean(req.getParameter("account.listOption")));
        profile.setBanneropt(Boolean.parseBoolean(req.getParameter("account.bannerOption")));
    }

    public void getParameters(HttpServletRequest req,HttpSession session){
        account.setUserId(((Account)req.getSession().getAttribute("loginUser")).getUserId());
        account.setPassword(req.getParameter("account.password"));
        account.setFirstName(req.getParameter("account.firstName"));
        account.setLastName(req.getParameter("account.lastName"));
        account.setEmail(req.getParameter("account.email"));
        account.setPhone(req.getParameter("account.phone"));
        account.setAddr1(req.getParameter("account.address1"));
        account.setAddr2(req.getParameter("account.address2"));
        account.setCity(req.getParameter("account.city"));
        account.setState(req.getParameter("account.state"));
        account.setZip(req.getParameter("account.zip"));
        account.setCountry(req.getParameter("account.country"));

        profile.setLangpref(req.getParameter("account.languagePreference"));
        profile.setFavcategory(req.getParameter("account.favouriteCategoryId"));
        profile.setMylistopt(Boolean.parseBoolean(req.getParameter("account.listOption")));
        profile.setBanneropt(Boolean.parseBoolean(req.getParameter("account.bannerOption")));
    }

}
