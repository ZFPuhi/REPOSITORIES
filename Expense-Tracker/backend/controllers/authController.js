const User = require('../models/User')
const jwt = require("jsonwebtoken");
// Generate a JWT Token
const generateToken = (id) => {
    return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: "1h" });
};
// Register the User
exports.registerUser = async (req, res) => {
    const { fullName, email, password, profileImageUrl } = req.body;
// Validation: Check for any missing fields
    if (!fullName || !email || !password) {
        return res.status(400).json({ message: "All of the fields are required" });
    }
    try {
        //Check if the email address does not exists already
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ message: "Email is already in use" });
        }
        // Create the user if everything is good
        const user = await User.create({
            fullName,
            email,
            password,
            profileImageUrl,
        });
        res.status(201).json({
            id: user._id,
            user,
            token: generateToken(user._id),
        });
    } catch (err) {
        res
        .status(500)
        .json({ message: "Error registering the user", error: err.message});
    }
};
// Login the User
exports.loginUser = async (req, res) => {};
// Get the User Information
exports.getUserInfo = async (req, res) => {};