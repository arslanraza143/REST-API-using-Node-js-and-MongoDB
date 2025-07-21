const mongoose = require('mongoose');

mongoose.connect(`mongodb://localhost:27017/userDB`,{

})
.then(() => console.log('Connected to MongoDB'))
.catch(err => console.error('Could not connect to MongoDB', err));

const userSchema = mongoose.Schema({
    name: String,
    email: String,
    imageUrl: String
})

module.exports = mongoose.model('user', userSchema);