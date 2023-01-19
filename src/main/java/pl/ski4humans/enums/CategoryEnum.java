package pl.ski4humans.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CategoryEnum {
  SKIS(1),
  SKISHOES(2),
  SKIPOLES(3),
  SKIHELMETS(4),
  SKIGOGGLES(5),
  SKIGLOVES(6),
  THERMOACTIVECLOTHING(7),
  ZERO(0);

  private final int category;
}
