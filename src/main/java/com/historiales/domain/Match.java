package com.historiales.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "matches")
public class Match {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false)
  private LocalDate matchDate;

  @Column(length = 120)
  private String venue;

  @Column(length = 80)
  private String stage;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "tournament_id")
  private Tournament tournament;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "home_team_id", nullable = false)
  private Team homeTeam;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "away_team_id", nullable = false)
  private Team awayTeam;

  private Integer homeScore;
  private Integer awayScore;
  private Integer attendance;
}
