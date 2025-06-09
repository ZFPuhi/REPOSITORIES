import React from "react";
import { useEffect } from "react";
import { useState } from "react";
import { LuPlus } from "react-icons/lu";
import { prepareExpenseLineChartData } from "../../utils/helper";
import CustomLineChart from "../Charts/CustomLineChart";

const ExpenseOverview = ({ transactions, onExpenseIncome }) => {
    const [chartData, setChartData] = useState([]);
    useEffect(() => {
        const result = prepareExpenseLineChartData(transactions);
        setChartData(result);
        return () => {};
    }, [transactions]);
    return (
        <div className="card">
            <div className="flex items-center justify-between">
                <div className="">
                    <h5 className="text-lg">Expense Overview</h5>
                    <p className="text-xs text-gray-400 mt-0.5">
                        Track your spending habbits over time and gain knowledge on where your money are flying towards.
                    </p>
                </div>
                <button className="add-btn" onClick={onExpenseIncome}>
                    <LuPlus className="text-lg" />
                    Add Expense
                </button>
            </div>
            <div className="mt-10">
                <CustomLineChart data={chartData} />
            </div>
        </div>
    );
};

export default ExpenseOverview;