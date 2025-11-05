CREATE TABLE autorzy (
  autor_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  imie VARCHAR(50) NULL,
  nazwisko VARCHAR(50) NULL,
  PRIMARY KEY(autor_id)
);

CREATE TABLE autorzy_has_ksiazki (
  autorzy_autor_id INTEGER UNSIGNED NOT NULL,
  ksiazki_ksiazka_id INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(autorzy_autor_id, ksiazki_ksiazka_id),
  INDEX autorzy_has_ksiazki_FKIndex1(autorzy_autor_id),
  INDEX autorzy_has_ksiazki_FKIndex2(ksiazki_ksiazka_id)
);

CREATE TABLE data_wyporzyczenia (
  wypozyczenie_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  wypozyczenia_wypozyczenie_id INTEGER UNSIGNED NOT NULL,
  data_wyp DATE NULL,
  data_oddania DATE NULL,
  PRIMARY KEY(wypozyczenie_id),
  INDEX data_wyporzyczenia_FKIndex1(wypozyczenia_wypozyczenie_id)
);

CREATE TABLE klienci (
  klient_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  imie VARCHAR(45) NULL,
  nazwisko VARCHAR(45) NULL,
  PRIMARY KEY(klient_id)
);

CREATE TABLE klienci_has_wypozyczenia (
  klienci_klient_id INTEGER UNSIGNED NOT NULL,
  wypozyczenia_wypozyczenie_id INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(klienci_klient_id, wypozyczenia_wypozyczenie_id),
  INDEX klienci_has_wypozyczenia_FKIndex1(klienci_klient_id),
  INDEX klienci_has_wypozyczenia_FKIndex2(wypozyczenia_wypozyczenie_id)
);

CREATE TABLE ksiazki (
  ksiazka_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Tytul VARCHAR(255) NULL,
  autor_id INTEGER UNSIGNED NULL,
  rok_wydania DATE NULL,
  PRIMARY KEY(ksiazka_id)
);

CREATE TABLE ksiazki_has_wypozyczenia (
  ksiazki_ksiazka_id INTEGER UNSIGNED NOT NULL,
  wypozyczenia_wypozyczenie_id INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(ksiazki_ksiazka_id, wypozyczenia_wypozyczenie_id),
  INDEX ksiazki_has_wypozyczenia_FKIndex1(ksiazki_ksiazka_id),
  INDEX ksiazki_has_wypozyczenia_FKIndex2(wypozyczenia_wypozyczenie_id)
);

CREATE TABLE wypozyczenia (
  wypozyczenie_id INTEGER UNSIGNED NOT NULL,
  klient_id INTEGER UNSIGNED NULL,
  ksiazka_id INTEGER UNSIGNED NULL,
  PRIMARY KEY(wypozyczenie_id)
);


