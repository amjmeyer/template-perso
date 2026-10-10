# template-perso — repères pour Claude

Paquet **Typst** (modèle + fonctions) : mise en page des cours de maths
d'Arthur Meyer, tirée de son préambule personnel. Même organisation que
`../to-be-published_proflycee-minimal` (à imiter).

## Où est quoi

- [src/lib.typ](src/lib.typ) — point d'entrée, ne fait qu'exporter.
- [src/cours.typ](src/cours.typ) (`#show: cours`), [src/boites.typ](src/boites.typ)
  (boîtes theorion, une fabrique `_boite`), [src/titres.typ](src/titres.typ),
  [src/reponses.typ](src/reponses.typ),
  [src/couleurs.typ](src/couleurs.typ). Clés documentées en tête de chaque
  fichier : source de vérité.
- [src/deps.typ](src/deps.typ) — seul endroit qui importe des paquets.
- [template/main.typ](template/main.typ) — cours de démonstration (modèle
  Universe) ; [thumbnail.png](thumbnail.png) = sa page 1 à 150 ppi.
- Tests : `tests/lancer.sh` (beta, unitaires, erreurs, modèle).
- `PUBLIER.md` — procédure de publication (pas sur GitHub).

## Lien avec les cours

- `src/` est relié par lien symbolique depuis
  `MATHEMATIQUES/PREAMBULE_PERSO_Typst/template-perso` ;
  `template-perso-dev.typ` (ex-`PREAMBULE_GENERAL.typ`) y est un **relais**,
  importé par chaque cours (`#import "/PREAMBULE_PERSO_Typst/template-perso-dev.typ": *`) :
  il importe theorion et les
  autres paquets des cours, puis ce paquet, et définit les réglages perso
  (`style` = `cours` avec les polices Kp et zero, `Brickred`…, `reponseM`,
  et la surcouche `seyes(…, afficher:)[corps]` / `corrige-actif` sur la
  grille de profmaquette-minimal).
  Toute modification de `src/` s'applique aussitôt aux 55 cours.
- Avant/après une modification qui touche au rendu : compiler les cours et
  comparer les images (la réorganisation initiale a été validée au pixel près
  sur les 286 pages).

## Conventions

- Pas de Seyes ni de corrigé dans ce paquet : ils viennent de
  profmaquette-minimal (pas de doublon, pas de conflit sur `corrige`).
- Noms et clés en kebab-case français ; ne pas casser les noms utilisés par
  les cours (`definition-block`, `seyes`, `corrige`, `chapitre`…) : un
  renommage passe par un alias dans le relais.
- Licence MIT : en-tête court en tête de chaque `.typ` de `src/`.
- Le paquet n'exige aucune police à installer (New Computer Modern par
  défaut).

## Pièges connus

- Le relais doit importer ce paquet APRÈS theorion : `definition`,
  `proposition`… remplacent alors celles de theorion.
- Les clés d'état et de compteur sont préfixées `template-perso-` pour ne pas
  heurter celles d'autres paquets.
