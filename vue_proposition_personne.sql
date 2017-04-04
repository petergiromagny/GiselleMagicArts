CREATE VIEW Proposition_personne
(ID_proposition, Nom, Proposition)
AS SELECT Proposition.IDProposition, Personne.Nom, Proposition.Nom
FROM (Proposition INNER JOIN Personne ON Proposition.IDPersonne = Personne.IDPersonne);