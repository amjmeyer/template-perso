// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.

// Boîtes de cours numérotées (construites avec theorion) : un filet de
// couleur à gauche, un fond très clair, une icône et le titre en gras.
//
//   #definition(title: "Fonction")[…]     boîte numérotée ;
//   #definition-block[…]                  la même, sans numéro.
//
// Boîtes : corollaire, definition, tentative-definition, exemple,
// exemple-redige, methode, propriete, theoreme, proposition. Pour chacune :
// <nom>, <nom>-block, <nom>-counter, et show-<nom> (règle appliquée par
// #show: cours).
#import "deps.typ": make-frame, fa-icon

// Rendu commun : fond, filet, icône et titre.
#let _rendu(couleur, icone) = (prefix: none, title: "", full-title: auto, body) => block(
  fill: couleur.lighten(95%),
  stroke: (left: 3pt + couleur),
  inset: 10pt,
  width: 100%,
)[
  #if full-title != none [
    #strong(text(fill: couleur.darken(40%))[
      #if icone != none [#icone #h(0.4em)]
      #full-title
    ])
    #linebreak()
  ]
  #body
]

// Fabrique d'une boîte : (compteur, version sans numéro, boîte, règle show).
#let _boite(identifiant, titre, couleur, icone) = make-frame(
  identifiant,
  titre,
  inherited-levels: 0,
  render: _rendu(couleur, fa-icon(icone)),
)

#let (corollaire-counter, corollaire-block, corollaire, show-corollaire) = _boite(
  "corollaire", "Corollaire", rgb("#7b7d7e"), "arrow-right",
)
#let (definition-counter, definition-block, definition, show-definition) = _boite(
  "definition", "Définition", rgb("#0344a0"), "book-open",
)
#let (tentative-definition-counter, tentative-definition-block, tentative-definition, show-tentative-definition) = _boite(
  "tentative-definition", "Tentative de définition", rgb("#0344a0"), "screwdriver-wrench",
)
#let (exemple-counter, exemple-block, exemple, show-exemple) = _boite(
  "exemple", "Exemple", rgb("#274807"), "pen",
)
#let (exemple-redige-counter, exemple-redige-block, exemple-redige, show-exemple-redige) = _boite(
  "exemple-redige", "Exemple rédigé", rgb("#274807"), "eye",
)
#let (methode-counter, methode-block, methode, show-methode) = _boite(
  "methode", "Méthode", rgb("#a47403"), "route",
)
#let (propriete-counter, propriete-block, propriete, show-propriete) = _boite(
  "propriete", "Propriété", rgb("#136be5"), "check-circle",
)
#let (theoreme-counter, theoreme-block, theoreme, show-theoreme) = _boite(
  "theoreme", "Théorème", rgb("#0663e4"), "landmark",
)
#let (proposition-counter, proposition-block, proposition, show-proposition) = _boite(
  "proposition", "Proposition", rgb("#6a3d9a"), "lightbulb",
)
