// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.

// Mise en page générale d'un cours : #show: cours (ou cours.with(clés)).
//
// A4, marges de 1,5 cm, numéro « page/total » en bas à droite, texte en
// français, boîtes numérotées, titres I / Ⓐ, listes numérotées « 1. » en gras
// puis « a) », liens externes en cyan soulignés. Les maths en ligne qui
// contiennent une fraction écartent les lignes voisines.
//
// Clés :
//
//   police         police du texte (et des chaînes "…" en maths) .. "New Computer Modern"
//   police-maths   police des maths ............................... "New Computer Modern Math"
//   taille         taille du texte ................................ 10pt
//   langue         langue du document ............................. "fr"
#import "deps.typ": show-theorion
#import "couleurs.typ": _cyan
#import "boites.typ": *
#import "titres.typ": _titre-1, _titre-2

// Listes numérotées : « 1. » en gras au premier niveau, « a) » ensuite.
#let _numerotation(..n) = {
  let n = n.pos()
  if n.len() == 1 { strong(numbering("1.", n.at(0))) } else { numbering("a)", n.at(1)) }
}

// Liens externes en cyan soulignés, liens internes inchangés.
#let _lien(it) = if type(it.dest) == str {
  set text(fill: _cyan)
  underline(it)
} else { it }

#let cours(
  body,
  police: "New Computer Modern",
  police-maths: "New Computer Modern Math",
  taille: 10pt,
  langue: "fr",
) = {
  set text(lang: langue, size: taille, font: police)
  set page(
    paper: "a4",
    margin: (x: 1.5cm, y: 1.5cm),
    numbering: "1/1",
    footer: [
      #set align(center)
      #h(1fr)
      #context counter(page).display("1/1", both: true)
    ],
  )

  show: show-theorion
  show: show-corollaire
  show: show-definition
  show: show-tentative-definition
  show: show-exemple
  show: show-exemple-redige
  show: show-methode
  show: show-propriete
  show: show-theoreme
  show: show-proposition

  show math.equation: it => {
    set text(font: police-maths)
    show text: set text(font: police) // les chaînes "…" en police du texte
    it
  }
  // maths en ligne avec une fraction : l'interligne s'agrandit
  show math.equation.where(block: false): it => {
    if repr(it.body).contains("frac(") {
      set text(top-edge: "bounds", bottom-edge: "bounds")
      it
    } else { it }
  }
  set enum(numbering: _numerotation, full: true)
  show heading.where(level: 1): _titre-1
  show heading.where(level: 2): _titre-2
  show link: _lien

  body
}
