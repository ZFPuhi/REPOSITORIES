import React, { useState, useEffect } from "react";
import { useUserAuth } from "../../hooks/useUserAuth";
import DashboardLayout from "../../components/layouts/DashboardLayout";
import { API_PATHS } from "../../utils/apiPaths";
import toast from "react-hot-toast";
import axiosInstance from "../../utils/axiosInstance";
import ExpenseOverview from "../../components/Expense/ExpenseOverview";
import Modal from "../../components/Modal";
import AddExpenseForm from "../../components/Expense/AddExpenseForm";
import ExpenseList from "../../components/Expense/ExpenseList";
import DeleteAlert from "../../components/DeleteAlert";

const Expense = () => {
  useUserAuth();
  const [expenseData, setExpenseData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [openDeleteAlert, setOpenDeleteAlert] = useState({
    show: false,
    data: null,
  });
  const [openAddExpenseModal, setOpenAddExpenseModal] = useState(false);
  // Adding Edit
  const [expenseToEdit, setExpenseToEdit] = useState(null);

  // Lets get all of the Expense Details
  const fetchExpenseDetails = async () => {
    if (loading) return;
    setLoading(true);
    try {
      const response = await axiosInstance.get(
        `${API_PATHS.EXPENSE.GET_ALL_EXPENSE}`
      );
      if (response.data) {
        setExpenseData(response.data);
      }
    } catch (error) {
      console.log("Something went horribly wrong! Please try again.", error);
    } finally {
      setLoading(false);
    }
  };
  // Lets handle all of the Expense Details
  const handleAddExpense = async (expense) => {
    const { category, amount, date, icon } = expense;
    //Adding a Validation checks
    if (!category.trim()) {
      toast.error("Category is required.");
      return;
    }
    if (!amount || isNaN(amount) || Number(amount) <= 0) {
      toast.error("Amount should be a valid number greater than 0.");
      return;
    }
    if (!date) {
      toast.error("Date is Required.");
      return;
    }
    try {
      await axiosInstance.post(API_PATHS.EXPENSE.ADD_EXPENSE, {
        category,
        amount,
        date,
        icon,
      });
      setOpenAddExpenseModal(false);
      // toast.sussess("Expense added successfully! We are are poor!");
      toast.success("Expense added successfully! We are are poor!");
      fetchExpenseDetails();
    } catch (error) {
      console.error(
        "Error adding expense:",
        error.response?.data?.message || error.message
      );
    }
  };

  // Adding Edit
  const handleEditExpense = async (updatedExpense) => {
  const { category, amount, date, icon, _id } = updatedExpense;

  if (!category.trim()) {
    toast.error("Category is required.");
    return;
  }
  if (!amount || isNaN(amount) || Number(amount) <= 0) {
    toast.error("Amount should be a valid number greater than 0.");
    return;
  }
  if (!date) {
    toast.error("Date is Required.");
    return;
  }

  try {
    await axiosInstance.put(API_PATHS.EXPENSE.UPDATE_EXPENSE(_id), {
      category,
      amount,
      date,
      icon,
    });
    toast.success("Expense updated successfully!");
    setOpenAddExpenseModal(false);
    setExpenseToEdit(null);
    fetchExpenseDetails();
  } catch (error) {
    console.error(
      "Error updating expense:",
      error.response?.data?.message || error.message
    );
    toast.error("Failed to update the expense.");
  }
};

  // Time to Delete our Expenses
  const deleteExpense = async (id) => {
    try {
      await axiosInstance.delete(API_PATHS.EXPENSE.DELETE_EXPENSE(id));
      setOpenDeleteAlert({ show: false, data: null });
      toast.success("Expense details were deleted successfully");
      fetchExpenseDetails();
    } catch (error) {
      console.error(
        "Error Deleting these expenses:",
        error.response?.data?.message || error.message
      );
    }
  };  
  // Well before delete lets also have a Download Income Details
  const handleDownloadExpenseDetails = async () => {
    try {
      const response = await axiosInstance.get(
        API_PATHS.EXPENSE.DOWNLOAD_EXPENSE,
        {
          responseType: "blob",
        }
      );
      // Lets create a URL for the Download blob
      const url = window.URL.createObjectURL(new Blob([response.data]))
      const link = document.createElement("a");
      link.href = url;
      link.setAttribute("download", "expense_details.xlsx");
      document.body.appendChild(link);
      link.click();
      link.parentNode.removeChild(link);
      window.URL.revokeObjectURL(url);
    } catch (error) {
      console.error ("Error downloading the expense details:", error);
      toast.error("Failed to download the expense details, please try again");
    }
  };

  useEffect(() => {
    fetchExpenseDetails();
    return () => {};
  }, [])

  return (
    <DashboardLayout activeMenu="Expense">
      <div className="my-5 mx-auto">
        <div className="grid grid-cols-1 gap-6">
          <div>
            <ExpenseOverview
              transactions={expenseData}
              onExpenseIncome={() => setOpenAddExpenseModal(true)}
            />
          </div>
          <ExpenseList
            transactions={expenseData}
            onDelete={(id) => {
              setOpenDeleteAlert({ show: true, data: id });
            }}
            // Add Edit
            onEdit={(expense) => {
            setExpenseToEdit(expense);
            setOpenAddExpenseModal(true);
            }}
            onDownload={handleDownloadExpenseDetails}
            />
        </div>
        {/* <Modal
          isOpen={openAddExpenseModal}
          onClose={() => setOpenAddExpenseModal(false)}
          title="Add Expense"
        > */}
        {/* // Adding Edit */}
        <Modal
          isOpen={openAddExpenseModal}
            onClose={() => {
            setOpenAddExpenseModal(false);
            setExpenseToEdit(null); // Clear edit mode on close
            }}
          title="Add Expense"
        >
          {/* <AddExpenseForm onAddExpense={handleAddExpense} /> */}
          {/* // Adding Edit */}
          <AddExpenseForm
          onAddExpense={expenseToEdit ? handleEditExpense : handleAddExpense}
          initialData={expenseToEdit}
          />
        </Modal>
        <Modal
          isOpen={openDeleteAlert.show}
          onClose={() => setOpenDeleteAlert({ show: false, data: null})}
          title="Delete Expense"
          >
            <DeleteAlert
              content="Are you sure you want to delete this expense?"
              onDelete={() => deleteExpense(openDeleteAlert.data)}
            />
          </Modal>
      </div>
    </DashboardLayout>
  );
};

export default Expense;