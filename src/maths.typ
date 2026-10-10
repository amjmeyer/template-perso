// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.

// Écritures mathématiques.
//
//   $#fonction-accolade($f$, $RR$, $x$, $x^2$)$
//     -> f : R → R, x ↦ x² sous une accolade (comme \fonctionAccolade).

#let fonction-accolade(dom, codom, x, fx) = math.cases(
  $#dom arrow.r #codom$,
  $#x arrow.r.bar #fx$,
)
