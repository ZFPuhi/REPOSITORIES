import React, { useState, useEffect } from "react";
import Input from "../Inputs/Input";
import EmojiPickerPopup from "../EmojiPickerPopup";

// const AddExpenseForm = ({ onAddExpense, initialData }) => {
//     const [income, setIncome] = useState({
//     category: "",
//     amount: "",
//     date: "",
//     icon: "",
//     });
// Add Edit:
    const AddExpenseForm = ({ onAddExpense, initialData }) => {
    const [income, setIncome] = useState({
        category: initialData?.category || "",
        amount: initialData?.amount || "",
        date: initialData?.date || "",
        icon: initialData?.icon || "",
        id: initialData?._id || null,
    });

    useEffect(() => {
        if (initialData) {
        setIncome({
            category: initialData.category || "",
            amount: initialData.amount || "",
            date: initialData.date || "",
            icon: initialData.icon || "",
            id: initialData._id || null,
        });
        }
    }, [initialData]);

    const handleChange = (key, value) => setIncome({ ...income, [key]: value});
    return (
        <div>
            <EmojiPickerPopup
                icon={income.icon}
                onSelect={(selectedIcon) => handleChange("icon", selectedIcon)}
            />
            <Input
                value={income.category}
                onChange={({ target }) => handleChange("category", target.value)}
                label="Category"
                placeholder="Rent, Food, Hos, Angel Dust, etc"
                type="text"
            />
            <Input
                value={income.amount}
                onChange={({ target }) => handleChange("amount", target.value)}
                label="Amount"
                placeholder="00.00"
                type="number"
            />
            <Input
                value={income.date ? income.date.slice(0, 10) : ""}
                onChange={({ target }) => handleChange("date", target.value)}
                label="Date"
                placeholder="DD/MM/YYYY"
                type="date"
            />
            <div className="flex justify-end mt-6">
                <button type="button" className="add-btn add-btn-fill" onClick={()=>onAddExpense(income)}>Add Expense</button>
            </div>
        </div>
    );
};

export default AddExpenseForm;