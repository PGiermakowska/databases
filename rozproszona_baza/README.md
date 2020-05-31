###Aby utworzyc nowy index przy uzyciu Postmana uzywam postawowa metodę HTTP, jaka jest PUT pod localhost:9200/sklep. W Headers dodaje Content-type na application/json , a w body to co ponizej.

{
	"mappings": {
		"properties": {
			"dataZlozenia": {
				"type": "date"
			},
			"kwotaBrutto": {
				"type": "float"
			},
			"czyFaktura": {
				"type": "boolean"
			},
			"produkt": {
				"type": "nested",
				"properties": {
					"nazwaProduktu": {
						"type": "text"			
					},
					"cenaProduktu": {
						"type": "float"
					},
					"opisProduktu": {
						"type": "text"
					},
					"iloscProduktu": {
						"type": "integer"
					}
						
					
				}
			},
			"relational_type": {
				"type": "join",
				"eager_global_ordinals": true,
                "relations": {
                    "parent": "child"
                }
			}
		}
	}
}

###Nastepnie przy uzyciu POST'a dodaje nowe dokumenty z podanymi nizej body.

{
	"imie": "Jan",
	"nazwisko": "Kowalski",
	"numerTelefonu": "738485923",
	"adresEmail": "j.kowalski@gmail.com",
	"miasto": "Warszawa",
	"relation_type": {
		"name": "parent"
	}
}

oraz

{
	"dataZlozenia": "2020-05-30",
	"kwotaBrutto": 100.21,
	"czyFaktura": true,
	"produkt": [
		{
			"nazwaProduktu": "Czajnik",
			"cenaProduktu": 105,
			"opisProduktu": "Czajnik wielofunkcyjny",
			"iloscProduktu": 2
		},
		{
			"nazwaProduktu": "Pralka",
			"cenaProduktu": 4500,
			"opisProduktu": "Pralka z suszarka",
			"iloscProduktu": 2
			
		}
	],
	"relation_type": {
		"name": "child",
		"parent": 1
	}
}

###Nastepnie w celu wyszukania interesujacych mnie dokumentow korzystam z GET'a o podanych nizej body:

{
	"query" : {
        "nested" : {
            "path" :  "produkt",
                "query" :  {
                    "bool" : {
                    "must" : [
                        { "match" : { "produkt.nazwaProduktu" : "Czajnik" } }
                    ]
                }
            }
        }
    }
        
    
}

oraz

{
	"query": {
		"multi_match": {
			"query": "Warszawa",
			"fields": ["miasto"]
		}
	}
}

oraz

{
    "size": 0,
    "aggs":{
        "zamowienie_z_najwieksza_kwota_brutto": {
            "top_hits": {
                "sort": [
                    {
                        "kwotaBrutto": {
                            "order": "desc"
                        }
                    }
                ],
                "size": 1
            }
        }
    }
}

