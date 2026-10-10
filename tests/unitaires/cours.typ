// Tests unitaires de src/cours.typ et des petites fonctions (réponses,
// réponses encadrées) : polices, page, listes, liens.
#import "aide.typ": *
#import "/src/lib.typ": *

// réponses
#egal(texte(reponse[$x = 3$]), "x=3", quoi: "reponse")
#egal(texte(reponse-maths($1/2$)), "(1)/(2)", quoi: "reponse-maths")

// polices par défaut : New Computer Modern, texte et maths
#[
  #show: cours
  #releve-polices("defaut", [Texte $x + 1$ et $"mot"$])
]
#context {
  let p = polices("defaut")
  assert("new computer modern" in p, message: "police du texte : " + repr(p))
}

// clés police / police-maths (polices fournies par Typst)
#[
  #show: cours.with(police: "Libertinus Serif", police-maths: "New Computer Modern Math")
  #releve-polices("libertinus", [Texte $x$ et $"mot"$])
]
#context {
  let p = polices("libertinus")
  assert("libertinus serif" in p, message: "clé police : " + repr(p))
  // les chaînes "…" en maths prennent la police du texte, pas celle par défaut
  assert(not ("new computer modern" in p), message: "chaîne en maths : " + repr(p))
}


// taille et langue
#[
  #show: cours.with(taille: 12pt, langue: "en")
  #context egal(text.size, 12pt, quoi: "taille")
  #context egal(text.lang, "en", quoi: "langue")
]
#[
  #show: cours
  #context egal(text.size, 10pt, quoi: "taille par défaut")
  #context egal(text.lang, "fr", quoi: "langue par défaut")
]

// listes numérotées : 1. puis a)
#[
  #show: cours
  #releve-textes("liste", [
    + un
      + sous
    + deux
  ])
]
#context {
  let t = textes("liste")
  assert(t.contains("1.") and t.contains("2.") and t.contains("a)"), message: "numérotation des listes : " + repr(t))
}

// liens externes en cyan, liens internes inchangés
#[
  #show: cours
  #releve("lien", link("https://typst.app")[site])
]
#context egal(couleurs("lien"), (rgb("#00BFFF"),), quoi: "lien externe cyan")

cours : ok
