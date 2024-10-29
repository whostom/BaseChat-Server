const db = require('./DbConnection')

function RequestMessages(loggedUserId, fromId) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM messages WHERE (receiver_id = ? and author_id = ? OR (receiver_id = ? and author_id = ?) ORDER BY message_id DESC;'

        db.query(query, [loggedUserId, fromId, fromId, loggedUserId], (err, results) => {
            if (err) {
                console.error('Error reading messages:', err.message)
                reject(err)
                return
            }
            console.log('Messages read successfully:', results)
            resolve(results)
        })
    })
}

module.exports = { RequestMessages }
