package pl.ski4humans.controller.admin;

import pl.ski4humans.service.admin.ConstantsAdminPL;

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
  public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain filterChain)
      throws IOException, ServletException {

    final HttpServletRequest httpServletRequest = (HttpServletRequest) request;
    final HttpSession session = httpServletRequest.getSession(false);

    final boolean loggedIn = session != null && session.getAttribute(ConstantsAdminPL.LOGGED_USER) != null;
    final String loginURI = httpServletRequest.getContextPath() + "/admin/login";
    final boolean isTheSameURI = httpServletRequest.getRequestURI().equals(loginURI);
    final boolean loginJspPage = httpServletRequest.getRequestURI().endsWith("/admin/login.jsp");

    if (loggedIn && (isTheSameURI || loginJspPage)) {
      RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsAdminPL.User.ADMIN_URL);
      requestDispatcher.forward(request, response);
    } else if (loggedIn || isTheSameURI) {
      filterChain.doFilter(request, response);
    } else {
      RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsAdminPL.User.ADMIN_LOGIN_URL_JSP);
      requestDispatcher.forward(request, response);
    }
  }

  @Override
  public void destroy() {

  }
}
