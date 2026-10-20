# Kursdatei für Zusammenfassungen

Kursspezifische Angaben für den Skill `zusammenfassung`. Der allgemeine Ablauf und das Format stehen im Skill; hier steht nur, was für diesen Kurs gilt. Bei Widersprüchen hat diese Datei Vorrang.

## Kurs

- Modul/Kurs: 63517 Informations- und Kodierungstheorie
- Hochschule, Lehrende: FernUniversität in Hagen, Prof. Dr. Jörg Keller
- Sprache der Quelle und der Zusammenfassung: Deutsch
- Terminologie: Begriffe und Schreibweise des Basistexts („Codierung“, „Code“, „präfixfrei“ – nicht die Fakultätsschreibweise „Kodierung“). Englische Begriffe in Klammern dahinter, wo das Buch sie nennt.

## Quelle

Der Kurs hat keinen eigenen Lehrtext. Lektion 1–4 sind Kapitel des Basistexts; welche, legt der Leittext fest. Lektion 5 besteht nur aus zwei Foliensätzen.

- Basistext: `11-kurstext/<ausgabe>/einführung-in-die-codierungs-und-informationstheorie-v2.pdf` (Hoffmann, Einführung in die Informations- und Codierungstheorie, 2. Auflage 2023; 654 PDF-Seiten). Seitenformat 536 × 641 pt, im Read-Tool also ≈ 744 × 890 px (nicht A4) – Crop-Koordinaten darauf beziehen.
- Seitenversatz: Kapitel 1–3 PDF-Seite = Buchseite; Kapitel 4–5 Buchseite = PDF-Seite + 1; ab Kapitel 6 Buchseite = PDF-Seite + 2. Vor einem Seitenverweis die Kopfzeile der Seite prüfen.
- Leittext: `11-kurstext/<ausgabe>/leittext-<ausgabe ohne Bindestrich>.pdf` (Lernziele und Lesehinweis je Lektion; bezieht sich auf die 1. Auflage) und die Ergänzung `leittext-<…>.md` (Abweichungen der 2. Auflage).
- Einheiten: `L1`–`L5`. Ausgabedatei `99-zusammenfassung/<ausgabe>/L<n>-vollstaendig.adoc`.
- Standardausgabe: `wise-26`
- Abschnittsnummerierung: im Buch durchgehend vorhanden → keine Seitenangaben an Überschriften. Die Folien zu L5 haben keine Abschnittsnummern → Überschriften mit Folientitel und Foliennummer.

| Einheit | Inhalt | PDF-Seiten |
|---------|--------|-----------|
| L1 | Kapitel 1 Geschichte der Nachrichtentechnik | 15–80 (Inhalt bis 73, danach 1.8 Übungsaufgaben) |
| L2 | Kapitel 3 Codierungen, Codes und Information | 167–225 |
| L3 | Kapitel 4 Quellencodierung ohne 4.6; dazu 5.1 und 5.2 (empfohlen, nicht verpflichtend) | 226–313; 314 ff. |
| L4 | Kapitel 6 Kanalcodierung bis einschließlich 6.4.5 | 337–442 |
| L5 | Foliensätze `M63517-L5a.pdf` (Kryptografie) und `M63517-L5b.pdf` (Erasure und Fountain Codes) | je ganz |

Kapitel 2 (Mathematische Grundlagen) ist keine Lektion, sondern Nachschlagestoff vor allem für L4; es wird nicht eigens zusammengefasst.

## Auslassen

- Vorwort, Kapitelvorspann „In diesem Kapitel werden Sie …“, Übungsaufgaben am Kapitelende, Literaturverweise im Fließtext.
- Biografische Kästen (Kalenderblatt-Kästen zu einzelnen Personen) und reine Porträt- oder Fotoabbildungen.
- Abschnitt 4.6 ANS-Codierung: laut Ergänzung zum Leittext nicht Bestandteil des Moduls – Inhalt weglassen, im Kopf von L3 nennen.
- Kapitel 6 ab 6.4.6 und alles außerhalb der Lesehinweise.

## Prüfungsstoff

Eingrenzung nur über die Lesehinweise des Leittexts; das Buch selbst kennzeichnet nichts. Die Abschnitte 5.1 und 5.2 sind „empfehlenswert, aber nicht verpflichtend“ und bekommen in L3 das Etikett `[.nk]#nicht klausurrelevant#`.

## Auszeichnungen

- Begriffe, die das Buch bei der Einführung kursiv setzt, bei ihrer Einführung fett.
- Definitionen und Sätze des Buchs (im Buch durch Symbole gekennzeichnet, siehe Symbolwegweiser) wörtlich als Beispielblock mit Titel `.Definition x.y (Titel)` bzw. `.Satz x.y (Titel)`.
- Abbildungen und Tabellen heißen `Abbildung x.y` / `Tabelle x.y` wie im Buch (dort abgekürzt „Abb.“).
- Codewörter und Bitfolgen als `` `0110` ``.
- Keine zusätzlichen Stile in `stil.adoc`.

## Prüfung

- Form und Umfang: offen – im Repo nicht dokumentiert (der Leittext verweist auf die Prüfungsinformationen der Fakultät). Vor einer Zusammenfassung der Art `klausur` erfragen.
- Hilfsmittel: offen.
- Altklausuren: `13-klausuren/` (bisher nur eine Übungsklausur ohne Lösungen).
- Übungs-/Einsendeaufgaben: `12-einsendeaufgaben/<ausgabe>/` (`uebung-infcod-N.pdf`, Lösungshinweise `…-lsg.pdf`; Blatt N gehört zu Lektion N).
- Errata: `51-errata/errata-online.md` (Link auf die Errata-Seite des Buchautors). Die Einträge sind nach Auflage getrennt, und die Seitenzahlen der 1. Auflage weichen von der 2. ab. Fehler der 1. Auflage können in der 2. fortbestehen, ohne dort noch einmal gelistet zu sein – die Stelle am Seitenbild prüfen.

## Referenzbeispiel

Noch keines. `wise-26/L1-vollstaendig.adoc` ist ausdrücklich **keine** Referenz: Kapitel 1 ist rein geschichtlich, ohne Definitionen und Formeln, und deutlich stärker verdichtet als der Richtwert des Skills. Probelauf und Referenz wird die erste abgenommene Lektion mit Definitionen und Formeln (voraussichtlich L2).

Zu L1 gibt es zusätzlich `wise-26/L1-kurz.adoc`: eine aus der vollständigen Fassung abgeleitete Kurzfassung (Codes der Telegrafen, Morse-Code und 1.7 ausführlich, Geschichte nur in Stichpunkten). Die Abschnitte 1.3.2 (Morse-Codes, Errata-Hinweis) und 1.7 sind dort wörtlich übernommen – Korrekturen an diesen Stellen in beiden Dateien nachziehen.

## Regeln aus Korrekturen

Noch keine.
