const { check } = require('express-validator');

const validateLogin = [
    check('userEmail')
    .notEmpty().withMessage('You must fill in your email address').bail().exists()
    .isEmail().withMessage('You must fill in a valid email address'),
    check('userPassword')
    .notEmpty().withMessage('You must fill in your password').bail(),
    ];

    module.exports = validateLogin;