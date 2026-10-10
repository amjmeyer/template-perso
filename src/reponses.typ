// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.

// Réponses mises en valeur, sur fond jaune encadré.
//
//   #reponse[$x = 3$]            dans le texte ;
//   #reponse-maths($1/2$)        formule en grand (display), bornes
//                                  ajustées à son contenu.

#let _fond = yellow.lighten(40%)

#let reponse(x) = box(
  fill: _fond,
  stroke: black + 1pt,
  radius: 2pt,
  inset: (x: 3pt),
  outset: (y: 4pt),
  x,
)

#let reponse-maths(x) = box(
  fill: _fond,
  stroke: black + 1pt,
  radius: 2pt,
  inset: (x: 3pt, y: 4pt),
  {
    set text(top-edge: "bounds", bottom-edge: "bounds")
    $display(#x)$
  },
)
