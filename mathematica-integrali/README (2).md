# Tabela nedoločenih integralov z Mathematico

Ta repozitorij vsebuje projektno nalogo, v kateri z orodjem Wolfram Mathematica
sestavim pregledno tabelo nedoločenih integralov osnovnih elementarnih funkcij
in jo izvozim v format PDF. Projekt je pripravljen pri predmetu Računalniška
orodja v matematiki, 1. letnik, Fakulteta za matematiko in fiziko, Univerza v
Ljubljani.

## Povzetek

V nalogi z ukazom `Integrate` izračunamo nedoločene integrale izbranih funkcij
(potenčnih, trigonometričnih, eksponentnih, logaritemskih, racionalnih in
korenskih). Rezultate uredimo v tabelo, ki prikazuje integrand in analitični
rezultat integracije, na koncu pa tabelo izvozimo v PDF, primeren za tisk in
deljenje.

## Načrt projekta

1. Uvod in kratka razlaga nedoločenega integrala.
2. Osnovni prikaz: izračun integralov z `Integrate`, enostavna tabela z `Grid`
   in nekaj grafov funkcij skupaj z njihovimi integrali.
3. Naprednejši prikaz:
   - lastna funkcija z `Module`, ki sestavi vrstico tabele in preveri pravilnost,
   - `Map` in `MapThread` za obdelavo seznamov,
   - `Apply` za preverjanje vseh integralov naenkrat,
   - `Dataset` in poizvedbe (`Query`, `GroupBy`, `Select`).
4. Izvoz končne tabele v PDF (lokalna pot določena z `NotebookDirectory[]`).
5. Zaključek.

## Datoteke

- `Tabela-integralov.nb` – glavna beležnica (odpri v Mathematici in poženi).
- `koda-za-kopiranje.wl` – ista koda kot golo besedilo (rezerva za kopiranje).
- `tabela-integralov.pdf` – izvožena tabela (nastane po zagonu beležnice).

## Zagon

1. Odpri `Tabela-integralov.nb` v Wolfram Mathematici.
2. Beležnico **shrani** (potrebno za `NotebookDirectory[]`).
3. Evaluate Notebook (meni **Evaluation → Evaluate Notebook**).
4. V mapi z beležnico nastane `tabela-integralov.pdf`.

Poti so nastavljene relativno (`NotebookDirectory[]`), zato koda deluje na
poljubnem računalniku brez ročnega popravljanja.

## Video posnetek

<!-- Sem prilepi povezavo do videa, ko ga posnameš -->
Povezava: _(dodaj)_

Pripravil: Edis Kovačević
