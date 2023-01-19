package pl.ski4humans.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CategoryPLEnum {
  SKIS("NARTY"),
  SKISHOES("BUTY NARCISRSKIE"),
  SKIPOLES("KIJKI NARCISRSKIE"),
  SKIHELMETS("KASKI NARCISRSKIE"),
  SKIGOGGLES("GOGLE NARCISRSKIE"),
  SKIGLOVES("RĘKAWICE NARCISRSKIE"),
  THERMOACTIVECLOTHING("ODZIEŻ TERMOAKTYWANA"),
  ZERO("BRAK");

  private final String category;
}
