## Summing and converting moneyWe will now work on one example proposed by A. Bergel and we would like to thank him for it. ```1 EUR = 662 CLP (Chilean pesos) ```### Requirements	```TestCase subclass: #CurrencyTest ``````CurrencyTest >> testSum 
   | clp1 eur1 clp2 eur2 |
   clp1 := CLP new value: 3500.
   eur1 := EUR new value: 10.
   clp2 := CLP new value: 5000.
   eur2 := EUR new value: 20.

   self assert: clp1 + clp2 equals: (CLP new value: 8500). 
   self assert: clp1 + eur1 equals: (CLP new value: 3500 + 6620).
   
   self assert: eur1 + eur2 equals: (EUR new value: 30).
   self assert: eur1 + clp2 equals: (EUR new value: 5000 / 662 + 10).```In addition in a second step we will add conversion between Euros and USD. ### Given contextYou have a class `Currency` to which you can sum other currencyCurrency. ```Object subclass: #Currency 
	instVarNames: ‘value’ ``````Currency >> + anotherCurrency 
   self subclassResponsibility ``````Currency >> printOn: str
   super printOn: str.
   str nextPut: $<.
   str nextPutAll: self value asString.
   str nextPut: $>.```### Solution```Currency >> sumWithEUR: money 
   self subclassResponsibility ``````Currency >> sumWithCLP: money 
   self subclassResponsibility ``````Currency >> = anotherCurrency 
  ^ self class == anotherCurrency class and: [ self value = anotherCurrency value ]```You have two subclasses: ```Currency subclass: #EUR 

Currency subclass: #CLP ``````EUR >> + anotherCurrency 
   ^ anotherCurrency sumWithEUR: self``````EUR >> sumWithEUR: money 
   ^ EUR new value: self value + money value``````EUR >> sumWithCLP: money 
   ^ CLP new value: (self value * 662) + money value``````CLP >> + anotherCurrency
   ^ anotherCurrency sumWithCLP: self``````CLP >> sumWithEUR: money
   ^ EUR new value: (self value / 662) + money value``````CLP >> sumWithCLP: money
  ^ CLP new value: self value + money value```