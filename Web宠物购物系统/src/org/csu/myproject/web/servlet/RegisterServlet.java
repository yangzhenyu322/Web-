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

public class RegisterServlet extends HttpServlet {
    private static final String LOGIN_FORM="/WEB-INF/jsp/login.jsp";
    private static final String MAIN_FORM="/WEB-INF/jsp/mainstore.jsp";
    private static final String REGISTER_FORM="/WEB-INF/jsp/register.jsp";

//    private User user;
//    private String confirmPassword;
//    private String ageString;
//    private String msg;
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("UTF-8");
//        getParameters(req);
//        if(validation())
//        {
//            UserService userService=new UserServiceImpl();
//            int result=userService.register(this.user);
//            if(result==1)
//            {
//                this.msg="注册成功！！！请使用新的账号和密码登录";
//                req.setAttribute("msg",this.msg);
//                req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
//            }
//            else
//            {
//                if(userService.getMsg()==null||userService.getMsg().trim().equals(""))
//                {
//                    req.setAttribute("msg","服务器错误");
//                }
//                else
//                {
//                    req.setAttribute("msg",userService.getMsg());
//                }
//                req.getRequestDispatcher(REGISTER_FORM).forward(req,resp);
//            }
//        }
//        else
//        {
//            req.setAttribute("msg",this.msg);
//            req.getRequestDispatcher(REGISTER_FORM).forward(req,resp);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doPost(req,resp);
//    }
//
//    private void getParameters(HttpServletRequest req)
//    {
//        this.user=new User();
//        user.setUsername(req.getParameter("username"));
//        user.setPassword(req.getParameter("password"));
//        this.confirmPassword=req.getParameter("password");
//        user.setAccount(Integer.parseInt(req.getParameter("account")));
//        user.setGender(req.getParameter("gender"));
//        this.ageString=req.getParameter("age");
//        user.setEmail(req.getParameter("email"));
//    }
//
//    private boolean validation()
//    {
//        if(this.user.getUsername()==null||this.user.getUsername().trim().equals(""))
//        {
//            this.msg="用户名必填";
//            return false;
//        }
//        if(this.confirmPassword==null||this.confirmPassword.trim().equals(""))
//        {
//            this.msg="密码必须填";
//            return false;
//        }
//        if(!this.user.getPassword().equals(this.confirmPassword))
//        {
//            this.msg="两次密码不一致";
//            return false;
//        }
//        try{
//            int age=Integer.parseInt(this.ageString);
//            this.user.setAge(age);
//        }catch (Exception e)
//        {
//            this.msg="年龄必须是整数";
//            return false;
//        }
//        if(this.user.getGender()==null||this.user.getGender().trim().equals(""))
//        {
//            this.msg="性别必须填";
//            return false;
//        }
//        return true;
//    }


    private Account account;
    private String confirmPassword;
    private String msg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        //获取验证码
        String checkcode=req.getParameter("register_checkCode");
        HttpSession session=req.getSession();
        String checkcode_session=(String)session.getAttribute("checkcode_session");
        session.removeAttribute("checkcode_session");
        if(checkcode_session==null||!checkcode_session.equalsIgnoreCase(checkcode))
        {
            req.setAttribute("msg","验证码错误");
            req.getRequestDispatcher(REGISTER_FORM).forward(req,resp);
        }else {
            getParameters(req);
            if(validation())
            {
                UserService userService=new UserServiceImpl();
                int result=userService.register(this.account);
                if(result==1)
                {
                    this.msg="注册成功！！！请使用新的账号和密码登录";
                    req.setAttribute("msg",this.msg);
                    req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
                }
                else
                {
                    if(userService.getMsg()==null||userService.getMsg().trim().equals(""))
                    {
                        req.setAttribute("msg","服务器错误");
                    }
                    else
                    {
                        req.setAttribute("msg",userService.getMsg());
                    }
                    req.getRequestDispatcher(REGISTER_FORM).forward(req,resp);
                }
            }
            else
            {
                req.setAttribute("msg",this.msg);
                req.getRequestDispatcher(REGISTER_FORM).forward(req,resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    private void getParameters(HttpServletRequest req)
    {
        this.account=new Account();
        account.setUserName(req.getParameter("username"));
        account.setPassword(req.getParameter("password"));
        this.confirmPassword=req.getParameter("password");
        account.setEmail(req.getParameter("email"));
    }

    private boolean validation()
    {
        if(this.account.getUserName()==null||this.account.getUserName().trim().equals(""))
        {
            this.msg="用户名必填";
            return false;
        }
        if(this.confirmPassword==null||this.confirmPassword.trim().equals(""))
        {
            this.msg="密码必须填";
            return false;
        }
        if(!this.account.getPassword().equals(this.confirmPassword))
        {
            this.msg="两次密码不一致";
            return false;
        }
        return true;
    }

}
