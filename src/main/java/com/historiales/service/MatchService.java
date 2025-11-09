package com.historiales.service;

import com.historiales.domain.Goal;
import com.historiales.domain.Match;
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
        .orElseThrow(() -> new IllegalArgumentException("Match %d not found".formatted(id)));
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
