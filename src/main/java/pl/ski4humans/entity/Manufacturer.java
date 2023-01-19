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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import java.util.Base64;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "manufacturer")
@NamedQueries({
    @NamedQuery(name = "Manufacturer.findAll", query = "SELECT m FROM Manufacturer m ORDER BY m.manufacturerName"),
    @NamedQuery(name = "Manufacturer.findByManufacturerName", query = "SELECT m FROM Manufacturer m WHERE m.manufacturerName = :manufacturerName"),
    @NamedQuery(name = "Manufacturer.countAll", query = "SELECT COUNT(m) FROM Manufacturer m"),
})
public class Manufacturer {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "manufacturer_id")
  private Integer manufacturerId;
  @NotNull
  @Column(name = "manufacturer_name")
  private String manufacturerName;
  @NotNull
  @Column(name = "description")
  private String description;
  @NotNull
  @Column(name = "image")
  private byte[] image;

  @NotNull
  @OneToMany(fetch = FetchType.LAZY,
      mappedBy = "manufacturer"
  )
  @Builder.Default
  private Set<Equipment> equipments = new HashSet<>();

  @Transient
  private String base64Image;

  public String getBase64Image() {
    this.base64Image = Base64.getEncoder().encodeToString(this.image);
    return this.base64Image;
  }
}
