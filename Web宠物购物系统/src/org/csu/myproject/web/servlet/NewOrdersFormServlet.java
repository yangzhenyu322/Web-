package org.csu.myproject.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NewOrdersFormServlet extends HttpServlet {
    private static final String NEW_ORDERS_FORM="/WEB-INF/jsp/order/NewOrderForm.jsp";
    private static final String ERROR="/WEB-INF/jsp/common/Error.jsp";
    private String userId;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        userId=session.getAttribute("userId").toString();
        if(userId==null)
        {
            req.getRequestDispatcher(ERROR).forward(req,resp);
        }
        req.getRequestDispatcher(NEW_ORDERS_FORM).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
