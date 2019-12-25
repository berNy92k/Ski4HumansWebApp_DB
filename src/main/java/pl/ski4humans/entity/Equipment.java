package pl.ski4humans.entity;

import com.sun.istack.internal.NotNull;

import javax.persistence.*;
import java.util.*;

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
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manufacturer_id")
    private Manufacturer manufacturer;
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
    @Column(name = "publish_date")
    private Date publishDate;
    @NotNull
    @Column(name = "last_update_time")
    private Date lastUpdateTime;

    @OneToMany(fetch = FetchType.EAGER,
            mappedBy = "equipment")
    private Set<Review> reviews = new HashSet<>();
//    @NotNull
//    @OneToMany(fetch = FetchType.EAGER,
//            mappedBy = "skis")
//    private Set<OrderDetail> orderDetails = new HashSet<>();

    @Transient
    private String base64Image;

    public Equipment() {
    }

    public Equipment(String name, Manufacturer manufacturer, String shortDescription, String longDescription,
                     String sex, byte[] image, float price, String lengthOrSize, Category category) {
        this.name = name;
        this.manufacturer = manufacturer;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.sex = sex;
        this.image = image;
        this.price = price;
        this.lengthOrSize = lengthOrSize;
        this.category = category;
    }

    public Equipment(String name, Manufacturer manufacturer, String shortDescription, String longDescription,
                     String sex, byte[] image, float price, String lengthOrSize, Category category,
                     Date publishDate, Date lastUpdateTime) {
        this.name = name;
        this.manufacturer = manufacturer;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.sex = sex;
        this.image = image;
        this.price = price;
        this.lengthOrSize = lengthOrSize;
        this.category = category;
        this.publishDate = publishDate;
        this.lastUpdateTime = lastUpdateTime;
    }

    public Equipment(Integer equipmentId, String name, Manufacturer manufacturer, String shortDescription,
                     String longDescription, String sex, byte[] image, float price, String lengthOrSize,
                     Category category, Date publishDate, Date lastUpdateTime) {
        this.equipmentId = equipmentId;
        this.name = name;
        this.manufacturer = manufacturer;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.sex = sex;
        this.image = image;
        this.price = price;
        this.lengthOrSize = lengthOrSize;
        this.category = category;
        this.publishDate = publishDate;
        this.lastUpdateTime = lastUpdateTime;
    }

    public Integer getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Integer equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getLengthOrSize() {
        return lengthOrSize;
    }

    public void setLengthOrSize(String lengthOrSize) {
        this.lengthOrSize = lengthOrSize;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public String getBase64Image() {
        this.base64Image = Base64.getEncoder().encodeToString(this.image);
        return this.base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
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
