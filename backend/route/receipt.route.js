let express = require('express'),
    mongoose = require('mongoose'),
    router = express.Router();
 
let Receipt = require('../model/receipt');

router.post('/addreceipt', (req, res) => {
    const receip = new Receipt();
    receip._id = new mongoose.Types.ObjectId();
    receip.buyer_name= req.body.buyer_name;
    receip.phone_number= req.body.phone_number;
    receip.cattle_type=req.body.cattle_type;
    receip.price=req.body.price;
    receip.hasil=req.body.hasil;
    
    receip.save().then(result => {
        console.log(result),
            res.status(200)
                .json({
                    isCreate: true,
                    result: result

                })
    }).catch(err => {
        console.log(err),
            res.status(500).json({
                error: err
            });
    });
});

// router.get('/receipts', (req,res)=>{
//     Receipt.find((err,data)=>{
//         if(err){
//             console.log(data);
//             console.log('Error in Get Data'+ err);
//              }
//              else{
//                 res.send(data)
//              }
//     }).sort({receipts_name:"ascending"})
//   })

// Get Users
// router.route('/all-admin').get((req, res) => {
//     Receipt.find((error, data) => {
//         if (error) {
//             return next(error)
//         } else {
//             res.json(data)
//         }
//     })
// })


//get all
router.get("/receipts", async (req, res) => {
    try {
      const receipts = await Receipt.find({ });
      res.send(receipts);
      console.log(receipts);
    } catch (err) {
      console.log(err);
    }
  });

//get by id
// router.get('/viewreceipt/:id',(req, res) => {
//     Receipt.findById(req.params.id, (error, data) => {
//     if (error) {
//       return next(error)
//     } else {
//       res.json(data)
//     }
//   })
// })

// Get Single Receipt
router.get('/viewreceipt/:id', (req, res, next) => {
    Receipt.findById({ _id: req.params.id }).then((response) => {
        res.status(200).json({
            isFound: true,
            result: response
        });
    }).catch(error => {
        res.status(500).json({
            error: error
        });
    });
 
})

// Update Receipt
router.put('/editreceipt/:id',(req, res, next) => {
    Receipt.findByIdAndUpdate(req.params.id, {
    $set: req.body
  }, (error, data) => {
    if (error) {
      return next(error);
      console.log(error)
    } else {
      res.json(data)
      console.log('Receipt updated successfully!')
    }
  })
})

// Delete Receipt
router.route('/delete/:id').delete((req, res, next) => {
    Receipt.findByIdAndRemove(req.params.id, (error,result, data) => {
        if (error) {
            return next(error);
        } else {
            res.status(200).json({
                isUpdate: true, 
                result: result,
                message: "Receipt Delete Sucsess"
                
            })
        }
    })
})


  module.exports = router;

