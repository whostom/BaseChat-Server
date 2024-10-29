const db = require('./DbConnection')

function RequestUserList(loggedUserId) {
    return new Promise((resolve, reject) => {
        const query = 'select user_id, login from users where user_id != ?;'

        db.query(query, [loggedUserId], (err, results) => {
            if (err) {
                console.error('Error reading user list:', err.message)
                reject(err)
                return
            }
            console.log('Users read successfully:', results)
            resolve(results)
        })
    })
}

module.exports = { RequestUserList }
