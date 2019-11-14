package pl.ski4humans.enums;

public enum SexPLEnum {
    ALL("Wszystkie"),
    MAN("Mężczyzni"),
    WOMAN("Kobiety"),
    CHILD("Dzieci"),
    ZERO("Brak");

    private String sex;

    SexPLEnum(String sex) {
        this.sex = sex;
    }

    public String getSex() {
        return sex;
    }
}
