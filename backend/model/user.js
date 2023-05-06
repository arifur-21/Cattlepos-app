const mongoose = require('mongoose');
const Schema = mongoose.Schema;

let userSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    user_name: {
      type: String,
      },
    phone_number:{
        type: String,
    },
    email:{
        type: String,
    },
    password:{
        type: String,
    },
    confirm_password:{
        type: String,
    }
     
}, {
    collection: 'user',
   })
   userSchema.index({
    '$**': 'text'
  });
  
  module.exports = mongoose.model('User', userSchema)