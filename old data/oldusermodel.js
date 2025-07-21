const mongoose = require('mongoose');

//mongoose.connect(`mongodb://localhost:27017/mongopracitce`);
mongoose.connect('mongodb://localhost:27017/mongopracitce', {
  
})
.then(() => console.log('MongoDB connected'))
.catch(err => console.error('MongoDB connection error:', err));
const userSchema = mongoose.Schema({
    name: String,
    username: String,
    email: String
});

module.exports = mongoose.model('user', userSchema);