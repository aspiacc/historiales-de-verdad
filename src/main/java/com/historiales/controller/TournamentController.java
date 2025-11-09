package com.historiales.controller;

import com.historiales.dto.MatchDto;
import com.historiales.dto.TournamentDto;
import com.historiales.mapper.MatchMapper;
import com.historiales.service.MatchService;
import com.historiales.service.TournamentService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/tournaments")
@RequiredArgsConstructor
public class TournamentController {

  private final TournamentService tournamentService;
  private final MatchService matchService;

  @GetMapping
  public Page<TournamentDto> listTournaments(
      @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
    Pageable pageable = PageRequest.of(page, size);
    return tournamentService.findAll(pageable).map(MatchMapper::toTournamentDto);
  }

  @GetMapping("/{id}")
  public TournamentDto getTournament(@PathVariable Long id) {
    return MatchMapper.toTournamentDto(tournamentService.findById(id));
  }

  @GetMapping("/{id}/matches")
  public Page<MatchDto> matchesByTournament(
      @PathVariable Long id,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "10") int size) {
    Pageable pageable = PageRequest.of(page, size);
    return matchService.findByTournament(id, pageable).map(MatchMapper::toDto);
  }
}
