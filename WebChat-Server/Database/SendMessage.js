const db = require('./DbConnection')

function SendMessage(loggedUserId, content, receiverId) {
    return new Promise((resolve, reject) => {
        const query = 'INSERT INTO `messages` (`message_id`, `content`, `receiver_id`, `author_id`) VALUES (\'\', ?, ?, ?);'

        db.query(query, [content, receiverId, loggedUserId], (err, results) => {
            if (err) {
                console.error('Error sending message:', err.message)
                reject(err)
                return
            }
            console.log('Message sent successfully:', results)
            resolve(results)
        })
    })
}

module.exports = { SendMessage }
