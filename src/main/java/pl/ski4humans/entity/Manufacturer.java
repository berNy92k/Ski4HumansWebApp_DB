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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import java.util.Base64;
import java.util.HashSet;
import java.util.Set;

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
  private Set<Equipment> equipments = new HashSet<>();

  @Transient
  private String base64Image;

  public Manufacturer() {
  }

  public Manufacturer(String manufacturerName, String description, byte[] image) {
    this.manufacturerName = manufacturerName;
    this.description = description;
    this.image = image;
  }

  public Manufacturer(Integer manufacturerId, String manufacturerName, String description, byte[] image) {
    this.manufacturerId = manufacturerId;
    this.manufacturerName = manufacturerName;
    this.description = description;
    this.image = image;
  }

  public Integer getManufacturerId() {
    return manufacturerId;
  }

  public void setManufacturerId(Integer manufacturerId) {
    this.manufacturerId = manufacturerId;
  }

  public String getManufacturerName() {
    return manufacturerName;
  }

  public void setManufacturerName(String manufacturerName) {
    this.manufacturerName = manufacturerName;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public byte[] getImage() {
    return image;
  }

  public void setImage(byte[] image) {
    this.image = image;
  }

  public Set<Equipment> getEquipments() {
    return equipments;
  }

  public void setEquipments(Set<Equipment> equipments) {
    this.equipments = equipments;
  }

  public String getBase64Image() {
    this.base64Image = Base64.getEncoder().encodeToString(this.image);
    return this.base64Image;
  }

  public void setBase64Image(String base64Image) {
    this.base64Image = base64Image;
  }
}
