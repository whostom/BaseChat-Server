const db = require('./DbConnection')
const { v4: uuid } = require('uuid')
const path = require('path')
const fs = require('fs')

function SendMessage(loggedUserId, content, receiverId, attachment) {
    return new Promise((resolve, reject) => {
        const fileName = attachment ? uuid() : '';
        const query = 'INSERT INTO `messages` (`attachment`, `content`, `receiver_id`, `author_id`) VALUES (?, ?, ?, ?);'

        if (attachment) {
            SaveImg(attachment,fileName);
        }

        db.query(query, [fileName, content, receiverId, loggedUserId], (err, results) => {
            if (err) {
                console.error('Error sending message:', err.message);
                return reject(err);
            }
            console.log('Message sent successfully:', results);
            resolve(results);
        });
    });
}


module.exports = { SendMessage }

function SaveImg(base64Data, fileName) { //"lekko inspirowane" kochaną stroną stackoverflow
    const filePath = path.join(__dirname, 'uploads', fileName)

    const matches = base64Data.match(/^data:(.+);base64,(.+)$/)
    if (!matches) {
        throw new Error('Invalid Base64 string')
    }

    const fileData = matches[2]
    const buffer = Buffer.from(fileData, 'base64')

    fs.writeFileSync(filePath, buffer)
    console.log('File saved:', filePath)
}