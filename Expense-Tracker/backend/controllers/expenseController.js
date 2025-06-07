//const User = require("../models/User");
const xlsx = require('xlsx');
const Expense = require("../models/Expense");
// const { writeXLSX } = require("xlsx");

// Add Expense Source
exports.addExpense = async (req, res) => {
    const userId = req.user.id;
    try {
        const { icon, category, amount, date } = req.body;
        //Let's validate things for any missing fields
        if (!category || !amount || !date) {
            return res.status(400).json({ message: "All of the fields are required" });
        }

        const newExpense = new Expense({
            userId,
            icon,
            category,
            amount,
            date: new Date(date)
        });

        await newExpense.save();
        res.status(200).json(newExpense);
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
}
// Get All Expense Source
exports.getAllExpense = async (req, res) => {
    const userId = req.user.id;
    try {
        const expense = await Expense.find({ userId }).sort({ date: -1 });
        res.json(expense);
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
};
// Delete Expense Source
exports.deleteExpense = async (req, res) => {
    //const userId = req.user.id;
    try {
        await Expense.findByIdAndDelete(req.params.id);
        res.json({ message: "The Expense was deleted successfully" });
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
};
// Download as Excel file
exports.downloadExpenseExcel = async (req, res) => {
    const userId = req.user.id;
    try {
        const expense = await Expense.find({ userId }).sort({ date: -1});
        // Get and map data for Excel
        const data = expense.map ((item) => ({
            category: item.category,
            Amount: item.amount,
            Date: item.date,
        }));

        const wb = xlsx.utils.book_new();
        const ws = xlsx.utils.json_to_sheet(data);
        xlsx.utils.book_append_sheet(wb, ws, "Expense");
        xlsx.writeFile(wb, 'expense_details.xlsx');
        res.download('expense_details.xlsx');
    } catch (error) {
        res.status(500).json({ message: "There was a Server Error" });
    }
};