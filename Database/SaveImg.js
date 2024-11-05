const path = require('path')
const fs = require('fs')

function SaveImg(base64Data, fileName) {
    const filePath = path.join('./uploads', fileName);

    const buffer = Buffer.from(base64Data, 'base64');

    fs.writeFileSync(filePath, buffer);
    console.log('File saved:', filePath);
}

module.exports = { SaveImg }