package pl.ski4humans.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "customer")
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c ORDER BY c.email"),
    @NamedQuery(name = "Customer.findByEmail", query = "SELECT c FROM Customer c WHERE c.email = :email"),
    @NamedQuery(name = "Customer.countAll", query = "SELECT COUNT(c) FROM Customer c")
})
public class Customer {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "customer_id")
  private Integer customerId;
  @NotNull
  @Column(name = "email")
  private String email;
  @NotNull
  @Column(name = "password")
  private String password; // local tests so keep string (it can be change later)
  @NotNull
  @Column(name = "first_name")
  private String firstName;
  @NotNull
  @Column(name = "last_name")
  private String lastName;
  @NotNull
  @Column(name = "street")
  private String street;
  @NotNull
  @Column(name = "home_number")
  private String homeNumber;
  @NotNull
  @Column(name = "city")
  private String city;
  @NotNull
  @Column(name = "zip_code")
  private String zipCode;
  @NotNull
  @Column(name = "country")
  private String country;
  @NotNull
  @Column(name = "phone_number")
  private String phone;
  @NotNull
  @Column(name = "register_date")
  private Date registerDate;

  @OneToMany(fetch = FetchType.EAGER,
      mappedBy = "customer")
  @Builder.Default
  private Set<Review> reviews = new HashSet<>();

  @OneToMany(fetch = FetchType.LAZY,
      mappedBy = "customer")
  @Builder.Default
  private Set<Order> orders = new HashSet<>();

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Customer customer = (Customer) o;
    return Objects.equals(customerId, customer.customerId) &&
        Objects.equals(email, customer.email) &&
        Objects.equals(password, customer.password) &&
        Objects.equals(firstName, customer.firstName) &&
        Objects.equals(lastName, customer.lastName) &&
        Objects.equals(street, customer.street) &&
        Objects.equals(homeNumber, customer.homeNumber) &&
        Objects.equals(city, customer.city) &&
        Objects.equals(zipCode, customer.zipCode) &&
        Objects.equals(country, customer.country) &&
        Objects.equals(phone, customer.phone) &&
        Objects.equals(registerDate, customer.registerDate) &&
        Objects.equals(reviews, customer.reviews);
  }

  @Override
  public int hashCode() {
    return Objects.hash(customerId, email, password, firstName, lastName, street, homeNumber, city, zipCode, country, phone, registerDate, reviews);
  }
}
