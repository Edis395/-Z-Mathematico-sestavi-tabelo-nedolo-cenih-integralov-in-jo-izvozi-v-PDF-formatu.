(* ============================================================ *)
(*  TABELA NEDOLO\[CapitalCHacek]ENIH INTEGRALOV Z MATHEMATICO                  *)
(*  Rezervna koda za kopiranje v Mathematico, \[CHacek]e se .nb          *)
(*  ne bi odprla pravilno. Prilepite blok po blok v bele\[ZHacek]nico.   *)
(* ============================================================ *)

(* --- 2. OSNOVNI PRIKAZ --- *)

Integrate[x^2, x]
Integrate[Sin[x], x]
Integrate[1/x, x]
TraditionalForm[Integrate[Exp[x] Cos[x], x]]

funkcije = {x^3, 1/x, Exp[x], Sin[x], Cos[x], 1/(1 + x^2), Sec[x]^2, 1/Sqrt[1 - x^2]};

osnovnaTabela = Table[{TraditionalForm[f], TraditionalForm[Integrate[f, x]]}, {f, funkcije}];
Grid[Prepend[osnovnaTabela, {"f(x)", "integral f(x) dx"}], Frame -> All,
  Background -> {None, {1 -> LightBlue}}]

Plot[{Sin[x], Integrate[Sin[x], x]}, {x, -2 Pi, 2 Pi},
  PlotLegends -> {"f(x) = sin(x)", "F(x) = -cos(x)"}, AxesLabel -> {"x", "y"}]

GraphicsGrid[Partition[
  Table[Plot[{f, Integrate[f, x]}, {x, -2, 2}, PlotLabel -> TraditionalForm[f]],
   {f, {x^3, Exp[x], Cos[x], 1/(1 + x^2)}}], 2]]

(* --- 3. NAPREDNEJ\[CapitalSHacek]I PRIKAZ --- *)

integralVrstica[f_] := Module[{F, preveri},
  F = Integrate[f, x];
  preveri = Simplify[D[F, x] - f] === 0;
  {TraditionalForm[f], TraditionalForm[F], preveri}
]

vrstice = Map[integralVrstica, funkcije];
Grid[Prepend[vrstice, {"funkcija", "integral", "preverjeno?"}], Frame -> All,
  Background -> {None, {1 -> LightGreen}}]

kategorije = {"poten\[CHacek]na", "logaritemska", "eksponentna", "trigonometri\[CHacek]na",
   "trigonometri\[CHacek]na", "racionalna", "trigonometri\[CHacek]na", "korenska"};
oznacene = MapThread[
  {#1, TraditionalForm[#2], TraditionalForm[Integrate[#2, x]]} &,
  {kategorije, funkcije}];
Grid[Prepend[oznacene, {"kategorija", "f(x)", "integral"}], Frame -> All]

vsiPravilni = Apply[And, Map[Simplify[D[Integrate[#, x], x] - #] === 0 &, funkcije]]

zbirka = Dataset[MapThread[
   <|"Kategorija" -> #1, "Funkcija" -> #2, "Integral" -> Integrate[#2, x]|> &,
   {kategorije, funkcije}]]

zbirka[GroupBy["Kategorija"], Length]

zbirka[Select[#Kategorija == "trigonometri\[CHacek]na" &]]

(* --- 4. IZVOZ V PDF --- *)

koncnaTabela = Grid[
  Prepend[
   MapThread[{#1, TraditionalForm[#2], TraditionalForm[Integrate[#2, x]]} &, {kategorije, funkcije}],
   {"Kategorija", "Funkcija f(x)", "Nedolo\[CHacek]eni integral"}],
  Frame -> All, Spacings -> {2, 1}, Background -> {None, {1 -> LightYellow}}];

koncniDokument = Column[{
   Style["Tabela nedolo\[CHacek]enih integralov", Bold, 18],
   Style["Avtor: Edis Kova\[CHacek]evi\[CAcute]", Italic, 11],
   koncnaTabela}, Spacings -> 2];
koncniDokument

izhodnaPot = FileNameJoin[{NotebookDirectory[], "tabela-integralov.pdf"}];
Export[izhodnaPot, koncniDokument]
