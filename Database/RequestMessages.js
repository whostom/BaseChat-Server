const db = require('./DbConnection')

function RequestMessages(loggedUserId, fromId) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM messages WHERE (receiver_id = ? AND author_id = ?) OR (receiver_id = ? AND author_id = ?) ORDER BY message_id DESC'
        db.query(query, [loggedUserId, fromId, fromId, loggedUserId], (err, results) => {
            if (err) {
                console.error('Error reading messages:', err.message)
                reject(err)
                return
            }

            results.forEach(result => {
                if (result.attachment) {
                    result.attachment = `http://localhost:3000/uploads/media/${result.attachment}`
                }
            })

            console.log('Messages read successfully:', results)
            resolve(results)
        })
    })
}

module.exports = { RequestMessages }