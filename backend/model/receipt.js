const mongoose = require('mongoose');
const Schema = mongoose.Schema;

let receiptSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    buyer_name: {
      type: String,
      require: true
      },
    phone_number:{
        type: String,
        require: true
    },
    cattle_type:{
        type: String,
        require: true
    },
    price:{
        type: Number,
        require: true
    },
    p_percentage:{
        type: Number,
        require: true
    },
    hasil:{
        type: Number,
        require: true
    }
     
}, {
    collection: 'receipt',
   })
   receiptSchema.index({
    '$**': 'text'
  });
  
  module.exports = mongoose.model('Receipt', receiptSchema)