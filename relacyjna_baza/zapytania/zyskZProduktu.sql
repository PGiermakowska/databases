SELECT Produkt.IdProduktu, SUM(iloscProduktu*CenaProduktu)
FROM SzczegolyProduktu JOIN Produkt ON 
SzczegolyProduktu.IdProduktu = Produkt.IdProduktu
GROUP BY Produkt.IdProduktu;