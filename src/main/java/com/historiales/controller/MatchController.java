package com.historiales.controller;

import com.historiales.dto.CreateMatchRequest;
import com.historiales.dto.GoalDto;
import com.historiales.dto.MatchDto;
import com.historiales.mapper.MatchMapper;
import com.historiales.service.MatchService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/matches")
@RequiredArgsConstructor
public class MatchController {

  private final MatchService matchService;

  @GetMapping
  public Page<MatchDto> listMatches(
      @RequestParam(value = "teamId", required = false) Long teamId,
      @RequestParam(value = "tournamentId", required = false) Long tournamentId,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "10") int size) {
    Pageable pageable = PageRequest.of(page, size);
    return matchService.findMatches(teamId, tournamentId, pageable).map(MatchMapper::toDto);
  }

  @GetMapping("/{id}")
  public MatchDto findById(@PathVariable Long id) {
    return MatchMapper.toDto(matchService.findById(id));
  }

  @GetMapping("/{id}/goals")
  public List<GoalDto> goals(@PathVariable Long id) {
    return MatchMapper.toGoalDtos(matchService.findGoals(id));
  }

  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  public MatchDto create(@Valid @RequestBody CreateMatchRequest request) {
    return MatchMapper.toDto(matchService.createMatch(request));
  }
}
