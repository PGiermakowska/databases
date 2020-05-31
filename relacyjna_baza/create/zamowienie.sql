CREATE TABLE Zamowienie (
	IdZamowienia integer NOT NULL,
	IdKlient integer NOT NULL,
	IdSklepu integer NOT NULL,
	DataZlozenia date,
	KwotaBrutto double precision,
	CzyFaktura boolean,
	PRIMARY KEY(IdZamowienia),
	FOREIGN KEY(IdKlient) REFERENCES Klient(IdKlient),
	FOREIGN KEY(IdSklepu) REFERENCES Sklep(IdSklepu)
);