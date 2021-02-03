package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Product;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class SearchProductEngineServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword=req.getParameter("keyword");
        CatalogService service=new CatalogService();
        List<Product> productList=service.searchProductList(keyword);
        resp.setContentType("text/xml");
        PrintWriter out=resp.getWriter();
        String res="";
        for(int i=0;i<productList.size();i++)
        {
            if(i>0)
            {
                res += ","+productList.get(i).getName();
            }
            else
            {
                res+=productList.get(i).getName();
            }
        }
        out.write(res);
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
