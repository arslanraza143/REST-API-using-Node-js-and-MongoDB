const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());

const userModel = require('./models/user')

app.use(express.json());

app.get('/', function(req, res){
    res.send('done');
})

app.get('/read', async function(req, res){
    try {
        let alluser = await userModel.find();
        if (!alluser.length) return res.status(404).send('No users found');
        res.status(200).json(alluser);
    console.log(alluser);
    } catch (error) {
        console.error('Error fetching users:', error);
        res.status(500).send('Internal Server Error');
    }
    
})

app.post('/create',async function(req, res){
    try {
        let { name, email, imageUrl } = req.body;
    
    // res.status(200).json({
    //     name,
    //     email,
    //     imageUrl
    // });
    if (!name || !email || !imageUrl) {
        return res.status(400).send('All fields are required');
    }

    let users = await userModel.create({
        name,
        email,
        imageUrl
    })
    //res.status(200);
    console.log(users);
    res.status(200).json({
        success: true,
        message: 'User created successfully',
        data: users
    })
    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).json({
            error: 'Failed to create user',
        })
    }
   
});

app.delete('/delete/:id', async function(req, res){
    let id = req.params.id;
    try {
        await userModel.findOneAndDelete(id);
    res.status(200).json({
        success: true,
        message: 'User deleted successfully',
    });
    } catch (error) {
        console.error('Error deleting user:', error);
        res.status(500).json({
            error: 'Failed to delete user',
        });
    }

});

app.put('/update/:id', async function(req, res){
    let id = req.params.id;
    let { name, email, imageUrl } =req.body;
    try {
        await userModel.findOneAndUpdate({_id: id}, {name, email, imageUrl}, {new: true});
    console.log('User Updated Successfully ');
    res.status(200).json({
        success: true,
        message: 'User Updated Successfully'
    })
    } catch (error) {
        console.error('Error updated user:', error);
        res.status(500).json({
            error: 'Failed to update user',
        });
    }
});

app.listen(3000)