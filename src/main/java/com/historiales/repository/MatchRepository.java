package com.historiales.repository;

import com.historiales.domain.Match;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MatchRepository extends JpaRepository<Match, Long> {

  @Query(
      "SELECT m FROM Match m WHERE (:teamId IS NULL OR m.homeTeam.id = :teamId OR m.awayTeam.id = :teamId) "
          + "AND (:tournamentId IS NULL OR m.tournament.id = :tournamentId)")
  Page<Match> search(@Param("teamId") Long teamId, @Param("tournamentId") Long tournamentId, Pageable pageable);
}
