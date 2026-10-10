// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.

// Chapitre, titres et table des matières.
//
//   #chapitre("Suites", "Chapitre 3", "1re")   -> en-tête de chapitre : numéro,
//                                                titre, classe à droite, filet ;
//   #toc()                                    -> table des matières (titres I,
//                                                II… et sous-titres Ⓐ, Ⓑ…) ;
//   = Titre / == Sous-titre                   -> I - Titre (rouge brique),
//                                                Ⓐ Sous-titre (vert forêt),
//                                                avec #show: cours.
//
// Clés de chapitre :
//   couleur    couleur du numéro, du titre et du filet ............. navy
// Clés de toc :
//   aeration   multiplie les espacements verticaux (1 = serré) ..... 1.8
#import "couleurs.typ": brick-red, forest-green

#let _c-titre = counter("template-perso-titre")
#let _c-soustitre = counter("template-perso-soustitre")

#let chapitre(titrechapitre, numerochapitre, classe, couleur: navy) = block(
  width: 100%,
  above: 1.2em,
  below: 2em,
  stroke: (bottom: 1.5pt + couleur),
  inset: (bottom: 1em),
)[
  #text(size: 20pt, fill: couleur, weight: "bold")[#numerochapitre]

  #text(size: 20pt, fill: couleur, weight: "bold")[#titrechapitre]
  #align(right)[
    #text(size: 10pt, fill: couleur, weight: "bold")[#classe]
  ]
]

// Petite lettre entourée d'un cercle (sous-titres).
#let lettre-entouree(lettre) = {
  let taille = measure(lettre)
  let diametre = calc.max(taille.width, taille.height) + 0.4em
  box(circle(
    radius: diametre / 2,
    stroke: 1pt + forest-green,
  )[#align(center + horizon)[#lettre]])
}

#let toc(aeration: 1.8) = context {
  block(above: 2em, below: 1.5em)[
    #text(size: 16pt, weight: "bold", fill: navy)[Table des matières]
  ]
  for entree in query(heading.where(outlined: true)) {
    let loc = entree.location()
    let page-num = counter(page).at(loc).first()
    if entree.level == 1 {
      let numero = numbering("I", _c-titre.at(loc).first() + 1)
      block(above: 0.9em * aeration, below: 0.6em * aeration)[
        #link(loc, strong(text(fill: brick-red)[#numero - #entree.body]))
        #box(width: 1fr, repeat(gap: 0.25em)[.])
        #text(fill: black, str(page-num))
      ]
    } else if entree.level == 2 {
      let numero = numbering("A", _c-soustitre.at(loc).first() + 1)
      let lettre = text(fill: forest-green, size: 9pt)[#numero]
      block(above: 0.6em * aeration, below: 0.6em * aeration, inset: (left: 1.5em))[
        #link(loc, lettre-entouree(lettre))
        #link(loc, text(fill: forest-green)[ #entree.body])
        #box(width: 1fr, repeat(gap: 0.25em)[.])
        #text(fill: black, str(page-num))
      ]
    }
  }
}

// Rendu des titres (règles show posées par cours).
#let _titre-1(it) = {
  _c-titre.step()
  _c-soustitre.update(0)
  block(above: 1.4em, below: 1em)[
    #text(fill: brick-red, weight: "bold", size: 16pt)[
      #context _c-titre.display("I") - #it.body
    ]
  ]
}

#let _titre-2(it) = {
  _c-soustitre.step()
  block(above: 1em, below: 1em)[
    #context {
      h(0.5em)
      let lettre = text(fill: forest-green, weight: "bold", size: 13pt)[
        #_c-soustitre.display("A")
      ]
      lettre-entouree(lettre)
    }
    #text(fill: forest-green, weight: "bold", size: 13pt)[#it.body]
  ]
}
