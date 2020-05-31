CREATE TABLE Pracownik (
	IdPracownika integer NOT NULL,
	IdSklepu integer NOT NULL,
	Imie char(30),
	Nazwisko char(100),
	NumerTelefonu char(9),
	Stanowisko char(30),
	PRIMARY KEY(IdPracownika),
	FOREIGN KEY(IdSklepu) REFERENCES Sklep(IdSklepu)
);