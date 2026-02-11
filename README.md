# Programowanie-Funkcyjne - Bartłomiej Galek

**Zadanie 1** 

:white_check_mark: 3.0 Zaimplementuj funkcję isSorted, która sprawdza czy dana funkcja jest posortowana zgodnie z podaną funkcją porównawczą [Link do commita](https://github.com/vect000r/func/commit/dc4df2ec56cf70883215e3051cc498e02b236832#diff-ac93e4ea75fe3253e2821b027f376f748397e273ff19503ccafcae7b1311a220)

:white_check_mark: 3.5 Zaimplementuj funkcję, która zsumuje liczby po wierszach z trzech list na wejściu; wykorzystaj funkcję sprowadzi funkcję z trzema argumentami, do funkcji z dwoma [Link do commita](https://github.com/vect000r/func/commit/f2e69583aa42642fd685deda5c832afb0a6af7f4)

:white_check_mark: 4.0 Zaimplementuj funkcję setHead, która doda element na początku listy [Link do commita](https://github.com/vect000r/func/commit/73493a21ec62affbe84d83f2a60e85d85847dee9)

:white_check_mark: 4.5 Zaimplementuj funkcję append, która doda element we wskazanym miejscu w liście [Link do commita](https://github.com/vect000r/func/commit/574406dc86f6daf8380af8993450e87f3d13e5ae)

:white_check_mark: 5.0 Zaimplementuj funkcję, która policzy kwadrat liczb z dwóch list (po wierszach) za pomocą funkcji map oraz funkcji anonimowej [Link do commita](https://github.com/vect000r/func/commit/5f3dd76feb3840e1f2f3e8ae0a121f0d5ac7483f)


Kod: [Link do zadania 1](https://github.com/vect000r/func/blob/master/ex1/src/main/scala/Main.scala)










https://github.com/user-attachments/assets/53bfea2a-b5ea-4cb6-81b5-f736c9933824

**Zadanie 2**
:white_check_mark: Stwórz obraz dockerowy z wymaganymi paczkami [Link do commita](https://github.com/vect000r/func/commit/5933c876d84739f60e44cbb9231f2b331d134164)
Kod: [Link do zadania 2](https://github.com/vect000r/func/blob/master/ex2/Dockerfile)




https://github.com/user-attachments/assets/244ade91-155e-4d06-9fed-91df97af7b99

**Zadanie 3**

:white_check_mark: 3.0 zwrócą wynik funkcji tail, która usuwa pierwszy element z listy (parameter); należy rozważyć przypadek Nil jako parametr [Link do commita](https://github.com/vect000r/func/commit/58acb916fe9dcc90b65e7a9698a1a7ed4ce6ba45)

:white_check_mark: 3.5 zwróci wynik funkcji drop, która usuwa n elementów z listy dwukierunkowej [Link do commita](https://github.com/vect000r/func/commit/f8b04d23fb685f0b332f7428e6a6efbff9c8f047)

:white_check_mark: 4.0 zwróci wynik funkcji dropWhile, która usuwa n elementów z listy dwukierunkowej, które spełniają warunek funkcji (parametr); należy wykorzystać podejście pattern match [Link do commita](https://github.com/vect000r/func/commit/42ab3811e9047916793e81c8ba43151a9f88f26b)

:white_check_mark: 4.5 zwróci wynik funkcji foldLeft wykorzystując do tego companion object [Link do commita](https://github.com/vect000r/func/commit/d8ccaefde7f92ebc0886a76ac8e4b3ef218eeffa)

:white_check_mark: 5.0 zwróci wynik funkcji concatenate na dwóch listach (parametry), która zwraca jedną listę [Link do commita](https://github.com/vect000r/func/commit/f17c6bdfe5019363c7b493097d547655b48225ba)
Kod: [Link do zadania 3](https://github.com/vect000r/func/tree/master/ex3/src/main/scala)

https://github.com/user-attachments/assets/559dac0c-6c2d-42fb-a601-1933556bfee0

**Zadanie 4**

:white_check_mark: 3.0 zwróci taki sam wynik jak zad.1 4.5 ale wykorzysta typ opcjonalny [Link do commita](https://github.com/vect000r/func/commit/ddd813630bcb7289932c7585f3a059d25c805ae5)

:white_check_mark: 3.5 zwroci wariancję z listy; do implementacji wykorzystać należy typ opcjonalny [Link do commita](https://github.com/vect000r/func/commit/bb5c7217a484125d20e5e23976b25a1c3893fb3f)

:x: 4.0 zwróci listę (option), która jest wynikiem połączenia dwóch list (option); w przypadku gdy jedna z list jest None, funkcja powinna zwrócić None

:x: 4.5 zwróci listę za pomocą metody mojeMap[A,B,C](a: Option[A], b: Option[B])(f:(A,B)=>C):Option[C]; należy wykorzystać metodę flatMap oraz map

:x: 5.0 zwróci taki średnią (mean) z listy zwracając Either

Kod: [Link do zadania 4](https://github.com/vect000r/func/tree/master/ex4/src/main/scala)

https://github.com/user-attachments/assets/933d07d3-e0c7-4511-9aee-c1be6becf250

**Zadanie 5**

:white_check_mark: 3.0 zwróci słownik z liczbą powtarzających się liczb za pomocą funkcji mapreduce dla list z liczbami [Link do commita](https://github.com/vect000r/func/commit/68cd77387e70ff8a71ea206396f148dc39d8cd45)

:white_check_mark: 3.5 zwróci słownik z liczbami podniesionymi do sześcianu za pomocą funkcji mapreduce dla list z liczbami [Link do commita](https://github.com/vect000r/func/commit/32d2da4a858a87512d519ad8f0ab115f26985105)

:white_check_mark: 4.0 zwróci słownik (student, godziny nauki), która wykorzysta funkcją mapreduce oraz groupBy dla słownika na wejściu  [Link do commita](https://github.com/vect000r/func/commit/5c1d8499206245a6643ca120f79493aea706491d)

:x: 4.5 zwróci słownik (zdanie, wektor), która wykorzysta funkcję mapreduce oraz bagOfWords

:x: 5.0 zwróci słownik (student, średnia ocen), która wykorzysta funkcję mapreduce oraz join; na wejściu  są dwie listy: (numer_indeksu, student), (numer_indeksu, kurs, ocena)

Kod: [Link do zadania 5](https://github.com/vect000r/func/tree/master/ex5)

https://github.com/user-attachments/assets/502d5b3c-64e9-42ea-a2b9-aaed9c505c8f


**Zadanie 6**

:white_check_mark: 3.0 Zaimplementuj funkcję isSorted, która sprawdza czy dana funkcja jest posortowana zgodnie z podaną funkcją porównawczą [Link do commita](https://github.com/vect000r/func/commit/cef65334c984f518caddca74c2aba82cd985f68f)

:white_check_mark: 3.5 Zaimplementuj funkcję, która zsumuje liczby po wierszach z trzech list na wejściu; wykorzystaj funkcję sprowadzi funkcję z trzema argumentami, do funkcji z dwoma [Link do commita](https://github.com/vect000r/func/commit/117f7abe49edfebe6bf13eec2ba37bb7bb479fd5)

:white_check_mark: 4.0 Zaimplementuj funkcję setHead, która doda element na początku listy [Link do commita](https://github.com/vect000r/func/commit/6d7f9af1a2db60475009de256c6e34d417cda612)

:white_check_mark: 4.5 Zaimplementuj funkcję append, która doda element we wskazanym miejscu w liście [Link do commita](https://github.com/vect000r/func/commit/3c2796d39226e7d8f29617ebe291a4a26e85eb92)

:white_check_mark: 5.0 Zaimplementuj funkcję, która policzy kwadrat liczb z dwóch list (po wierszach) za pomocą funkcji map oraz funkcji anonimowej [Link do commita](https://github.com/vect000r/func/commit/5052bd2b2867f7f864e80c7a99484236afcc82c9)

Kod: [Link do zadania 6](https://github.com/vect000r/func/tree/master/ex6)




https://github.com/user-attachments/assets/581ebf58-abf7-4ccf-95eb-b9135f0755a5

**Zadanie 7**

:white_check_mark: 3.0 zwróci wartość między 0, a maxvalue of Int włącznie[Link do commita](https://github.com/vect000r/func/commit/e3a670f87b091ab5220f0b375e3d3b0807616415)

:white_check_mark: 3.5 zwróci wartość między 0, a 1 (Double) z wyłączeniem 1 [Link do commita](https://github.com/vect000r/func/commit/d2318cb1e9d707f9a04c675c4a97f87407ae9fad)

:white_check_mark: 4.0 zwróci pary (Int, Double), (Double, Int) oraz krotki (Double, Double, Double) wykorzystując funkcje z ocen 3.0 oraz 3.5 [Link do commita](https://github.com/vect000r/func/commit/6f0b7eb8884db278be37f57616abd2ebb2b7d1e5)

:x: 4.5 zwróci wartość jak w funkcji 3.5, ale wykorzysta map 
:x: 5.0 zwróci wartość jak w funkcji 3.5, ale wykorzysta flatMap

Kod: [Link do zadania 7](https://github.com/vect000r/func/tree/master/ex7)

https://github.com/user-attachments/assets/d07d4d15-ffcd-4f10-84ce-9c421bcc7b40

**Zadanie 8**

:white_check_mark: 3.0 wykorzysta metodę map fuktora do wykonania funkcji dodawania lub odejmowania na dwóch wartość przyjętych na wejściu[Link do commita](https://github.com/vect000r/func/commit/3b16acecdd02d67108d01848abf4005e72740338)

:x: 3.5  zwróci wartość konkatenacji trzech list za pomocą monoidy

:x: 4.0  zwróci wartość sumy listy liczb lub zwróci nil; zaimplementuj wykorzystując monady

:x: 4.5  zwróci zadanie z zestawy 6 na ocenę 4.0 i wykorzysta metodę combine oraz join

:x: 5.0 zwróci dla listy minimum 3 elementów typu int mapę: liczba elementów, suma,  wartość minimalna, wartość maksymalna; wykorzysta do tego monadę oraz metodę foldMap


Kod: [Link do zadania 8](https://github.com/vect000r/func/tree/master/ex8)

https://github.com/user-attachments/assets/76504964-b9fa-4c3e-b42c-923721c92107


**Zadanie 9**

:white_check_mark: 3.0 zwróci wartość binarną czy podana na wejściu liczba jest liczbą pierwszą; wykorzysta Promise[Link do commita](https://github.com/vect000r/func/commit/a8e22a3de23caa3459ee59e9ed0c7aa8e4a137fa)

:white_check_mark: 3.5 zwróci posortowaną listę; wykorzysta Promise [Link do commita](https://github.com/vect000r/func/commit/1b7061a7405e1d78931e025d38ebbe9870d755bc)

:x: 4.0  zwróci wynik funkcji z zad. 5 na 4.0 (mapreduce); wykorzysta worker_threads

:x: 4.5  zwróci wynik bagOfWords dla danego tekstu na wejściu; stworzy pulę workterów

:x: 5.0 zwróci wynik funkcji z zad. 5 na 4.5; wykorzysta Promise.all oraz funkcję map

Kod: [Link do zadania 9](https://github.com/vect000r/func/tree/master/ex9)

https://github.com/user-attachments/assets/53e14ed9-622a-42e7-b147-93518b730b3c


**Zadanie 10**

Link do kodu Haskell: [haskell-functions](https://github.com/vect000r/func/tree/master/ex10/haskell-functions)
Link do kodu JS: [javascript-functions](https://github.com/vect000r/func/tree/master/ex10/javascript-functions)

Link do deploya Haskell: [haskell](https://ex10-haskell-dkaxbph6fye7g0af.polandcentral-01.azurewebsites.net/)
Link do deploya js: [JS](https://ex10-js.azurewebsites.net/)



https://github.com/user-attachments/assets/f24d69f7-e794-4b6b-abf2-b5d4717f1810


