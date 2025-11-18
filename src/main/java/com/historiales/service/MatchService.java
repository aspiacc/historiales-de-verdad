package com.historiales.service;

import com.historiales.domain.Goal;
import com.historiales.domain.Match;
import com.historiales.domain.Team;
import com.historiales.domain.Tournament;
import com.historiales.dto.CreateMatchRequest;
import com.historiales.repository.GoalRepository;
import com.historiales.repository.MatchRepository;
import com.historiales.repository.TeamRepository;
import com.historiales.repository.TournamentRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MatchService {

  private final MatchRepository matchRepository;
  private final TeamRepository teamRepository;
  private final TournamentRepository tournamentRepository;
  private final GoalRepository goalRepository;

  public Page<Match> findMatches(Long teamId, Long tournamentId, Pageable pageable) {
    return matchRepository.search(teamId, tournamentId, pageable);
  }

  public Match findById(Long id) {
    return matchRepository
        .findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Match %d not found (test)".formatted(id)));
  }

  public List<Goal> findGoals(Long matchId) {
    validateMatchExists(matchId);
    return goalRepository.findByMatchIdOrderByMinuteAsc(matchId);
  }

  public Page<Match> findByTeam(Long teamId, Pageable pageable) {
    ensureTeamExists(teamId);
    return matchRepository.search(teamId, null, pageable);
  }

  public Page<Match> findByTournament(Long tournamentId, Pageable pageable) {
    ensureTournamentExists(tournamentId);
    return matchRepository.search(null, tournamentId, pageable);
  }

  @Transactional
  public Match createMatch(CreateMatchRequest request) {
    Team homeTeam =
        teamRepository
            .findById(request.homeTeamId())
            .orElseThrow(
                () -> new IllegalArgumentException("Team %d not found".formatted(request.homeTeamId())));
    Team awayTeam =
        teamRepository
            .findById(request.awayTeamId())
            .orElseThrow(
                () -> new IllegalArgumentException("Team %d not found".formatted(request.awayTeamId())));
    if (homeTeam.getId().equals(awayTeam.getId())) {
      throw new IllegalArgumentException("Home and away teams must be different");
    }

    Tournament tournament =
        tournamentRepository
            .findById(request.tournamentId())
            .orElseThrow(
                () ->
                    new IllegalArgumentException(
                        "Tournament %d not found".formatted(request.tournamentId())));

    Match match = new Match();
    match.setMatchDate(request.matchDate());
    match.setVenue(request.venue());
    match.setStage(request.stage());
    match.setTournament(tournament);
    match.setHomeTeam(homeTeam);
    match.setAwayTeam(awayTeam);
    match.setHomeScore(request.homeScore());
    match.setAwayScore(request.awayScore());
    match.setAttendance(request.attendance());

    return matchRepository.save(match);
  }

  private void validateMatchExists(Long matchId) {
    if (!matchRepository.existsById(matchId)) {
      throw new IllegalArgumentException("Match %d not found".formatted(matchId));
    }
  }

  private void ensureTeamExists(Long teamId) {
    teamRepository
        .findById(teamId)
        .orElseThrow(() -> new IllegalArgumentException("Team %d not found".formatted(teamId)));
  }

  private void ensureTournamentExists(Long tournamentId) {
    tournamentRepository
        .findById(tournamentId)
        .orElseThrow(
            () -> new IllegalArgumentException("Tournament %d not found".formatted(tournamentId)));
  }
}
