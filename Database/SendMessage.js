const db = require('./DbConnection')
const { v4: uuid } = require('uuid')
const path = require('path')
const fs = require('fs')

function SendMessage(loggedUserId, content, receiverId, attachment) {
    return new Promise((resolve, reject) => {
        let fileName = attachment ? uuid() : '';
        const query = 'INSERT INTO `messages` (`attachment`, `content`, `receiver_id`, `author_id`) VALUES (?, ?, ?, ?);'

        console.log("attachment: ", attachment)
        if (attachment) {
            fileName += attachment.type
            console.log("filename:",fileName)
            SaveImg(attachment.content,fileName)
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
    const filePath = path.join('./uploads', fileName);

    const buffer = Buffer.from(base64Data, 'base64');

    fs.writeFileSync(filePath, buffer);
    console.log('File saved:', filePath);
}