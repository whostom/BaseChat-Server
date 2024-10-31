const db = require('./DbConnection')
const { v4: uuid } = require('uuid')

function SendMessage(loggedUserId, content, attachment, receiverId) {
    return new Promise((resolve, reject) => {
        if (attachment == null) {
            const query = 'INSERT INTO `messages` (`message_id`, `content`, `attachment`, `receiver_id`, `author_id`) VALUES (\'\', ?, ?, \'\', ?);'

            db.query(query, [content, receiverId, loggedUserId], (err, results) => {
                if (err) {
                    console.error('Error sending message:', err.message)
                    reject(err)
                    return
                }
                console.log('Message sent successfully:', results)
                resolve(results)
            })
        }
        else{
            SaveImg(attachment)
            const query = 'INSERT INTO `messages` (`message_id`, `content`, `attachment`, `receiver_id`, `author_id`) VALUES (\'\', ?, ?, ?, ?);'
            const fileName = uuid()
            db.query(query, [content, fileName, receiverId, loggedUserId], (err, results) => {
                if (err) {
                    console.error('Error sending message:', err.message)
                    reject(err)
                    return
                }
                console.log('Message sent successfully:', results)
                resolve(results)
            })
        }
    })
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