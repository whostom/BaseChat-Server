const db = require('./DbConnection')
const crypto = require('crypto')

function RegisterUser(login, pass, email) {
    return new Promise((resolve, reject) => {
        const checkQuery = 'SELECT * FROM `users` WHERE `login` = ? OR `email` = ?'

        db.query(checkQuery, [login, email], (err, results) => {
            if (err) {
                console.error('Error checking user existence:', err.message)
                reject(err)
                return
            }

            if (results.length > 0) {
                reject(new Error('User with this login or email already exists.'))
                return
            }

            const insertQuery = 'INSERT INTO `users` (`user_id`, `login`, `pass`, `email`) VALUES (NULL, ?, ?, ?)'
            const hash = crypto.createHash('sha256').update(pass).digest('hex')

            db.query(insertQuery, [login, hash, email], (err, results) => {
                if (err) {
                    console.error('Error adding user:', err.message)
                    reject(err)
                    return
                }
                console.log('User added successfully:', results.insertId)
                resolve(results)
            })
        })
    })
}

module.exports = { RegisterUser }
