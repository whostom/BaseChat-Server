const express = require('express')
const app = express()
const http = require('http')
const server = http.createServer(app)
const { Server } = require('socket.io')
const Database = require('./Database')
const path = require('path')
const cors = require('cors')

const onlineUsers = new Map();

const io = new Server(server, {
    maxHttpBufferSize: 1e8,
    cors: {
        origin: "*",
        methods: ["GET", "POST"],
    }
})
app.use(cors())
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.get('/', (req, res) => {
    res.send("test endpoint")
})

io.on('connection', (socket) => {
    console.log('User connected:', socket.id)

    socket.on('register-user', ({ username, password, email }) => {
        Database.RegisterUser(username, password, email)
            .then(() => {
                socket.emit('register-success', 'User added successfully')
            })
            .catch(() => {
                socket.emit('register-failure', 'Error adding user')
            })
    })

    socket.on('login-user', ({ username, hashedPassword, email }) => {
        Database.LoginUser(username, hashedPassword, email)
            .then(({ user, token }) => {
                socket.emit('login-success', { user, token })
                console.log('User logged in:', user.user_id, socket.id)
            })
            .catch(() => {
                socket.emit('login-failure', 'User login failure')
            })
    })

    socket.on('request-user-list', ({ loggedUser }) => {
        Database.RequestUserList(loggedUser)
            .then((result) => { //it might send [], so check that on client side
                onlineUsers.set(loggedUser, socket.id)
                socket.emit('request-user-list-success', result)
            })
            .catch(err => {
                socket.emit('request-user-list-error', 'Failed to fetch user list')
            })
    })

    socket.on('update-profile', ({ loggedUser, profilePicture}) => {
        Database.UpdateProfile(loggedUser, profilePicture)
            .then((result) => {
                socket.emit('update-profile-success', result)
            })
            .catch(err => {
                socket.emit('update-profile-error', 'Failed to update profile')
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

    socket.on('send-message', ({ loggedUser, content, receiverId, attachment}) => {
        Database.SendMessage(loggedUser, content, receiverId, attachment)
            .then((result) => {
                socket.emit('send-message-success', result)
            })
            .catch(err => {
                console.error('Error sending message:', err)
                socket.emit('send-message-error', 'Failed to send message')
            })


        const senderSocketId = onlineUsers.get(loggedUser)
        const receiverSocketId = onlineUsers.get(receiverId)
        console.log(onlineUsers)

        console.log("Sender socket:", senderSocketId)
        console.log("Receiver socket:", receiverSocketId)

        Database.RequestMessages(loggedUser, receiverId)
            .then((result) => {
                if (senderSocketId) {
                    io.to(senderSocketId).emit('new-message', { data: result });
                }

                if (receiverSocketId) {
                    io.to(receiverSocketId).emit('new-message', { data: result });
                }
            })
            .catch(err => {
                console.error('Error fetching messages:', err);
            })

    })

    socket.on('disconnect', () => {
        console.log('User disconnected')

        for (const [userId, socketId] of onlineUsers.entries()) {
            if (socketId === socket.id) {
                onlineUsers.delete(userId);
                break;
            }
        }
    })
})

server.listen(3000, () => {
    console.log('Listening on localhost:3000')
})