package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Product;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchProductServlet extends HttpServlet {
    private static final String SEARCH_PRODUCT="/WEB-INF/jsp/catalog/SearchProducts.jsp";
    private String keyword;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        keyword=req.getParameter("keyword");
        CatalogService catalogService=new CatalogService();
        List<Product>searchProductList=catalogService.searchProductList(keyword);
        HttpSession session=req.getSession();
        session.setAttribute("searchProductList",searchProductList);
        req.getRequestDispatcher(SEARCH_PRODUCT).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
