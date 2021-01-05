package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Order;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

public class ViewOrdersServlet extends HttpServlet {

    private static final String VIEW_ORDER="/WEB-INF/jsp/order/ViewOrder.jsp";
    private  int orderId;
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
    private Date orderDate;
    private String manifestOrderDate;
    private String shipToFirstName;
    private String shipToLastName;
    private String shipAddress1;
    private String shipAddress2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;

    private String userId;
    private String courier;
    private BigDecimal totalPrice;
    private String status="P";
    private String locale;
    private Cart cart;
    private Order order;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        order=new Order();
        CatalogService catalogService=new CatalogService();
        HttpSession session=req.getSession();
        orderId=catalogService.getOrderId();
        userId=session.getAttribute("userId").toString();
        cardType=session.getAttribute("ConfirmOrder_cardType").toString();
        creditCard=session.getAttribute("ConfirmOrder_creditCard").toString();
        expiryDate=session.getAttribute("ConfirmOrder_expiryDate").toString();
        billToFirstName=session.getAttribute("ConfirmOrder_billToFirstName").toString();
        billToLastName=session.getAttribute("ConfirmOrder_billToLastName").toString();
        billAddress1=session.getAttribute("ConfirmOrder_billAddress1").toString();
        billAddress2=session.getAttribute("ConfirmOrder_billAddress2").toString();
        billCity=session.getAttribute("ConfirmOrder_billCity").toString();
        billState=session.getAttribute("ConfirmOrder_billState").toString();
        billZip=session.getAttribute("ConfirmOrder_billZip").toString();
        billCountry=session.getAttribute("ConfirmOrder_billCountry").toString();
        manifestOrderDate=session.getAttribute("manifestOrderDate").toString();

        orderDate= (java.sql.Date) session.getAttribute("orderDate");

        shipToFirstName=session.getAttribute("ConfirmOrder_shipToFirstName").toString();
        shipToLastName=session.getAttribute("ConfirmOrder_shipToLastName").toString();
        shipAddress1=session.getAttribute("ConfirmOrder_shipAddress1").toString();
        shipAddress2=session.getAttribute("ConfirmOrder_shipAddress2").toString();
        shipCity=session.getAttribute("ConfirmOrder_shipCity").toString();
        shipState=session.getAttribute("ConfirmOrder_shipState").toString();
        shipZip=session.getAttribute("ConfirmOrder_shipZip").toString();
        shipCountry=session.getAttribute("ConfirmOrder_shipCountry").toString();
        locale=billState;
//        status=session.getAttribute("status").toString();
        courier="UPS";
        cart=catalogService.getCartByUserId(userId);
        totalPrice=cart.getSubTotal();
        order.setOrderId(orderId);
        order.setUserId(userId);
        order.setOrderDate(orderDate);
        order.setShipAddr1(shipAddress1);
        order.setShipAddr2(shipAddress2);
        order.setShipCity(shipCity);
        order.setShipState(shipState);
        order.setShipZip(shipZip);
        order.setShipCountry(shipCountry);
        order.setBillAddr1(billAddress1);
        order.setBillAddr2(billAddress2);
        order.setBillCity(billCity);
        order.setBillState(billState);
        order.setBillZip(billZip);
        order.setBillCountry(billCountry);
        order.setCourier(courier);
        order.setTotalPrice(totalPrice);
        order.setBillToFirstName(billToFirstName);
        order.setBillToLastName(billToLastName);
        order.setShipToFirstName(shipToFirstName);
        order.setShipToLastName(shipToLastName);
        order.setCreditCard(creditCard);
        order.setExprdate(expiryDate);
        order.setCardType(cardType);
        order.setLocale(locale);
        catalogService.UpdateOrder(order);
        session.setAttribute("order",order);
        session.setAttribute("status",status);

        Iterator<CartItem> cartItems=cart.getAllCartItem();
        while(cartItems.hasNext())
        {
            CartItem cartItem=cartItems.next();
            String itemId=cartItem.getItem().getItemId();
            catalogService.removeItemFromCart(userId,itemId);
            catalogService.UpdateCustomRecord(userId,orderId,cartItem);
        }
        List<CartItem>customRecordList=catalogService.getCustomRecord(userId,orderId);
        session.setAttribute("customRecordList",customRecordList);
        session.removeAttribute("cart");
        req.getRequestDispatcher(VIEW_ORDER).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
