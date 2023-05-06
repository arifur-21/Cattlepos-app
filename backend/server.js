let express = require('express'),
  app = express();
  path = require('path'),
  mongoose = require('mongoose'),
  cors = require('cors'),
  bodyParser = require('body-parser'),
  dbConfig = require('../backend/Database/db'),

  // Connecting with mongo db
  mongoose.Promise = global.Promise;
  mongoose.connect(dbConfig.db, {
  useNewUrlParser: true,
  useUnifiedTopology: true,

}).then(() => {
  console.log('Database sucessfully connected')
},
  error => {
    console.log('Database could not connected: ' + error)
  }
)

const http = require("http").Server(app);



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));
//cors


var corsOptions = {
  origin: '*',
  credentials: true
}

app.use(cors(corsOptions));

app.use(function (req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
});




app.use('/public', express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'dist/cattlepos')));
app.use('/', express.static(path.join(__dirname, 'dist/cattlepos')));


// Setting up port with express js
const ReceiptRoute = require('./route/receipt.route');
// route
app.use('/api/receipt', ReceiptRoute);

// Setting up port with express js for user
const UserRoute = require('./route/user.route');
// route
app.use('/api/user', UserRoute);



// Create port
const port = process.env.PORT || 3100;
const server = http.listen(port, () => {
  console.log('Connected to port ' + port)
})

// error handler
app.use(function (err, req, res, next) {
  console.error(err.message); // Log error message in our server's console
  if (!err.statusCode) err.statusCode = 500; // If err has no specified error code, set error code to 'Internal Server Error (500)'
  res.status(err.statusCode).send(err.message); // All HTTP requests must have a response, so let's send back an error with its status code and message
});

