package pl.ski4humans.controller.frontend.loginAndRegister;

import pl.ski4humans.service.frontend.ConstantsFrontendPL;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LoginWebFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpSession session = servletRequest.getSession(false);

        boolean isLogged = session != null && session.getAttribute(ConstantsFrontendPL.LOGGED_CUSTOMER) != null;
        String loginURI = servletRequest.getContextPath() + "/homepage/login";
        boolean isTheSameURI = servletRequest.getRequestURI().equals(loginURI);
        boolean loginJspPage = servletRequest.getRequestURI().endsWith("/homepage/logIn.jsp");

        if (isLogged & (isTheSameURI || loginJspPage)) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.HOMEPAGE_PAGE);
            requestDispatcher.forward(request, response);
        } else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
