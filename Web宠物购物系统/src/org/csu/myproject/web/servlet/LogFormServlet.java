package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Account;
import org.csu.myproject.domain.Log;
import org.csu.myproject.service.UserService;
import org.csu.myproject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogFormServlet extends HttpServlet {
    private static final String LOG_FORM="/WEB-INF/jsp/account/LogForm.jsp";
    private static final String TOURIST_WARNING="/WEB-INF/jsp/common/TouristWarning.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取日志
        HttpSession session=req.getSession();
        UserService userService=new UserServiceImpl();
        Account loginUser=(Account) session.getAttribute("loginUser");

        if(loginUser==null){
            req.getRequestDispatcher(TOURIST_WARNING).forward(req,resp);
        }else {
            Log log=userService.getLogById(loginUser.getUserId());
            session.setAttribute("log",log);

            req.getRequestDispatcher(LOG_FORM).forward(req,resp);
        }
    }

}
