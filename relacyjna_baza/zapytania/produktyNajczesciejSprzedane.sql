SELECT SUM(iloscProduktu) as ilosc, Produkt.Nazwa
FROM SzczegolyProduktu JOIN Produkt ON 
SzczegolyProduktu.IdProduktu = Produkt.IdProduktu
GROUP BY Produkt.Nazwa
ORDER BY ilosc DESC LIMIT 3;
