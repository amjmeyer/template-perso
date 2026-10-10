#import "@preview/template-perso:0.1.0": *

#show: cours
// Pour retrouver une police installée sur votre machine :
// #show: cours.with(police: "Libertinus Serif")

#chapitre("Fonctions de référence", "Chapitre 2", "Seconde")

#toc()

= La fonction carré

== Définition

#definition(title: "Fonction carré")[
  La fonction carré est la fonction $f$ définie sur $RR$ par $f(x) = x^2$ :
  $ #fonction-accolade($f$, $RR$, $x$, $x^2$) $
]

#propriete[
  Pour tout réel $x$, $(-x)^2 = x^2$ : deux réels opposés ont le même carré.
]

#exemple(title: "Calculer des images")[
  Calculer $f(-3)$ et $f(1/2)$.

  $f(-3) = (-3)^2 = 9$ et $f(1/2) = (1/2)^2 = 1/4$.
]

== Variations

#theoreme[
  La fonction carré est décroissante sur $]-oo ; 0]$ et croissante sur
  $[0 ; +oo[$.
]

#methode(title: "Comparer deux carrés")[
  Pour comparer $a^2$ et $b^2$, on place $a$ et $b$ sur un même intervalle
  où la fonction carré est monotone.
]

#exemple-redige(title: "Comparer deux carrés")[
  Comparer $1","5^2$ et $1","6^2$.

  $0 <= 1","5 < 1","6$ et la fonction carré est croissante sur $[0 ; +oo[$,
  donc #reponse[$1","5^2 < 1","6^2$].
]

= La fonction inverse

#definition-block[
  La fonction inverse est définie sur $RR^*$ par $g(x) = 1/x$ ; on a
  #reponse-maths($g(2) = 1/2$).
]
