package com.historiales.dto;

public record TeamDto(
    Long id,
    String name,
    String nickname,
    String stadium,
    Integer foundedYear,
    String city) {}
