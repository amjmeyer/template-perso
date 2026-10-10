// Tests unitaires de src/lib.typ : exactement les fonctions publiques.
#import "aide.typ": *
#import "/src/lib.typ"

#{
  let boites = ("corollaire", "definition", "tentative-definition", "exemple", "exemple-redige", "methode", "propriete", "theoreme", "proposition")
  let publiques = ("cours", "chapitre", "toc", "lettre-entouree", "reponse", "reponse-maths", "fonction-accolade", "brick-red", "forest-green")
  publiques += boites + boites.map(b => b + "-block") + boites.map(b => b + "-counter")
  let exportes = dictionary(lib).keys()
  for nom in publiques { assert(nom in exportes, message: "lib.typ n'exporte pas " + nom) }
  for nom in exportes { assert(nom in publiques, message: "lib.typ exporte en trop : " + nom) }
  // pas de Seyes ni de corrigé : ils viennent de profmaquette-minimal
  for nom in ("seyes", "corrige", "corrige-actif") { assert(not (nom in exportes), message: nom + " ne doit pas être exporté") }
}

lib : ok
