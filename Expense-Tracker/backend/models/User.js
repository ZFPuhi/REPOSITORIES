const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const UserSchema = new mongoose.Schema(
    {
        fullName: { type: String, required: true},
        email: { type: String, required: true, unique: true},
        password: { type: String, required: true},
        profileImageUrl: { type: String, default: null},
    },
    { timestamps: true}
);
// Lets HASH the password before we save it, to be more secure.
UserSchema.pre("save", async function (next) {
    if (!this.isModified("password")) return next();
    this.password = await bcrypt.hash(this.password, 10);
    next();
});
// Well Let's make sure the user has typed the same password, so Compare is in order
UserSchema.methods.comparePassword = async function (candidatePassword) {
    return await bcrypt.compare(candidatePassword, this.password);
};
module.exports = mongoose.model("User", UserSchema);