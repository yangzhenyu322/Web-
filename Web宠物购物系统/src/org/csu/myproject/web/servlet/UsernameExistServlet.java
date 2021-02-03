package org.csu.myproject.web.servlet;

import org.csu.myproject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class UsernameExistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        UserServiceImpl userService = new UserServiceImpl();
        Boolean isUserNameExist = userService.usernameExist(username);

        resp.setContentType("text/plain");
//        resp.setContentType("text/json");
        PrintWriter out = resp.getWriter();
//        Result result1 = new Result();

        if(!isUserNameExist){
            //用户名可用
            out.print("No Exist");
//            result1.setCode(0);
//            result1.setMsg("No Exist");
        }else{
            //用户名不可用
            out.print("Exist");
//            result1.setCode(1);
//            result1.setMsg("Exist");
        }

//        String str = JSON.toJSONString(result1);
//        out.print(str);
        out.flush();
        out.close();
    }
}
