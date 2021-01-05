package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Account;
import org.csu.myproject.service.UserService;
import org.csu.myproject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private static final String LOGIN_FORM="/WEB-INF/jsp/login.jsp";
    private static final String MAIN_FORM="/WEB-INF/jsp/catalog/Main.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("UTF-8");
//        String username=req.getParameter("username");
//        String password=req.getParameter("password");
//        String checkcode=req.getParameter("checkCode");
//        HttpSession session=req.getSession();
//        String checkcode_session=(String)session.getAttribute("checkcode_session");
//        session.removeAttribute("checkcode_session");
//        UserService userService=new UserServiceImpl();
//        User loginUser=userService.login(username,password);
//        if(loginUser==null)
//        {
//            req.setAttribute("msg","用户名或密码错误");
//            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
//        }
//        else if(checkcode_session==null||!checkcode_session.equalsIgnoreCase(checkcode))
//        {
//            req.setAttribute("msg","验证码错误");
//            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
//        }
//        else
//        {
//            session.setAttribute("loginUser",loginUser);
//            req.getRequestDispatcher(MAIN_FORM).forward(req,resp);
//        }

        req.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String checkcode=req.getParameter("checkCode");
        HttpSession session=req.getSession();
        String checkcode_session=(String)session.getAttribute("checkcode_session");
        session.removeAttribute("checkcode_session");
        UserService userService=new UserServiceImpl();
        Account loginUser=userService.login(username,password);
        if(loginUser==null)
        {
            req.setAttribute("msg","用户名或密码错误");
            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
        }
        else if(checkcode_session==null||!checkcode_session.equalsIgnoreCase(checkcode))
        {
            req.setAttribute("msg","验证码错误");
            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
        }
        else
        {
            session.setAttribute("loginUser",loginUser);
            session.setAttribute("status",loginUser.getStatus());
            session.setAttribute("userId",loginUser.getUserId());
            req.getRequestDispatcher(MAIN_FORM).forward(req,resp);
        }
    }
}
