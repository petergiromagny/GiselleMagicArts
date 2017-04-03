delimiter |
create procedure diluant(in NomDiluant char(30) )
begin
select Produit.NomProduit,Diluant.NomDiluant  
from Produit,Preparation,Diluant 
where Produit.IDproduit=Preparation.IDproduit and Preparation.IDdiluant=Diluant.IDdiluant and Diluant.NomDiluant=NomDiluant;

end|
delimiter ;
