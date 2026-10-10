// Tests unitaires de src/titres.typ : chapitre, titres I / Ⓐ, table des matières.
#import "aide.typ": *
#import "/src/lib.typ": *
#show: cours

#egal(texte(chapitre("Suites", "Chapitre 3", "1re")), "Chapitre3Suites1re", quoi: "chapitre")

#releve-textes("doc", [
  #toc()
  = Premier
  == Alpha
  == Beta
  = Second
  == Gamma
])

#context {
  let t = textes("doc").replace(" ", "")
  // table des matières : I - Premier, A Alpha, B Beta, II - Second, A Gamma
  for m in ("Tabledesmatières", "I-Premier", "Alpha", "Beta", "II-Second", "Gamma") {
    assert(t.contains(m), message: "titres : « " + m + " » absent de " + repr(t))
  }
  // chaque titre apparaît deux fois : dans la table, puis dans le texte
  egal(t.matches("I-Premier").len(), 2, quoi: "I - Premier dans la table et le texte")
  egal(t.matches("II-Second").len(), 2, quoi: "II - Second")
  // les sous-titres repartent à A après chaque titre
  let lettres = state("doc", ()).final().filter(x => x in ("A", "B", "C"))
  egal(lettres, ("A", "B", "A", "A", "B", "A"), quoi: "lettres des sous-titres (table puis texte)")
}

// lettre-entouree : le cercle entoure la lettre
#context {
  let m = measure(lettre-entouree[A])
  let l = measure[A]
  assert(m.width > l.width and m.height > l.height, message: "lettre-entouree trop petite")
  proche(m.width / m.height, 1, tol: 0.01, quoi: "cercle")
}

// toc : aeration agrandit les espacements
#context {
  let doc(a) = [#toc(aeration: a) = X]
  assert(measure(doc(3)).height > measure(doc(1)).height, message: "aeration sans effet")
}

titres : ok
