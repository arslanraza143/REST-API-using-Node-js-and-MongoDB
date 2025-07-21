const express = require('express');
const app = express();

const userModel = require('./oldusermodel')

app.get('/', function(req, res) {
    res.send('hey this is' );
});

app.get('/create', async function (req, res)  {
    let createdUser = await userModel.create(
        {
            name: 'raza',
            username: 'raza143',
            email: 'raza@gmail.com'
        }
    )
    res.send(createdUser);
    res.redirect('/read');
});

app.get('/update', async function (req, res){
    let updatedUser = await userModel.findOneAndUpdate({username: 'arslan143'}, {name: 'Muhammad Arslan'}, {new: true});
    res.send(updatedUser);
})

app.get('/read', async function (req, res){
    //let users = await userModel.findOne({username: 'raza143'}); // findOne will return an object or null if not found
    let users = await userModel.find(); // find will return an array of documents

    res.send(users);
})

app.get('/delete', async function (req, res) {
    await userModel.findOneAndDelete({username: 'raza143'});
    res.redirect('/read');
})



app.listen(3000);