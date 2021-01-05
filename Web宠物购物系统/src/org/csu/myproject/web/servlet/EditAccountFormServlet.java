package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Account;
import org.csu.myproject.domain.Profile;
import org.csu.myproject.service.UserService;
import org.csu.myproject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditAccountFormServlet extends HttpServlet {
    private static final String EDIT_ACCOUNT_FORM="/WEB-INF/jsp/account/EditAccountForm.jsp";
    private static final String TOURIST_WARNING="/WEB-INF/jsp/common/TouristWarning.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        UserService userService=new UserServiceImpl();
        Account loginUser=(Account) session.getAttribute("loginUser");

        if(loginUser==null){
            req.getRequestDispatcher(TOURIST_WARNING).forward(req,resp);
        }else {
            session.setAttribute("account_id",loginUser.getUserId());
            session.setAttribute("account_firstName",loginUser.getFirstName());
            session.setAttribute("account_lastName",loginUser.getLastName());
            session.setAttribute("account_email",loginUser.getEmail());
            session.setAttribute("account_phone",loginUser.getPhone());
            session.setAttribute("account_address1",loginUser.getAddr1());
            session.setAttribute("account_address2",loginUser.getAddr2());
            session.setAttribute("account_city",loginUser.getCity());
            session.setAttribute("account_state",loginUser.getState());
            session.setAttribute("account_zip",loginUser.getZip());
            session.setAttribute("account_country",loginUser.getCountry());
            Profile profile=userService.getProfileById(loginUser.getUserId());
            session.setAttribute("account_languagePreference",profile.getLangpref());
            session.setAttribute("account_favouriteCategoryId",profile.getFavcategory());
            session.setAttribute("account_listOption",profile.isMylistopt());
            session.setAttribute("account_bannerOption",profile.isBanneropt());
            req.getRequestDispatcher(EDIT_ACCOUNT_FORM).forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
