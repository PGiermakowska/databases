SELECT count(IdZamowienia), IdKlient
FROM Zamowienie
WHERE DataZlozenia BETWEEN '2020-04-01' AND '2020-04-15'
GROUP BY IdKlient;