package pl.ski4humans.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Integer reviewId;
//    private Equipment equipment;
//    private Customer customer;
    private int rating;
    private String headline;
    private String comment;
    private Date reviewTime;
}
