package pl.ski4humans.entity;


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
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "category")
@NamedQueries({
    @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c ORDER BY c.name"),
    @NamedQuery(name = "Category.findByName", query = "SELECT c FROM Category c WHERE c.name = :name"),
    @NamedQuery(name = "Category.countAll", query = "SELECT COUNT(c) FROM Category c")
})
public class Category {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "category_id")
  private Integer categoryId;
  @NotNull
  @Column(name = "name")
  private String name;

  @OneToMany(fetch = FetchType.LAZY,
      mappedBy = "category")
  private Set<Equipment> categories = new HashSet<>();

  public Category() {
  }

  public Category(String name) {
    this.name = name;
  }

  public Category(Integer categoryId, String name) {
    this.categoryId = categoryId;
    this.name = name;
  }

  public Integer getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Set<Equipment> getCategories() {
    return categories;
  }

  public void setCategories(Set<Equipment> categories) {
    this.categories = categories;
  }
}
