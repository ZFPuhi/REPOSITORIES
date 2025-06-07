//const User = require("../models/User");
const xlsx = require('xlsx');
const Income = require("../models/Income");
const { writeXLSX } = require("xlsx");

// Add Income Source $$
exports.addIncome = async (req, res) => {
    const userId = req.user.id;
    try {
        const { icon, source, amount, date } = req.body;
        //Let's validate things for any missing fields
        if (!source || !amount || !date) {
            return res.status(400).json({ message: "All of the fields are required" });
        }

        const newIncome = new Income({
            userId,
            icon,
            source,
            amount,
            date: new Date(date)
        });

        await newIncome.save();
        res.status(200).json(newIncome);
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
}
// Get All Income Source $$
exports.getAllIncome = async (req, res) => {
    const userId = req.user.id;
    try {
        const income = await Income.find({ userId }).sort({ date: -1 });
        res.json(income);
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
};
// Delete Income Source
exports.deleteIncome = async (req, res) => {
    //const userId = req.user.id;
    try {
        await Income.findByIdAndDelete(req.params.id);
        res.json({ message: "The Income was deleted successfully" });
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
};
// Download as Excel file
exports.downloadIncomeExcel = async (req, res) => {
    const userId = req.user.id;
    try {
        const income = await Income.find({ userId }).sort({ date: -1});
        // Get and map data for Excel
        const data = income.map ((item) => ({
            Source: item.source,
            Amount: item.amount,
            Date: item.date,
        }));

        const wb = xlsx.utils.book_new();
        const ws = xlsx.utils.json_to_sheet(data);
        xlsx.utils.book_append_sheet(wb, ws, "Income");
        xlsx.writeFile(wb, 'income_details.xlsx');
        res.download('income_details.xlsx');
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
};