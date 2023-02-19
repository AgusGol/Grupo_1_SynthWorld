const {check} = require('express-validator');


const validateProductUpdate =[
    check('name')
        .notEmpty()
        .withMessage('You must complete the product name').bail()
        .isLength({min: 5})
        .withMessage('Must contain at least 5 characters'),
    check("description")
        .notEmpty()
        .withMessage('You must complete the product description').bail()
        .isLength({min: 20})
        .withMessage('Must contain at least 20 characters').bail(),
    check("price")
         .notEmpty()
         .withMessage('You must put a price').bail(),
    //     .isLength({min: 2}).withMessage('Must contain at least 20 characters').bail(),
   // check("productImg")
   //     .custom((value, {req}) => {
            // let value = req.file.minetype
   //         console.log('reeq', req.file)
   //     if(req.file.mimetype === 'image/jpeg'|| req.file.mimetype === 'image/gif' || req.file.mimetype === 'image/png' || req.file == 'undefined'){
           // console.log('reeq', req.file)
    //       console.log('reeq entramos', req.file)
    //        return true;}
     //   else{
    //        console.log('req...' ,req.file)
    //        return false;
     //   }})
     //   .withMessage('Must be a valid file (JPG, JPEG, PNG, GIF).')
        
];

module.exports = validateProductUpdate;