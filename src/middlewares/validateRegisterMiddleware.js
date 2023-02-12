const { check } = require('express-validator');

const validateRegister = [
    check('email')
        .notEmpty()
        .withMessage('You must fill in your email address').bail()
        .isEmail()
        .withMessage('You must fill in a valid email address'),
    check('password')
        // .isLength({min: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1})
        .isStrongPassword({ minLength: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1 })
        .withMessage('Must contain at least 8 characters, 1 lower case character, 1 upper case character, 1 number and 1 special character.')
        .bail()
        .notEmpty()
        .withMessage('You must fill in your password').bail(),
    check('password2')
        .notEmpty()
        .withMessage('you must re-confirm your password')
        .isStrongPassword({ minLength: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1 })
        .withMessage('Must contain at least 8 characters, 1 lower case character, 1 upper case character, 1 number and 1 special character,as well as the password.')
        .custom((value, { req }) => {
            if (value !== req.body.password) {
            throw new Error('Password confirmation does not match password');
            }
        
            // Indicates the success of this synchronous custom validator
            return true;
        }),
    check('name')
        .notEmpty()
        .isLength({min: 2}),
    check('last_name')
        .notEmpty()
        .isLength({min: 2})
        .withMessage('The last name must be at least 1 character long'),    
    check('userAvatar')
        .custom((value, {req}) => {
            // let value = req.file.minetype
            console.log('reeq', req.file)
        if(req.file.mimetype === 'image/jpeg'|| req.file.mimetype === 'image/gif' || req.file.mimetype === 'image/png' || req.file == 'undefined'){
           // console.log('reeq', req.file)
           console.log('reeq entramos', req.file)
            return true;}
        else{
            console.log('req...' ,req.file)
            return false;}})
        .withMessage('Must be a valid file (JPG, JPEG, PNG, GIF).')
    ];

    module.exports = validateRegister;