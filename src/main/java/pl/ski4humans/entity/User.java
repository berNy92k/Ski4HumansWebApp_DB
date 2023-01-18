package pl.ski4humans.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.validation.constraints.NotNull;

@Entity(name = "Users")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM Users u ORDER BY u.email"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
    @NamedQuery(name = "User.countAll", query = "SELECT COUNT(u) FROM Users u"),
    @NamedQuery(name = "User.checkLoginAndPassword", query = "SELECT u FROM Users u WHERE u.email = :email AND u.password = :password")
})
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_id")
  private Integer userId;
  @NotNull
  @Column(name = "email")
  private String email;
  @NotNull
  @Column(name = "full_name")
  private String fullName;
  @NotNull
  @Column(name = "password")
  private String password;

  public User() {
  }

  public User(String email, String fullName, String password) {
    this.email = email;
    this.fullName = fullName;
    this.password = password;
  }

  public User(Integer userId, String email, String fullName, String password) {
    this.userId = userId;
    this.email = email;
    this.fullName = fullName;
    this.password = password;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getFullName() {
    return fullName;
  }

  public void setFullName(String fullName) {
    this.fullName = fullName;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }
}
