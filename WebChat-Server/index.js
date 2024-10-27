const express = require('express')
const app = express()
const cors = require('cors')
const http = require('http')
const server = http.createServer(app)
const { Server } = require('socket.io')
const Database = require('./Database')
const io = new Server(server, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"],
    }
})

app.get('/', (req, res) => {
    res.send("test endopoint")
})

io.on('connection', (socket) => {
    console.log('User connected')

    socket.on('register-user', ({ username, password, email }) => {
        Database.RegisterUser(username, password, email)
            .then(() => {
                console.log('Rejestracja zakończona sukcesem')
                socket.emit('register-success', 'Użytkownik został pomyślnie zarejestrowany')
            })
            .catch(err => {
                console.error('Błąd rejestracji:', err.message)
                socket.emit('register-failure', 'Rejestracja nie powiodła się')
            })
    })

    //TODO: Implement other db functions

    socket.on('disconnect', () => {
        console.log('User disconnected')
    })
})

server.listen(3000, () => {
    console.log('Listening on localhost:3000')
})