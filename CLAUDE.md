# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Not a software project. This is a study-material archive for FernUniversität in Hagen module **63517 "Informations- und Kodierungstheorie"** (Prof. Dr. Jörg Keller): textbook, Leittext, assignments and a practice exam, almost entirely PDFs. There is no build, lint or test step. The directory is a git repository.

All material is in German. Answer and write notes in German unless asked otherwise, and keep the textbook's terminology (Codierung, präfixfreier Code, Kraft'sche Ungleichung, Blockcode, Hamming-Distanz, Syndromdecodierung, Einsendeaufgabe, …) instead of translating it. The faculty writes "Kodierung", the textbook "Codierung"; both spellings occur in the material. For content taken from the book use the book's spelling.

## Working with the PDFs

`pdftotext` and `pdfinfo` (poppler) are installed and are the fastest way to search across the material; all PDFs have a text layer:

```sh
b="11-kurstext/wise-26/einführung-in-die-codierungs-und-informationstheorie-v2.pdf"   # umlaut in the name – quote it
pdftotext -f 168 -l 225 -layout "$b" - | less                    # page range of the 654-page book
pdftotext "$b" - | grep -n -i "kraft'sche"
for f in 12-einsendeaufgaben/wise-26/*.pdf; do pdftotext "$f" - | grep -n -i "huffman" | sed "s|^|$f: |"; done
```

Formulas, tables, code trees, matrices and figures come out mangled in text extraction, and the page numbers in the book's table of contents are partly lost. Where exact math or a diagram matters, read the PDF pages directly (Read tool with `pages`) rather than trusting the extracted text.

PDF page and printed book page are not the same and the offset is not constant: they coincide in chapters 1–3, differ by 1 in chapters 4–5 (PDF 273 = book page 274) and by 2 from chapter 6 on (PDF 338 = book page 340). `-f`/`-l` and the Read tool take PDF pages; the table of contents, the Leittext and the assignments cite book pages. Check the running head of the page before citing a page number.

## Layout

Numbered prefixes are a personal filing scheme (1x = official course material, 3x = extras, 5x = own notes, 99 = own summaries).

- `10-organisatorisch/` — semester info letter; still empty.
- `11-kurstext/<semester>/` — the textbook, that semester's Leittext and its supplement, and the slides for Lektion 5 (see below).
- `12-einsendeaufgaben/<semester>/` — `uebung-infcod-N.pdf` (assignment for Lektion N) and `uebung-infcod-N-lsg.pdf` (the same sheet with Lösungshinweise). Solutions appear during the semester; so far only for sheet 1.
- `13-klausuren/` — practice exam (`…Uebungsklausur_WiSe_2024_25.pdf`, 18 pages, no solutions).
- `14-veranstaltungen/<semester>/`, `31-extras/<semester>/` — still empty.
- `51-errata/errata-online.md` — link to the book author's errata page. Entries are listed per edition and the page numbers of the 1st edition differ from the 2nd. An error listed only for the 1st edition can still be present in the 2nd (e.g. the years 1938/1944 instead of 1838/1844 on p. 38), so check the page image.
- `99-zusammenfassung/<edition>/` — own summaries per Lektion as AsciiDoc (`L<n>-vollstaendig.adoc`), cropped figures in `images/`, generated PDF next to the source. `stil.adoc` holds the shared styles, `pdf.sh <file.adoc>` builds the PDF (HTML + MathJax via headless Chrome; `asciidoctor-pdf` cannot typeset the formulas). To create or change a summary use the user-level skill `zusammenfassung`; the course-specific rules (scope per Lektion, what to leave out, markup) are in `99-zusammenfassung/kurs.md` and take precedence over the skill. `L1` is purely historical and deliberately not the reference example.

`wise` = Wintersemester, named after the year it starts (`wise26` = WiSe 2026/27, the current semester). Folders use a hyphen (`wise-26`), file names do not (`leittext-wise26.pdf`).

## Course text structure

The module has no script of its own. Lektionen 1–4 are chapters of a textbook, and their scope is defined by three documents that must be read together:

- **Basistext**: Dirk W. Hoffmann, *Einführung in die Informations- und Codierungstheorie*, 2nd edition, Springer Vieweg 2023 (654 pages).
- **Leittext** (`leittext-wise26.pdf`, 18 pages): per Lektion the learning objectives and the reading instruction naming the book chapters. It still refers to the 1st edition (2014).
- **Ergänzung zum Leittext** (`leittext-wise26.md`): maps the Leittext to the 2nd edition — the new section 4.6 "ANS-Codierung" is *not* part of the module, the former sections 4.6 ff. are now 4.7 ff., and in 6.4.5 only headings changed.

So the scope of a Lektion is given by the Leittext, not by the book chapter, and Lektion numbers differ from chapter numbers (section numbers below are those of the 2nd edition):

| Lektion | Book | PDF pages | Scope |
|---|---|---|---|
| 1 Einführung | Kapitel 1 Geschichte der Nachrichtentechnik | 15–80 | whole chapter |
| 2 Codierung, Codes, Information | Kapitel 3 | 167–225 | whole chapter |
| 3 Quellencodierung | Kapitel 4 | 226–313 | without 4.6 (ANS); 5.1 and 5.2 (entropy) are recommended but not mandatory — the module does not define Shannon entropy |
| 4 Kanalcodierung | Kapitel 6 up to and including 6.4.5 | 337–442 | 6.4.6 ff. (Hadamard, Simplex, Reed-Muller, Faltungscodes) are optional |
| 5 Ausblick | not in the book | — | slide sets `M63517-L5a.pdf` (Kryptografie, 10 slides) and `M63517-L5b.pdf` (Erasure und Fountain Codes, 9 slides) |

The Lektion 5 slides are the only source for that Lektion: bullet points without section numbers, so refer to them by slide number.

Kapitel 2 (Mathematische Grundlagen: modular arithmetic, groups, finite fields, vector spaces) is not a Lektion of its own but the reference for the mathematics used, especially in Lektion 4. Kapitel 5.3 ff., 7 and 8 are outside the module.

Each book chapter ends with "Übungsaufgaben"; their solutions are not in the book (web codes to the author's site). Einsendeaufgabe sheet N covers Lektion N and refers to figures of the Basistext ("Abb. 3.18").

## Exam context

The form of the module exam, its length and the permitted aids are not documented in the repo (the Leittext points to the faculty's Prüfungsinformationen) — ask rather than assume. The practice exam in `13-klausuren/` shows the style of written tasks: constructing and analysing codes, short proofs and justifications, calculations by hand.
