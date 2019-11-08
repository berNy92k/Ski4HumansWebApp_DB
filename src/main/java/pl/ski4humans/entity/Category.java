package pl.ski4humans.entity;

import com.sun.istack.internal.NotNull;

import javax.persistence.*;

@Entity
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
}
