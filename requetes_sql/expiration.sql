delimiter |
create procedure perime()
begin
update Stock
set Fraicheur=Fraicheur-1;

select distinct NomProduit,NbStock,' fut supprimé' from Stock,Produit where Fraicheur=0 and Stock.Idproduit = Produit.IDproduit;
delete from Stock where Fraicheur=0;
end|
delimiter ;
