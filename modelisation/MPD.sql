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
        IDrecipient    int (11) Auto_increment  NOT NULL ,
        NomRecipient   Varchar (255) ,
        StockRecipient Char (25) NOT NULL ,
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
        Temperature   Int ,
        Validation    Bool ,
        Diluant       Varchar (25) ,
        IDClient      Int ,
        PRIMARY KEY (IDProposition )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Stock
#------------------------------------------------------------

CREATE TABLE Stock(
        IDstock       int (11) Auto_increment  NOT NULL ,
        NbSotck       Int NOT NULL ,
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
        IDproduit   Int NOT NULL ,
        IDDiluant   Int NOT NULL ,
        IDInventeur Int ,
        IDClient    Int ,
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
        PRIMARY KEY (IDCommande ,IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournit
#------------------------------------------------------------

CREATE TABLE fournit(
        IDFournisseur Int NOT NULL ,
        IDproduit     Int NOT NULL ,
        PRIMARY KEY (IDFournisseur ,IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: se compose prepa
#------------------------------------------------------------

CREATE TABLE se_compose_prepa(
        qteIngredient     Int ,
        fraicheurMin      Int ,
        fraicheurMax      Int ,
        temps             Int ,
        IDproduit         Int NOT NULL ,
        IDproduit_Produit Int NOT NULL ,
        PRIMARY KEY (IDproduit ,IDproduit_Produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: se compose propo
#------------------------------------------------------------

CREATE TABLE se_compose_propo(
        qteIngredient Int ,
        fraicheurMin  Int ,
        fraicheurMax  Int ,
        IDProposition Int NOT NULL ,
        IDproduit     Int NOT NULL ,
        PRIMARY KEY (IDProposition ,IDproduit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contientRecipient
#------------------------------------------------------------

CREATE TABLE contientRecipient(
        quantite    Int ,
        IDCommande  Int NOT NULL ,
        IDrecipient Int NOT NULL ,
        PRIMARY KEY (IDCommande ,IDrecipient )
)ENGINE=InnoDB;

ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_IDClient FOREIGN KEY (IDClient) REFERENCES Client(IDClient);
ALTER TABLE Proposition ADD CONSTRAINT FK_Proposition_IDClient FOREIGN KEY (IDClient) REFERENCES Client(IDClient);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE Stock ADD CONSTRAINT FK_Stock_IDFournisseur FOREIGN KEY (IDFournisseur) REFERENCES Fournisseur(IDFournisseur);
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDDiluant FOREIGN KEY (IDDiluant) REFERENCES Diluant(IDDiluant);
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDInventeur FOREIGN KEY (IDInventeur) REFERENCES Inventeur(IDInventeur);
ALTER TABLE Preparation ADD CONSTRAINT FK_Preparation_IDClient FOREIGN KEY (IDClient) REFERENCES Client(IDClient);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDCommande FOREIGN KEY (IDCommande) REFERENCES Commande(IDCommande);
ALTER TABLE contient ADD CONSTRAINT FK_contient_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE fournit ADD CONSTRAINT FK_fournit_IDFournisseur FOREIGN KEY (IDFournisseur) REFERENCES Fournisseur(IDFournisseur);
ALTER TABLE fournit ADD CONSTRAINT FK_fournit_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE se_compose_prepa ADD CONSTRAINT FK_se_compose_prepa_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE se_compose_prepa ADD CONSTRAINT FK_se_compose_prepa_IDproduit_Produit FOREIGN KEY (IDproduit_Produit) REFERENCES Produit(IDproduit);
ALTER TABLE se_compose_propo ADD CONSTRAINT FK_se_compose_propo_IDProposition FOREIGN KEY (IDProposition) REFERENCES Proposition(IDProposition);
ALTER TABLE se_compose_propo ADD CONSTRAINT FK_se_compose_propo_IDproduit FOREIGN KEY (IDproduit) REFERENCES Produit(IDproduit);
ALTER TABLE contientRecipient ADD CONSTRAINT FK_contientRecipient_IDCommande FOREIGN KEY (IDCommande) REFERENCES Commande(IDCommande);
ALTER TABLE contientRecipient ADD CONSTRAINT FK_contientRecipient_IDrecipient FOREIGN KEY (IDrecipient) REFERENCES Recipient(IDrecipient);
