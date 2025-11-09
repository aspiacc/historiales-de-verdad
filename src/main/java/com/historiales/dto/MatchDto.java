package com.historiales.dto;

import java.time.LocalDate;

public record MatchDto(
    Long id,
    LocalDate matchDate,
    String venue,
    String stage,
    Integer homeScore,
    Integer awayScore,
    Integer attendance,
    TeamDto homeTeam,
    TeamDto awayTeam,
    TournamentDto tournament) {}
