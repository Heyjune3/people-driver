package com.gls.ppldv.developer.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "dlicense")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DLicense {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "dno", referencedColumnName = "dno")
    private Developer developer;

    @Column(name = "license_name")
    private String licenseName;

    @Column(name = "license_acqdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date acquisitionDate;
}
