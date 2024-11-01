const db = require('./DbConnection')

function LoginUser(userId, password, email) {
    return new Promise((resolve, reject) => {
        const query = 'select * from users where (login = `?` or email = `?`) and pass = `?`;'

        db.query(query, [userId, email, password], (err, results) => {
            if (err) {
                console.error('No user found', err.message)
                reject(err)
                return
            }
            console.log('User found and successfuly logged:', results)
            resolve(results)
        })
    })
}

module.exports = { SendMessage }
