const db = require('./DbConnection')

function RequestUserList(loggedUserId) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT user_id, login, profile FROM users'

        db.query(query, [], (err, results) => {
            if (err) {
                console.error('Error reading user list:', err.message)
                return reject(err)
            }

            results.forEach(result => {
                console.log(result)
                if (result.profile) {
                    result.profile = `http://localhost:3000/uploads/profiles/${result.profile}`
                }
                else {
                    result.profile = `http://localhost:3000/uploads/profiles/default.png`
                }
            })

            console.log('Users read successfully:', results)
            resolve(results)
        })
    })
}

module.exports = { RequestUserList }
