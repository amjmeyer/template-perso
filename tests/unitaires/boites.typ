// Tests unitaires de src/boites.typ : numérotation, titres, versions sans
// numéro, couleurs et icônes, dans un document mis en page par cours.
#import "aide.typ": *
#import "/src/lib.typ": *
#show: cours

#releve-textes("boites", [
  #definition[A]
  #definition(title: "Fonction")[B]
  #definition-block[C]
  #propriete[D]
  #theoreme[E]
  #proposition[F]
  #corollaire[G]
  #methode(title: "Comparer")[H]
  #exemple[I]
  #exemple-redige[J]
  #tentative-definition[K]
  #propriete[L]
])

#context {
  let t = textes("boites")
  for m in (
    "Définition1", "Définition2(Fonction)", "Propriété1", "Théorème1", "Proposition1",
    "Corollaire1", "Méthode1(Comparer)", "Exemple1", "Exempleré", "Tentativededéfinition1", "Propriété2",
  ) {
    assert(t.replace(" ", "").contains(m), message: "boîtes : « " + m + " » absent de " + repr(t))
  }
  // la version -block n'a pas de numéro et ne consomme pas le compteur
  assert(not t.replace(" ", "").contains("Définition3"), message: "definition-block numérotée")
  egal(t.replace(" ", "").matches("Définition").len(), 3, quoi: "trois titres Définition")
}

// couleurs propres à chaque boîte (titres), et compteurs
#releve("c-def", definition[x])
#releve("c-prop", propriete[x])
#releve("c-meth", methode[x])
#context {
  assert(couleurs("c-def") != couleurs("c-prop"), message: "définition et propriété de même couleur")
  assert(couleurs("c-meth").len() >= 1, message: "méthode sans couleur")
}

// largeur : toute la ligne
#context {
  let m = measure(block(width: 10cm, definition[texte court]))
  proche(m.width / 10cm, 1, tol: 0.01, quoi: "boîte sur toute la largeur")
}

boites : ok
