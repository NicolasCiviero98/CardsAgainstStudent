const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
const http = require('http');

const app = express();
const server = http.createServer(app);
const io = require('socket.io')(server);

const restController = require('./src/controllers/restController')

mongoose.connect('mongodb+srv://CASAdmin:cardsagainststudent@cas.yqcqx.mongodb.net/CASDatabase?retryWrites=true&w=majority',{
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

io.on('connection', socket => {
    const _id = socket.id
    console.log(`User ${_id} just connected!`);

    socket.on('getCards', restController.getBlackCardByID);

    socket.on('join', (data) => {
        console.log(`O ${data.username} fez login no socket`)
    });

    socket.on('disconnect', () => {
        console.log('Socket disconnected: ' + _id)
    })
});

app.use((req, res, next) => {
    req.io = io;

    return next();
})

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(cors({origin: 'null'}));
app.use(require('./src/routes'));

server.listen(3000, () => console.log('API and Socket Server - started on port http://localhost:3000/'));

