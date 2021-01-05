package org.csu.myproject.web.servlet;

import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class ConfirmOrdersServlet extends HttpServlet {
    private static final String CONFIRM_ORDERS="/WEB-INF/jsp/order/ConfirmOrder.jsp";
    private static final String ERROR="/WEB-INF/jsp/common/Error.jsp";
    private static final String SHIPPING_FORM="/WEB-INF/jsp/order/ShippingForm.jsp";
    private String cardType;
    private String creditCard;
    private String expiryDate;
    private String billToFirstName;
    private String billToLastName;
    private String billAddress1;
    private String billAddress2;
    private String billCity;
    private String billState;
    private String billZip;
    private String billCountry;
    private String shippingAddressRequired;
    private Date orderDate;
    private String manifestOrderDate;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CatalogService catalogService=new CatalogService();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");
        java.util.Date utilDate=new java.util.Date();
        orderDate=new Date(utilDate.getTime());
        manifestOrderDate=df.format(utilDate);


        cardType=req.getParameter("cardType");
        creditCard=req.getParameter("creditCard");
        expiryDate=req.getParameter("expiryDate");
        billToFirstName=req.getParameter("billToFirstName");
        billToLastName=req.getParameter("billToLastName");
        billAddress1=req.getParameter("billAddress1");
        billAddress2=req.getParameter("billAddress2");
        billCity=req.getParameter("billCity");
        billState=req.getParameter("billState");
        billZip=req.getParameter("billZip");
        billCountry=req.getParameter("billCountry");
        shippingAddressRequired=req.getParameter("shippingAddressRequired");
        HttpSession session=req.getSession();
        session.setAttribute("ConfirmOrder_cardType",cardType);
        session.setAttribute("ConfirmOrder_creditCard",creditCard);
        session.setAttribute("ConfirmOrder_expiryDate",expiryDate);
        session.setAttribute("ConfirmOrder_billToFirstName",billToFirstName);
        session.setAttribute("ConfirmOrder_billToLastName",billToLastName);
        session.setAttribute("ConfirmOrder_billAddress1",billAddress1);
        session.setAttribute("ConfirmOrder_billAddress2",billAddress2);
        session.setAttribute("ConfirmOrder_billCity",billCity);
        session.setAttribute("ConfirmOrder_billState",billState);
        session.setAttribute("ConfirmOrder_billZip",billZip);
        session.setAttribute("ConfirmOrder_billCountry",billCountry);
        session.setAttribute("manifestOrderDate",manifestOrderDate);
        session.setAttribute("orderDate",new java.sql.Date(utilDate.getTime()));
        if(shippingAddressRequired==null)
        {
            session.setAttribute("ConfirmOrder_shipToFirstName",billToFirstName);
            session.setAttribute("ConfirmOrder_shipToLastName",billToLastName);
            session.setAttribute("ConfirmOrder_shipAddress1",billAddress1);
            session.setAttribute("ConfirmOrder_shipAddress2",billAddress2);
            session.setAttribute("ConfirmOrder_shipCity",billCity);
            session.setAttribute("ConfirmOrder_shipState",billState);
            session.setAttribute("ConfirmOrder_shipZip",billZip);
            session.setAttribute("ConfirmOrder_shipCountry",billCountry);
            req.getRequestDispatcher(CONFIRM_ORDERS).forward(req,resp);
        }
        if(shippingAddressRequired.equals("true"))
        {
            req.getRequestDispatcher(SHIPPING_FORM).forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
