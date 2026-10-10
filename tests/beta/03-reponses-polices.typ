// Réponses encadrées, fonction-accolade, fraction en ligne (interligne),
// liens, listes, et une autre police.
#import "../../src/lib.typ": *
#set page(height: auto)
#show: cours.with(police: "Libertinus Serif")

On trouve #reponse[$x = 3$] et #reponse-maths($1/2$).

$ #fonction-accolade($f$, $RR$, $x$, $x^2$) $

Une ligne avec $display(1/2)$ en ligne, suivie d'une autre ligne de texte pour
voir l'interligne agrandi autour de la fraction.

+ Premier point
  + sous-point
+ Second point

Voir #link("https://typst.app")[le site de Typst].
