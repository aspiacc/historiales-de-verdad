package com.historiales.controller;

import com.historiales.dto.MatchDto;
import com.historiales.dto.TeamDto;
import com.historiales.mapper.MatchMapper;
import com.historiales.service.MatchService;
import com.historiales.service.TeamService;
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
@RequestMapping("/api/teams")
@RequiredArgsConstructor
public class TeamController {

  private final TeamService teamService;
  private final MatchService matchService;

  @GetMapping
  public Page<TeamDto> listTeams(
      @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size) {
    Pageable pageable = PageRequest.of(page, size);
    return teamService.findAll(pageable).map(MatchMapper::toTeamDto);
  }

  @GetMapping("/{id}")
  public TeamDto findById(@PathVariable Long id) {
    return MatchMapper.toTeamDto(teamService.findById(id));
  }

  @GetMapping("/{id}/matches")
  public Page<MatchDto> matchesByTeam(
      @PathVariable Long id,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "10") int size) {
    Pageable pageable = PageRequest.of(page, size);
    return matchService.findByTeam(id, pageable).map(MatchMapper::toDto);
  }
}
