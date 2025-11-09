package com.historiales.service;

import com.historiales.domain.Tournament;
import com.historiales.repository.TournamentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TournamentService {

  private final TournamentRepository tournamentRepository;

  public Page<Tournament> findAll(Pageable pageable) {
    return tournamentRepository.findAll(pageable);
  }

  public Tournament findById(Long id) {
    return tournamentRepository
        .findById(id)
        .orElseThrow(
            () -> new IllegalArgumentException("Tournament %d not found".formatted(id)));
  }
}
