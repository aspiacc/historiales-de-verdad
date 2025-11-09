package com.historiales.repository;

import com.historiales.domain.Goal;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GoalRepository extends JpaRepository<Goal, Long> {
  List<Goal> findByMatchIdOrderByMinuteAsc(Long matchId);
}
