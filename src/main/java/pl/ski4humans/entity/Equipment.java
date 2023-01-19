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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import java.util.Base64;
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
@Table(name = "equipment",
    uniqueConstraints = @UniqueConstraint(columnNames = "name"))
@NamedQueries(value = {
    @NamedQuery(name = "Equipment.findAll", query = "SELECT e FROM Equipment e ORDER BY e.name"),
    @NamedQuery(name = "Equipment.findByName", query = "SELECT e FROM Equipment e " +
        "WHERE e.name = :name"),
    @NamedQuery(name = "Equipment.findAllByCategory", query = "SELECT e FROM Equipment e " +
        "WHERE e.category.categoryId = :categoryID"),
    @NamedQuery(name = "Equipment.findAllByCategoryAndSex", query = "SELECT e FROM Equipment e " +
        "WHERE e.category.categoryId = :categoryID AND e.sex = :sex"),
    @NamedQuery(name = "Equipment.countAll", query = "SELECT COUNT(e) FROM Equipment e"),
    @NamedQuery(name = "Equipment.findAllByNameOrDescription", query = "SELECT e FROM Equipment e WHERE e.name LIKE CONCAT('%',:name,'%') " +
        "OR e.shortDescription LIKE CONCAT('%',:shortDescription,'%') " +
        "OR e.longDescription LIKE CONCAT('%',:longDescription,'%')")
})
public class Equipment {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "equipment_id")
  private Integer equipmentId;
  @NotNull
  @Column(name = "name")
  private String name;
  @NotNull
  @Column(name = "short_description")
  private String shortDescription;
  @NotNull
  @Column(name = "long_description")
  private String longDescription;
  @NotNull
  @Column(name = "sex")
  private String sex;
  @NotNull
  @Column(name = "image")
  private byte[] image;
  @NotNull
  @Column(name = "price")
  private float price;
  @NotNull
  @Column(name = "length_or_size")
  private String lengthOrSize;
  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "category_id")
  private Category category;
  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "manufacturer_id")
  private Manufacturer manufacturer;
  @NotNull
  @Column(name = "publish_date")
  private Date publishDate;
  @NotNull
  @Column(name = "last_update_time")
  private Date lastUpdateTime;

  @OneToMany(fetch = FetchType.EAGER,
      mappedBy = "equipment")
  @Builder.Default
  private Set<Review> reviews = new HashSet<>();

  @OneToMany(fetch = FetchType.EAGER,
      mappedBy = "equipment")
  @Builder.Default
  private Set<OrderEquipmentDetail> orderDetails = new HashSet<>();

  @Transient
  private String base64Image;

  public String getBase64Image() {
    this.base64Image = Base64.getEncoder().encodeToString(this.image);
    return this.base64Image;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Equipment equipment = (Equipment) o;
    return Objects.equals(equipmentId, equipment.equipmentId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(equipmentId);
  }
}
