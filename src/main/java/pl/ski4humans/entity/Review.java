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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "review")
@NamedQueries({
    @NamedQuery(name = "Review.findAll", query = "SELECT r FROM Review r ORDER BY r.reviewId"),
    @NamedQuery(name = "Review.countAll", query = "SELECT COUNT(r) FROM Review r"),
    @NamedQuery(name = "Review.findAllByEquipmentId", query = "SELECT r FROM Review r " +
        "WHERE r.equipment.equipmentId = :equipmentId " +
        "ORDER BY r.reviewTime")
})
public class Review {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "review_id")
  private Integer reviewId;
  @NotNull
  @Column(name = "rating")
  private int rating;
  @NotNull
  @Column(name = "headline")
  private String headline;
  @NotNull
  @Column(name = "comment")
  private String comment;
  @NotNull
  @Column(name = "review_time")
  private Date reviewTime;
  @NotNull
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "equipment_id")
  private Equipment equipment;
  @NotNull
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "customer_id")
  private Customer customer;
}
