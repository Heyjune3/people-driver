package com.gls.ppldv.business.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tbl_attach")
public class Attachment {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "fullName", length = 300, nullable = false)
    private String fullName;
    
    @ManyToOne
    @JoinColumn(name = "bno", referencedColumnName = "bno")
    private BusinessEntity bEntity;
    
    @Column(name = "regdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date regdate;
    
    // Constructors, Getters, and Setters
}
