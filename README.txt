Ścieżki plików php:
    localhost/discount_check.php
    localhost/send_order.php

Ścieżka pliku PHPUnit:
    localhost/phpunit/tests/FormValidationTest.php
Ustawienia PHPUnit:
    phpunit.xml

Ścieżka komponentu Vue.js
    src/components/CheckOut.Vue

Ścieżki zdjęć
    src/img/nazwa.png

Użyte paczki
    npm install -D sass-loader node-sass //do stylu SCSS
    npm install --save axios vue-axios   //do ajaxowych zapytań

Baza danych w pliku: (nazwa bazy checkout, system utf8_general_ci)
    checkout.sql

Domeny reCAPTCHA:
    smartbees-zadanie.local
    localhost
Klucz reCAPTCHA:
    6Lfxfl0gAAAAAOIupaOkUkeTBFhY2qGXxyv8MVsJ

W sekcji <script> -> methods,na samym końcu została zakomentowana metoda wypełniająca formularz przykładowymi danymi
W pierwszej linii <template> został zakomentowany przycisk do aktywacji metody wypełniającej formularz

Kody rabatowe (Wpływają jedynie na cenę produktu):
    Aktywny: AB-123-456
    Nieaktywny: CD-789-123

Wykorzystane technologie:
1. Vue.js 3
2. Baza danych MariaDB
3. PHP 7.3.30
4. reCAPTCHA Google v3
5. PHPUnit 9