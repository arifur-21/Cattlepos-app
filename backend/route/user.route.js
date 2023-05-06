let express = require('express'),
    mongoose = require('mongoose'),
    router = express.Router();
 
let User = require('../model/user');

router.post('/adduser', (req, res) => {
    const receip = new User();
    receip._id = new mongoose.Types.ObjectId();
    receip.user_name= req.body.user_name;
    receip.phone_number= req.body.phone_number;
    receip.email=req.body.email;
    receip.password=req.body.password;
    receip.confirm_password=req.body.confirm_password;
    
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
// Get aLL
router.get('/', (req,res)=>{
    User.find((err,data)=>{
        if(err){
            console.log(data);
            console.log('Error in Get Data'+ err);
             }
             else{
                res.send(data)
             }
    }).sort({user_name:"ascending"})
  })

//get by id
router.get('/viewuser/:id',(req, res) => {
    User.findById(req.params.id, (error, data) => {
    if (error) {
      return next(error)
    } else {
      res.json(data)
    }
  })
})

// Update by id
router.put('/edituser/:id',(req, res, next) => {
    User.findByIdAndUpdate(req.params.id, {
    $set: req.body
  }, (error, data) => {
    if (error) {
      return next(error);
      console.log(error)
    } else {
      res.json(data)
      console.log('User updated successfully!')
    }
  })
})

// Delete 
router.route('/delete/:id').delete((req, res, next) => {
    User.findByIdAndRemove(req.params.id, (error,result, data) => {
        if (error) {
            return next(error);
        } else {
            res.status(200).json({
                isUpdate: true, 
                result: result,
                message: "User Delete Sucsess"
                
            })
        }
    })
})

module.exports = router;