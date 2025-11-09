package com.historiales.mapper;

import com.historiales.domain.Goal;
import com.historiales.domain.Match;
import com.historiales.domain.Team;
import com.historiales.domain.Tournament;
import com.historiales.dto.GoalDto;
import com.historiales.dto.MatchDto;
import com.historiales.dto.TeamDto;
import com.historiales.dto.TournamentDto;
import java.util.List;
import java.util.stream.Collectors;

public final class MatchMapper {

  private MatchMapper() {}

  public static MatchDto toDto(Match match) {
    return new MatchDto(
        match.getId(),
        match.getMatchDate(),
        match.getVenue(),
        match.getStage(),
        match.getHomeScore(),
        match.getAwayScore(),
        match.getAttendance(),
        toTeamDto(match.getHomeTeam()),
        toTeamDto(match.getAwayTeam()),
        toTournamentDto(match.getTournament()));
  }

  public static TeamDto toTeamDto(Team team) {
    if (team == null) {
      return null;
    }
    return new TeamDto(
        team.getId(),
        team.getName(),
        team.getNickname(),
        team.getStadium(),
        team.getFoundedYear(),
        team.getCity());
  }

  public static TournamentDto toTournamentDto(Tournament tournament) {
    if (tournament == null) {
      return null;
    }
    return new TournamentDto(
        tournament.getId(), tournament.getName(), tournament.getSeason(), tournament.getOrganizer());
  }

  public static List<GoalDto> toGoalDtos(List<Goal> goals) {
    return goals.stream()
        .map(
            goal ->
                new GoalDto(
                    goal.getId(),
                    goal.getMinute(),
                    goal.getScorer(),
                    goal.getType(),
                    goal.getTeam().getId(),
                    goal.getTeam().getName()))
        .collect(Collectors.toList());
  }
}
