const db = require('./DbConnection')
const { v4: uuid } = require('uuid')
const saveImg = require('./SaveImg')

function UpdateProfile(loggedUserId, profilePicture) {
    return new Promise((resolve, reject) => {
        let fileName = profilePicture ? uuid() : '';
        const query = 'UPDATE users SET profile = ? WHERE userId = ?'

        if (attachment) {
            fileName += profilePicture.type
            saveImg.SaveImg(profilePicture.content,'/profiles/' + fileName)
        }

        db.query(query, [fileName, loggedUserId], (err, results) => {
            if (err) {
                console.error('Error updating profile picture:', err.message);
                return reject(err);
            }
            console.log('Profile changed successfully:', results);
            resolve(results);
        });
    });
}


module.exports = { UpdateProfile }