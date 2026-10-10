// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.

// Point d'entrée du paquet.
//
// template-perso : mise en page de cours de mathématiques (en français) —
// boîtes numérotées, chapitres, titres et table des matières, réponses
// encadrées.
//
// Organisation de src/ :
//   lib.typ       ce fichier
//   deps.typ      dépendances externes (theorion, fontawesome)
//   couleurs.typ  couleurs du paquet
//   cours.typ     #show: cours (mise en page générale)
//   boites.typ    boîtes numérotées (definition, propriete…)
//   titres.typ    chapitre, titres, table des matières
//   reponses.typ  réponses encadrées

#import "cours.typ": cours
#import "boites.typ": (
  corollaire, corollaire-block, corollaire-counter,
  definition, definition-block, definition-counter,
  tentative-definition, tentative-definition-block, tentative-definition-counter,
  exemple, exemple-block, exemple-counter,
  exemple-redige, exemple-redige-block, exemple-redige-counter,
  methode, methode-block, methode-counter,
  propriete, propriete-block, propriete-counter,
  theoreme, theoreme-block, theoreme-counter,
  proposition, proposition-block, proposition-counter,
)
#import "titres.typ": chapitre, toc, lettre-entouree
#import "reponses.typ": reponse, reponse-maths
#import "couleurs.typ": brick-red, forest-green
