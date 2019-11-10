package pl.ski4humans.entity;

import com.sun.istack.internal.NotNull;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "equipment",
        uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Equipment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "equipment_id")
    private Integer equipmentId;
    @NotNull
    @Column(name = "name")
    private String name;
    @NotNull
    @OneToOne
    @JoinColumn(name = "manufacturer_id", referencedColumnName = "manufacturer_id")
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
    private float lengthOrSize;
    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;
    @NotNull
    @Column(name = "publish_date")
    private Date publishDate;
    @NotNull
    @Column(name = "last_update_time")
    private Date lastUpdateTime;


    //    @NotNull
//    @OneToMany(fetch = FetchType.EAGER,
//            mappedBy = "review")
//    private Set<Review> reviews = new HashSet<>();
//    @NotNull
//    @OneToMany(fetch = FetchType.EAGER,
//            mappedBy = "skis")
//    private Set<OrderDetail> orderDetails = new HashSet<>();

    public Equipment() {
    }
}
