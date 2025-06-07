const mongoose = require("mongoose");

const connectDB = async () => {
    try {
        await mongoose.connect(process.env.MONGO_URI, {});
        console.log("MongoDB Connected Successfully");
    } catch (err) {
        console.error("Oops Error Connecting to the MongoDB, somethings gone horribly wrong!", err);
        process.exit(1);
    }
};

module.exports = connectDB;