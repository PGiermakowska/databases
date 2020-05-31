CREATE TABLE SzczegolyProduktu (
	IdProduktu integer NOT NULL,
	IdZamowienia integer NOT NULL,
	IloscProduktu integer,
	PRIMARY KEY (IdProduktu, IdZamowienia ),
	FOREIGN KEY (IdProduktu ) REFERENCES Produkt(IdProduktu ),
	FOREIGN KEY (IdZamowienia) REFERENCES Zamowienie(IdZamowienia) 
);