#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        IDClient int (11) Auto_increment  NOT NULL ,
        Nom      Char (25) NOT NULL ,
        Prenom   Char (25) NOT NULL ,
        Adresse  Varchar (25) NOT NULL ,
        PRIMARY KEY (IDClient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Potion
#------------------------------------------------------------

CREATE TABLE Potion(
        IDPotion    int (11) Auto_increment  NOT NULL ,
        Nom         Char (25) NOT NULL ,
        Temperature Int NOT NULL ,
        Prix        Float NOT NULL ,
        IDDiluant   Int NOT NULL ,
        PRIMARY KEY (IDPotion )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

CREATE TABLE Ingredient(
        IDIngredient int (11) Auto_increment  NOT NULL ,
        Nom          Char (25) NOT NULL ,
        Fraicheur    Int ,
        Prix         Float NOT NULL ,
        Stock        Int NOT NULL ,
        PRIMARY KEY (IDIngredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Onguent
#------------------------------------------------------------

CREATE TABLE Onguent(
        IDOnguent int (11) Auto_increment  NOT NULL ,
        Nom       Char (25) NOT NULL ,
        Prix      Float NOT NULL ,
        PRIMARY KEY (IDOnguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Diluant
#------------------------------------------------------------

CREATE TABLE Diluant(
        IDDiluant  int (11) Auto_increment  NOT NULL ,
        NomDiluant Char (25) NOT NULL ,
        PRIMARY KEY (IDDiluant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recipient
#------------------------------------------------------------

CREATE TABLE Recipient(
        IDRecipient    int (11) Auto_increment  NOT NULL ,
        NomRecipient   Char (25) NOT NULL ,
        StockRecipient Char (25) NOT NULL ,
        Prix           Float NOT NULL ,
        PRIMARY KEY (IDRecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        IDCommande   int (11) Auto_increment  NOT NULL ,
        DateCommande Date NOT NULL ,
        Statut       Char (25) ,
        PrixTotal    Float NOT NULL ,
        IDClient     Int ,
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
# Table: Inventeur
#------------------------------------------------------------

CREATE TABLE Inventeur(
        IDInventeur  int (11) Auto_increment  NOT NULL ,
        Nom          Char (25) NOT NULL ,
        NumeroPermis Int NOT NULL ,
        PRIMARY KEY (IDInventeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Proposition
#------------------------------------------------------------

CREATE TABLE Proposition(
        IDProposition int (11) Auto_increment  NOT NULL ,
        Nom           Char (25) NOT NULL ,
        Temperature   Int NOT NULL ,
        Validation    Bool ,
        PRIMARY KEY (IDProposition )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: se compose
#------------------------------------------------------------

CREATE TABLE se_compose(
        QuantiteIngredient Int NOT NULL ,
        FraicheurMax       Int ,
        FraicheurMin       Int ,
        IDIngredient       Int NOT NULL ,
        IDPotion           Int ,
        IDProposition      Int ,
        IDOnguent          Int ,
        PRIMARY KEY (IDIngredient ,IDPotion ,IDProposition ,IDOnguent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contient
#------------------------------------------------------------

CREATE TABLE contient(
        QuantiteCommande Int ,
        FraicheurVoulu   Int ,
        IDIngredient     Int NOT NULL ,
        IDPotion         Int NOT NULL ,
        IDOnguent        Int NOT NULL ,
        IDCommande       Int NOT NULL ,
        IDRecipient      Int NOT NULL ,
        PRIMARY KEY (IDIngredient ,IDPotion ,IDOnguent ,IDCommande ,IDRecipient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournit
#------------------------------------------------------------

CREATE TABLE fournit(
        IDFournisseur Int NOT NULL ,
        IDIngredient  Int NOT NULL ,
        PRIMARY KEY (IDFournisseur ,IDIngredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: invente
#------------------------------------------------------------

CREATE TABLE invente(
        IDInventeur Int NOT NULL ,
        IDPotion    Int NOT NULL ,
        IDOnguent   Int NOT NULL ,
        PRIMARY KEY (IDInventeur ,IDPotion ,IDOnguent )
)ENGINE=InnoDB;

ALTER TABLE Potion ADD CONSTRAINT FK_Potion_IDDiluant FOREIGN KEY (IDDiluant) REFERENCES Diluant(IDDiluant);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_IDClient FOREIGN KEY (IDClient) REFERENCES Client(IDClient);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_IDIngredient FOREIGN KEY (IDIngredient) REFERENCES Ingredient(IDIngredient);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_IDPotion FOREIGN KEY (IDPotion) REFERENCES Potion(IDPotion);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_IDProposition FOREIGN KEY (IDProposition) REFERENCES Proposition(IDProposition);
ALTER TABLE se_compose ADD CONSTRAINT FK_se_compose_IDOnguent FOREIGN KEY (IDOnguent) REFERENCES Onguent(IDOnguent);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDIngredient FOREIGN KEY (IDIngredient) REFERENCES Ingredient(IDIngredient);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDPotion FOREIGN KEY (IDPotion) REFERENCES Potion(IDPotion);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDOnguent FOREIGN KEY (IDOnguent) REFERENCES Onguent(IDOnguent);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDCommande FOREIGN KEY (IDCommande) REFERENCES Commande(IDCommande);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDRecipient FOREIGN KEY (IDRecipient) REFERENCES Recipient(IDRecipient);
ALTER TABLE fournit ADD CONSTRAINT FK_fournit_IDFournisseur FOREIGN KEY (IDFournisseur) REFERENCES Fournisseur(IDFournisseur);
ALTER TABLE fournit ADD CONSTRAINT FK_fournit_IDIngredient FOREIGN KEY (IDIngredient) REFERENCES Ingredient(IDIngredient);
ALTER TABLE invente ADD CONSTRAINT FK_invente_IDInventeur FOREIGN KEY (IDInventeur) REFERENCES Inventeur(IDInventeur);
ALTER TABLE invente ADD CONSTRAINT FK_invente_IDPotion FOREIGN KEY (IDPotion) REFERENCES Potion(IDPotion);
ALTER TABLE invente ADD CONSTRAINT FK_invente_IDOnguent FOREIGN KEY (IDOnguent) REFERENCES Onguent(IDOnguent);
