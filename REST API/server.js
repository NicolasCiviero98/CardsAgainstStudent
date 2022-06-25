const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
const http = require('http');
const app = express();
const server = http.createServer(app);
const io = require('socket.io')(server);
//npm run devStart

const {
    userJoin,
    getCurrentUser,
    userLeave,
    getRoomUsers
  } = require('./src/users');

const restController = require('./src/controllers/restController')

mongoose.connect('mongodb+srv://CASAdmin:cardsagainststudent@cas.yqcqx.mongodb.net/CASDatabase?retryWrites=true&w=majority',{
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

io.on('connection', socket => {
    const _id = socket.id
    console.log(`User ${_id} just connected!`);

    socket.on('getRooms', () => {
      console.log(`User requested rooms list`);
      socket.emit('roomList', 'Sala #1;Sala #2;Sala #3;Sala #4;Sala #5;Sala #6');
    });

    socket.on('getCards', restController.getBlackCardByID);

    socket.on('joinRoom', ({ username, room }) => {
        console.log(`${username} connected on ${room}!`);

        const user = userJoin(socket.id, username, room);
    
        socket.join(user.room);
    
        // Welcome current user
        socket.emit('message', 'Welcome!');

        // Broadcast when a user connects
        socket.broadcast
          .to(user.room)
          .emit(
            'message',
            `${user.username} has joined!`
          );
    
        // Send users and room info
        io.to(user.room).emit('roomUsers', {
          room: user.room,
          users: getRoomUsers(user.room)
        });
    });

    socket.on('leaveRoom', ( ) => {
      console.log(`${username} left room!`);

      const user = userLeave(socket.id);
  
      // Send users and room info
      io.to(user.room).emit('roomUsers', {
        room: user.room,
        users: getRoomUsers(user.room)
      });
  
    });

    socket.on('disconnect', () => {
      console.log('Socket disconnected: ' + _id)
    });

    socket.on('roomStart', async () => {
      console.log(`Room Started`);

      const user = getCurrentUser(socket.id)
      
      //testes
      socket.emit('roundUpdate', {role: 'teacher', black_card: 'Em dia de prova só não pode faltar uma coisa! _____', stage: 'students', score: 6, round: 1, room: 'NomeDaSala'});
      await new Promise(r => setTimeout(r, 2000));
      socket.emit('roundUpdate', {role: 'student', black_card: 'Em dia de prova só não pode faltar uma coisa! _____', white_cards: ['carta 1', 'carta 2', 'carta 3'], stage: 'students', score: 6, round: 1, room: 'NomeDaSala'});
      await new Promise(r => setTimeout(r, 2000));
      socket.emit('roundUpdate', {role: 'teacher', black_card: 'Em dia de prova só não pode faltar uma coisa! _____', white_cards: ['Escolha p1', 'Escolha p2', 'Escolha p3'], stage: 'teacher', score: 6, round: 1, room: 'NomeDaSala'});
      await new Promise(r => setTimeout(r, 2000));
      socket.emit('roundUpdate', {role: 'student', black_card: 'Em dia de prova só não pode faltar uma coisa! _____', white_cards: ['Escolha p1', 'Escolha p2', 'Escolha p3'], stage: 'teacher', score: 6, round: 1, room: 'NomeDaSala'});
      
      // Criar nova estrutura de Sala
      //    *lista de usuários / pilha de cartas brancas / pilha de cartas pretas
      //    *lista de cartas brancas de cada usuário
      //    *lista das cartas escolhidas de cada aluno
      //    *lista dos pontos de cada usuário
      //    (dá pra colocar esses 3 ultimos dentro do uma struct de usuário)
      // as salas ativas podem ser guardadas e acessadas por um dicionário
      
      // a escolha de usuário pode ser feita circularmente, é só usar um index do professor atual

      // Loop:
      //    envia todas 
      //    o professor recebe a proxima carta da pilha de cartas pretas
      //    socket.emit('roundUpdate', {role: 'teacher', cards: carta_preta});
      //    para todo usuário !professor adicionar carta branca da pilha até completar 5
      //    socket.emit('roundUpdate', {role: 'student', white_cards: cartas_brancas[usuário], black_card:carta preta});
      
      //    toda vez q um aluno escolher a carta, testa se todos já escolheram
      //    socket.on('chooseCard', {role: 'student', card: carta_escolhida})

      //    quando todos escolherem a carta, avisar alunos que o professor "está corrigindo" e enviar opções pro professor
      //    socket.broadcast('roundUpdate', {user: teacher_username, cards: cartas_escolhidas});

      //    atualizar estatísticas dos jogadores e atualizar pontuações da partida
      //    socket.on('chooseCard', {role: 'teacher', card: carta_escolhida})


    });

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

