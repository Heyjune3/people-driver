package com.gls.ppldv.developer.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "dcareer")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DCareer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "dno", referencedColumnName = "dno")
	private Developer developer;

	@Column(name = "job_name")
	private String jobName;

	@Column(name = "job_period")
	private String jobPeriod;

	@Column(name = "job_responsibilities")
	private String jobResponsibilities;
}
