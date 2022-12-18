const express = require("express");
const router= express.Router();
const userController= require("../controllers/userController");

router.get("/login", userController.login); //users
router.post("/login", userController.loginRequest);
router.get("/register", userController.register); //users


module.exports=router;