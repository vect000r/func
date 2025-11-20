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

