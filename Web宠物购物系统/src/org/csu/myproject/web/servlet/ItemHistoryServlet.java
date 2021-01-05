package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.ItemHistory;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ItemHistoryServlet extends HttpServlet {
    private String userId;
    private static final String VIEW_ITEM_HISTORY="/WEB-INF/jsp/account/ItemHistory.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        userId= (String) session.getAttribute("userId");
        CatalogService catalogService=new CatalogService();
        List<ItemHistory>itemHistoryList=new ArrayList<>();
        itemHistoryList=catalogService.getItemHistoryListByUserId(userId);
        session.setAttribute("itemHistoryList",itemHistoryList);
        req.getRequestDispatcher(VIEW_ITEM_HISTORY).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
