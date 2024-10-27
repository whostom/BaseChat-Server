const mysql = require('mysql2')

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'chat',
    password: ''
})

db.connect((err) => {
    if (err) {
        console.error('Database connection error:', err.message)
        return
    }
    console.log('Database connected succesfully')
})

module.exports = db