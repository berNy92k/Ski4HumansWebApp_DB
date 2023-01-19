package pl.ski4humans.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
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
}
