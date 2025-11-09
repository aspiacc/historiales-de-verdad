package com.historiales.service;

import com.historiales.domain.Team;
import com.historiales.repository.TeamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TeamService {

  private final TeamRepository teamRepository;

  public Page<Team> findAll(Pageable pageable) {
    return teamRepository.findAll(pageable);
  }

  public Team findById(Long id) {
    return teamRepository
        .findById(id)
        .orElseThrow(() -> new IllegalArgumentException("Team %d not found".formatted(id)));
  }
}
