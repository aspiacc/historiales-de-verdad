package com.historiales.dto;

import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;

public record CreateMatchRequest(
    @NotNull LocalDate matchDate,
    String venue,
    String stage,
    @NotNull Long tournamentId,
    @NotNull Long homeTeamId,
    @NotNull Long awayTeamId,
    Integer homeScore,
    Integer awayScore,
    Integer attendance) {}
