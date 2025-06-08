import React, { useState } from "react";
import Input from "../Inputs/Input";
import EmojiPickerPopup from "../EmojiPickerPopup";

const AddIncomeForm = ({onAddIncome}) => {
    const [income, setIncome] = useState({
        source: "",
        amount: "",
        date: "",
        icon: "",
    });
    const handleChange = (key, value) => setIncome({ ...income, [key]: value});
    return (
        <div>
            <EmojiPickerPopup
                icon={income.icon}
                onSelect={(selectedIcon) => handleChange("icon", selectedIcon)}
                />
            <Input
                value={income.source}
                onChange={({ target }) => handleChange("source", target.value)}
                label="Income Source"
                placeholder="Salary, SideJob, Pimping, etc"
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
                value={income.date}
                onChange={({ target }) => handleChange("date", target.value)}
                label="Date"
                placeholder="24.06.2025"
                type="date"
            />
            <div className="flex justify-end mt-6">
                <button type="button" className="add-btn add-btn-fill" onClick={() =>onAddIncome(income)}>
                    Add Income
                </button>
            </div>
        </div>
    );
};

export default AddIncomeForm;