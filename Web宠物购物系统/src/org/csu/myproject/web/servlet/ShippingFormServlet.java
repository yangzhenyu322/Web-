package org.csu.myproject.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ShippingFormServlet extends HttpServlet {
    private static final String CONFIRM_ORDERS="/WEB-INF/jsp/order/ConfirmOrder.jsp";
    private String shipToFirstName;
    private String shipToLastName;
    private String shipAddress1;
    private String shipAddress2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        shipToFirstName=req.getParameter("shipToFirstName");
        shipToLastName=req.getParameter("shipToLastName");
        shipAddress1=req.getParameter("shipAddress1");
        shipAddress2=req.getParameter("shipAddress2");
        shipCity=req.getParameter("shipCity");
        shipState=req.getParameter("shipState");
        shipZip=req.getParameter("shipZip");
        shipCountry=req.getParameter("shipCountry");
        HttpSession session=req.getSession();
        session.setAttribute("ConfirmOrder_shipToFirstName",shipToFirstName);
        session.setAttribute("ConfirmOrder_shipToLastName",shipToLastName);
        session.setAttribute("ConfirmOrder_shipAddress1",shipAddress1);
        session.setAttribute("ConfirmOrder_shipAddress2",shipAddress2);
        session.setAttribute("ConfirmOrder_shipCity",shipCity);
        session.setAttribute("ConfirmOrder_shipState",shipState);
        session.setAttribute("ConfirmOrder_shipZip",shipZip);
        session.setAttribute("ConfirmOrder_shipCountry",shipCountry);
        req.getRequestDispatcher(CONFIRM_ORDERS).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
