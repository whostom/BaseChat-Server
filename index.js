const express = require('express')
const app = express()
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
    res.send("test endpoint")
})

io.on('connection', (socket) => {
    console.log('User connected')

    socket.on('register-user', ({ username, password, email }) => {
        Database.RegisterUser(username, password, email)
            .then(() => {
                socket.emit('register-success', 'User added successfully')
            })
            .catch(err => {
                socket.emit('register-failure', 'Error adding user')
            })
    })

    socket.on('request-user-list', ({ loggedUser }) => {
        Database.RequestUserList(loggedUser)
            .then((result) => {
                socket.emit('request-user-list-success', result)
            })
            .catch(err => {
                console.error('Error fetching user list:', err)
                socket.emit('request-user-list-error', 'Failed to fetch user list')
            })
    })

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

    socket.on('send-message', ({ loggedUser, content, receiverId }) => {
        Database.SendMessage(loggedUser, content, receiverId)
            .then((result) => {
                socket.emit('send-message-success', result)
            })
            .catch(err => {
                console.error('Error sending message:', err)
                socket.emit('send-message-error', 'Failed to send message')
            })
    })

    socket.on('disconnect', () => {
        console.log('User disconnected')
    })
})

server.listen(3000, () => {
    console.log('Listening on localhost:3000')
})