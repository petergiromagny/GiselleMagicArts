#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Personne
#------------------------------------------------------------

CREATE TABLE Personne(
        IDPersonne int (11) Auto_increment  NOT NULL ,
        Nom        Char (25) NOT NULL ,
        Prenom     Char (25) NOT NULL ,
        Adresse    Varchar (25) NOT NULL ,
        PRIMARY KEY (IDPersonne )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

CREATE TABLE Ingredient(
        IDproduit Int NOT NULL ,
        PRIMARY KEY (IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Diluant
#------------------------------------------------------------

CREATE TABLE Diluant(
        IDDiluant   int (11) Auto_increment  NOT NULL ,
        NomDiluant  Char (25) NOT NULL ,
        PrixDiluant Float NOT NULL ,
        PRIMARY KEY (IDDiluant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

CREATE TABLE Recipient(
        IDrecipient  int (11) Auto_increment  NOT NULL ,
        NomRecipient Varchar (255) ,
        Prix         Float NOT NULL ,
        Stock        Int ,
        PRIMARY KEY (IDrecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        IDCommande   int (11) Auto_increment  NOT NULL ,
        DateCommande Date NOT NULL ,
        Statut       Char (25) ,
        PrixTotal    Float NOT NULL ,
        IDPersonne   Int ,
        PRIMARY KEY (IDCommande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        IDFournisseur int (11) Auto_increment  NOT NULL ,
        Nom           Char (25) NOT NULL ,
        Numero        Int NOT NULL ,
        PRIMARY KEY (IDFournisseur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Proposition
#------------------------------------------------------------

CREATE TABLE Proposition(
        IDProposition int (11) Auto_increment  NOT NULL ,
        Nom           Char (25) NOT NULL ,
        Temperature   Int ,
        Diluant       Varchar (25) ,
        IDPersonne    Int ,
        PRIMARY KEY (IDProposition )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Stock
#------------------------------------------------------------

CREATE TABLE Stock(
        IDstock       int (11) Auto_increment  NOT NULL ,
        NbStock       Int NOT NULL ,
        Fraicheur     Int ,
        IDproduit     Int ,
        IDFournisseur Int ,
        PRIMARY KEY (IDstock )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        IDproduit  int (11) Auto_increment  NOT NULL ,
        NomProduit Varchar (255) ,
        Prix       Float ,
        PRIMARY KEY (IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Preparation
#------------------------------------------------------------

CREATE TABLE Preparation(
        Temperature Int ,
		Stock Int ,
        IDproduit   Int NOT NULL ,
        IDDiluant   Int NOT NULL ,
        IDPersonne  Int ,
        PRIMARY KEY (IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contient
#------------------------------------------------------------

CREATE TABLE contient(
        QuantiteCommande Int ,
        FraicheurVoulu   Int ,
        IDCommande       Int NOT NULL ,
        IDproduit        Int NOT NULL ,
        IDrecipient      Int NOT NULL ,
        PRIMARY KEY (IDCommande ,IDproduit ,IDrecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournit ingre
#------------------------------------------------------------

CREATE TABLE fournit_ingre(
        IDFournisseur Int NOT NULL ,
        IDproduit     Int NOT NULL ,
        PRIMARY KEY (IDFournisseur ,IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: se compose prepa
#------------------------------------------------------------

CREATE TABLE se_compose_prepa(
        QteIngredient     Int ,
        FraicheurMin      Int ,
        FraicheurMax      Int ,
        Temps             Int ,
        IDproduit         Int NOT NULL ,
        IDproduitFinal Int NOT NULL ,
        PRIMARY KEY (IDproduit ,IDproduitFinal )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: se compose propo
#------------------------------------------------------------

CREATE TABLE se_compose_propo(
        QteIngredient Int ,
        FraicheurMin  Int ,
        FraicheurMax  Int ,
        Temps         Int ,
        IDProposition Int NOT NULL ,
        IDproduit     Int NOT NULL ,
        PRIMARY KEY (IDProposition ,IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournit recipient
#------------------------------------------------------------

CREATE TABLE fournit_recipient(
        IDFournisseur Int NOT NULL ,
        IDrecipient   Int NOT NULL ,
        PRIMARY KEY (IDFournisseur ,IDrecipient )
)ENGINE=InnoDB;

ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_IDPersonne FOREIGN KEY (IDPersonne) REFERENCES Personne(IDPersonne);
ALTER TABLE Proposition ADD CONSTRAINT FK_Proposition_IDPersonne FOREIGN KEY (IDPersonne) REFERENCES Personne(IDPersonne);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDFournisseur FOREIGN KEY (IDFournisseur) REFERENCES Fournisseur(IDFournisseur);
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit) ON DELETE CASCADE;
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDDiluant FOREIGN KEY (IDDiluant) REFERENCES Diluant(IDDiluant);
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDPersonne FOREIGN KEY (IDPersonne) REFERENCES Personne(IDPersonne);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDCommande FOREIGN KEY (IDCommande) REFERENCES Commande(IDCommande);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDrecipient FOREIGN KEY (IDrecipient) REFERENCES Recipient(IDrecipient);
ALTER TABLE fournit_ingre ADD CONSTRAINT FK_fournit_ingre_IDFournisseur FOREIGN KEY (IDFournisseur) REFERENCES Fournisseur(IDFournisseur);
ALTER TABLE fournit_ingre ADD CONSTRAINT FK_fournit_ingre_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE se_compose_prepa ADD CONSTRAINT FK_se_compose_prepa_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE se_compose_prepa ADD CONSTRAINT FK_se_compose_prepa_IDproduitFinal FOREIGN KEY (IDproduitFinal) REFERENCES Produit(IDproduit) ON DELETE CASCADE;
ALTER TABLE se_compose_propo ADD CONSTRAINT FK_se_compose_propo_IDProposition FOREIGN KEY (IDProposition) REFERENCES Proposition(IDProposition);
ALTER TABLE se_compose_propo ADD CONSTRAINT FK_se_compose_propo_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit) ON DELETE CASCADE;
ALTER TABLE fournit_recipient ADD CONSTRAINT FK_fournit_recipient_IDFournisseur FOREIGN KEY (IDFournisseur) REFERENCES Fournisseur(IDFournisseur);
ALTER TABLE fournit_recipient ADD CONSTRAINT FK_fournit_recipient_IDrecipient FOREIGN KEY (IDrecipient) REFERENCES Recipient(IDrecipient);
