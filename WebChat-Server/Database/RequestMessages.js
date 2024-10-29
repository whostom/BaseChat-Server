const db = require('./DbConnection')

function RequestMessages(loggedUserId, fromId) {
    return new Promise((resolve, reject) => {
        const query = 'select * from messages where (receiver_id = ? and author_id = ? or (receiver_id = ? and author_id = ?) order by message_id desc;'

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
