# WebChat - Serwer

Serwer WebChat to backendowa część aplikacji WebChat, zbudowana w technologii Node.js i Express. Serwer obsługuje komunikację w czasie rzeczywistym, autoryzację użytkowników, zarządzanie danymi oraz integrację z bazą danych.

## Funkcjonalności

- **WebSockety**: Obsługa komunikacji w czasie rzeczywistym przy użyciu `socket.io` dla płynnej wymiany wiadomości między użytkownikami.
- **Integracja z bazą danych**: Przechowywanie danych użytkowników, wiadomości i innych zasobów w bazie danych MySQL lub MongoDB.
- **Wysyłanie i odbieranie plików**: Obsługa załączników, w tym zdjęć, dokumentów i innych plików w czacie.

## Uwaga!
Przed włączeniem serwera należy pobrać i zaimportować bazę danych chat.sql, która znajduje się w folderze Database
