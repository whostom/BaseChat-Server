const db = require('./DbConnection')

function LoginUser(username, hashedPassword, email) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM `users` WHERE (`login` = ? OR `email` = ?) AND `pass` = ?;'

        db.query(query, [username, email, hashedPassword], (err, results) => {
            if (err) {
                console.error('Database error:', err.message)
                reject(err)
                return
            }
            if (results.length == 0) {
                console.log('No user found with provided credentials')
                reject(new Error('No user found with provided credentials'))
                return
            }
            console.log('User found and successfuly logged:', results[0])
            resolve(results[0])
        })
    })
}

module.exports = { LoginUser }
