const express = require('express');
const mongoose = require('mongoose');
const customer_Router = require('./ROUTER/Customer_Router');

const app = express();

const port = 5000;
const url =
    "mongodb+srv://selva:selva@cluster0.tquoj.mongodb.net/crmDB?retryWrites=true&w=majority";


mongoose.connect(url, { useNewUrlParser: true , useUnifiedTopology: true } );

mongoose.connection.on('connected', ()=>{
    console.log('mongoDB connected');
})

mongoose.connection.on('Errror', (err)=>{
    console.log(`mongoDB not connected and Error is ${err}`);
})
app.use(express.json());

app.use('/customers',customer_Router );

app.use('/', (req, res, next)=>{
    // console.log(req);
    // console.log(res);
    res.send('Welcome to flutter server side')
} )

app.listen(port, ()=> console.log(`server started at port ${port}`));


