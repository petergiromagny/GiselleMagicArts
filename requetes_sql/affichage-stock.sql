DELIMITER | -- On change le délimiteur
CREATE PROCEDURE affichage_stocks(in NomIngredient_add char(30), in nbr_add int,in Fraicheur_add int)    
    
BEGIN
    
    select 'avant',NomProduit, NbStock,Fraicheur
    from Stock,Ingredient,Produit
    where Stock.IDproduit = Ingredient.IDproduit and Ingredient.IDproduit = Produit.IDproduit and Produit.NomProduit=NomIngredient_add;


    update Stock 
    join Produit on Stock.Idproduit=Produit.IDproduit and NomProduit=NomIngredient_add and Stock.Fraicheur=fraicheur_add 
    set NbStock=NbStock+nbr_add;



    select 'aprés',NomProduit, NbStock,Fraicheur
    from Stock,Ingredient,Produit
    where Stock.IDproduit = Ingredient.IDproduit and Ingredient.IDproduit = Produit.IDproduit and Produit.NomProduit=NomIngredient_add;
    
    select distinct NomProduit,NbStock,Fraicheur from Produit,Stock where Produit.IDproduit=Stock.IDproduit;
  
END  
Delimiter ;

