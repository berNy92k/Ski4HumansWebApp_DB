package pl.ski4humans.controller.admin;

import pl.ski4humans.service.admin.ConstantsPL;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter("/admin/*")
public class AdminLoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpSession session = httpServletRequest.getSession(false);

        boolean loggedIn = session != null && session.getAttribute(ConstantsPL.LOGGED_USER) != null;
        String loginURI = httpServletRequest.getContextPath() + "/admin/login";
        boolean isTheSameURI = httpServletRequest.getRequestURI().equals(loginURI);
        boolean loginJspPage = httpServletRequest.getRequestURI().endsWith("/admin/login.jsp");

        if (loggedIn && (isTheSameURI || loginJspPage)) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.ADMIN_URL);
            requestDispatcher.forward(request, response);
        } else if (loggedIn || isTheSameURI) {
            filterChain.doFilter(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.ADMIN_LOGIN_URL_JSP);
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
