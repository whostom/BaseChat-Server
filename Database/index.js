const db = require('./DbConnection')
const { RegisterUser } = require('./RegisterUser')
const { RequestMessages } = require('./RequestMessages')
const { RequestUserList } = require('./RequestUserList')
const { SendMessage } = require('./SendMessage')
const { LoginUser } = require('./LoginUser')
const { UpdateProfile } = require('./UpdateProfile')

module.exports = {
    db,
    LoginUser,
    RegisterUser,
    RequestMessages,
    RequestUserList,
    SendMessage,
    UpdateProfile
}