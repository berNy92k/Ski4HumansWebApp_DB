package pl.ski4humans.controller.frontend.loginAndRegister;

import pl.ski4humans.service.frontend.ConstantsFrontendPL;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LoginWebFilter implements Filter {

  @Override
  public void init(final FilterConfig filterConfig) {

  }

  @Override
  public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain filterChain)
      throws IOException, ServletException {
    final HttpServletRequest servletRequest = (HttpServletRequest) request;
    final HttpSession session = servletRequest.getSession(false);

    final boolean isLogged = session != null && session.getAttribute(ConstantsFrontendPL.LoginRegister.LOGGED_CUSTOMER) != null;
    final String loginURI = servletRequest.getContextPath() + "/homepage/login";
    final boolean isTheSameURI = servletRequest.getRequestURI().equals(loginURI);
    final boolean loginJspPage = servletRequest.getRequestURI().endsWith("/homepage/logIn.jsp");

    if (isLogged & (isTheSameURI || loginJspPage)) {
      request
          .getRequestDispatcher(ConstantsFrontendPL.Homepage.HOMEPAGE_PAGE)
          .forward(request, response);
    } else {
      filterChain.doFilter(request, response);
    }
  }

  @Override
  public void destroy() {

  }
}
