import React, { useState, useEffect } from "react";
import { prepareExpenseBarChartData } from "../../utils/helper";
import CustomBarChart from "../Charts/CustomBarChart";

const Last30DaysExpenses = ({data}) => {
    const [charData, setCharData] = useState([]);
    useEffect(() => {
        const result = prepareExpenseBarChartData(data);
        setCharData(result);
        return () => {};
    }, [data]);
    return (
        <div className="card col-span-1">
            <div className="flex items-center justify-between">
                <h5>Last 30 Days Expenses</h5>
            </div>
            <CustomBarChart data={charData} />
        </div>
    );
};

export default Last30DaysExpenses;