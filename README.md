# BaseChat - Serwer

Serwer BaseChat to backendowa część aplikacji BaseChat, zbudowana w technologii **Node.js** i **Express**. Obsługuje kluczowe funkcje, takie jak komunikacja w czasie rzeczywistym, autoryzacja użytkowników, zarządzanie danymi i integracja z bazą danych. 

---

## Funkcjonalności

- **WebSockety (`socket.io`)**  
  - Obsługa komunikacji w czasie rzeczywistym dla płynnej wymiany wiadomości.
  - Obsługiwane zdarzenia: 
    - `connection` – ustanowienie nowego połączenia.
    - `message` – przesyłanie wiadomości.
    - `file-upload` – obsługa załączników.

- **Integracja z bazą danych MySQL**  
  - Zarządzanie użytkownikami, wiadomościami i plikami poprzez interakcję z bazą danych.
  - Plik SQL (`chat.sql`) dostępny w katalogu projektu umożliwia utworzenie odpowiednich tabel.

- **Autoryzacja użytkowników**  
  - Proces rejestracji i logowania z wykorzystaniem plików:
    - `RegisterUser.js`
    - `LoginUser.js`
  - Hashowanie haseł w celu zapewnienia bezpieczeństwa.

- **Wysyłanie i odbieranie plików**  
  - Obsługa przesyłania zdjęć profilowych i załączników w czatach.
  - Pliki są przechowywane w katalogach `uploads/profiles` i `uploads/attachments`.

- **Aktualizacja profilu**  
  - Zmiana zdjęcia profilowego dzięki funkcji w pliku `UpdateProfile.js`.

---

## Struktura projektu

```
BaseChat-Server/
│
├── Database/                   # Logika bazy danych
│   ├── DbConnection.js         # Połączenie z bazą danych MySQL
│   ├── LoginUser.js            # Logowanie użytkownika
│   ├── RegisterUser.js         # Rejestracja użytkownika
│   ├── RequestMessages.js      # Pobieranie wiadomości
│   ├── RequestUserList.js      # Lista użytkowników
│   ├── SaveImg.js              # Zapis plików
│   ├── SendMessage.js          # Obsługa wysyłania wiadomości
│   ├── UpdateProfile.js        # Aktualizacja zdjęcia profilowego
│   └── index.js                # Ładowanie funkcji bazy danych
│
├── uploads/                    # Przechowywanie przesłanych plików
│   ├── profiles/               # Zdjęcia profilowe
│   └── attachments/            # Załączniki do wiadomości
│
├── index.js                    # Główny plik serwera
├── package.json                # Zależności projektu
├── chat.sql                    # Plik do inicjalizacji bazy danych
├── README.md                   # Dokumentacja
```

---

## Instalacja

1. **Zainstaluj zależności**  
   W katalogu głównym projektu uruchom polecenie:
   ```bash
   npm install
   ```

2. **Skonfiguruj bazę danych**  
   - Utwórz bazę danych w MySQL.
   - Zaimportuj plik `chat.sql` znajdujący się w katalogu projektu.

3. **Uruchom serwer**  
   Serwer można uruchomić za pomocą polecenia:
   ```bash
   node index.js
   ```

---

## Ciekawostki z kodu

### 1. Każda funkcja korzytsjąca z bazy danych jest asynchroniczna (Promise)
Poniżej częśc pliku `RegisterUser.js`:
```javascript
return new Promise((resolve, reject) => {
        const checkQuery = 'SELECT * FROM `users` WHERE `login` = ? OR `email` = ?'

        db.query(checkQuery, [login, email], (err, results) => {
            if (err) {
                console.error('Error checking user existence:', err.message)
                return reject(err)
            }

            if (results.length > 0) {
                return reject(new Error('User with this login or email already exists.'))
            }

            const insertQuery = 'INSERT INTO `users` (`login`, `pass`, `email`, `profile`) VALUES (?, ?, ?, "")'
            const hash = crypto.createHash('sha256').update(pass).digest('hex')

            db.query(insertQuery, [login, hash, email], (err, results) => {
                if (err) {
                    console.error('Error adding user:', err.message)
                    return reject(err)
                }
                console.log('User added successfully:', results.insertId)
                resolve(results)
            })
        })
    })
```


### 2. Obsługa zdarzeń w czasie rzeczywistym
Plik `index.js` zawiera logikę WebSocketów, np. obsługę wiadomości:
```javascript
socket.on('request-messages', ({ loggedUser, fromId }) => {
        Database.RequestMessages(loggedUser, fromId)
            .then((result) => {
                socket.emit('request-messages-success', result)
            })
            .catch(err => {
                console.error('Error fetching messages:', err)
                socket.emit('request-messages-error', 'Failed to fetch messages')
            })
    })
```

---


### 3. Zapisaywanie plików
Plik `SaveImg.js` zapewnia łatwy i wydajny zapis plików. Oto przykładowy fragment kodu:
```javascript
function SaveImg(base64Data, fileName) {
    const filePath = path.join('./uploads', fileName);

    const buffer = Buffer.from(base64Data, 'base64');

    fs.writeFileSync(filePath, buffer);
    console.log('File saved:', filePath);
}

module.exports = { SaveImg }
```
## Uwagi

1. Plik `chat.sql` należy zaimportować przed uruchomieniem serwera.
2. Upewnij się, że katalogi `uploads/profiles` i `uploads/attachments` mają odpowiednie uprawnienia do zapisu plików.

---

## Podsumowanie

Serwer BaseChat to wydajne i nowoczesne rozwiązanie wspierające komunikację w czasie rzeczywistym. Jego modularna budowa ułatwia rozwój i integrację nowych funkcji. Zachęcamy do zapoznania się z kodem i testowania aplikacji!