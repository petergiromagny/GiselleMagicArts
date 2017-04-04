select Commande.IDCommande,DateCommande,Statut,PrixTotal,Nom,Prenom,Adresse,Produit.NomProduit,QuantiteCommande,NomRecipient 
into outfile '/var/lib/mysql-files/cat.txt' 
from Recipient,Produit,Personne,Commande,contient 
where Statut='livraison' 
and Commande.IDpersonne=Personne.IDPersonne 
and contient.IDCommande=Commande.IDCommande 
and contient.IDproduit=Produit.IDproduit 
and contient.IDrecipient=Recipient.IDrecipient;
