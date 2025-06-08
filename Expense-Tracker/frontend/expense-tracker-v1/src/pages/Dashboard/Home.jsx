import React, { useEffect, useState } from 'react'
import DashboardLayout from '../../components/layouts/DashboardLayout';
import { useUserAuth } from '../../hooks/useUserAuth';
import { useNavigate } from 'react-router-dom';
import axiosInstance from '../../utils/axiosInstance';
import { API_PATHS } from '../../utils/apiPaths';
import InfoCard from '../../components/Cards/InfoCard';
import { LuHandCoins, LuWalletMinimal } from 'react-icons/lu';
import { IoMdCard } from "react-icons/io";
import { addThousandsSeparator } from '../../utils/helper';
import RecentTransactions from '../../components/Dashboard/RecentTransactions';
import FinanceOverview from '../../components/Dashboard/FinanceOverview';

const Home = () => {
  useUserAuth();
  const navigate = useNavigate();
  const [dashboardData, setDashboardData] = useState(null);
  const [loading, setLoading] = useState(false);
  const fetchDashboardData = async () => {
    if (loading) return;
    setLoading(true);
    try {
      const response = await axiosInstance.get(
        `${API_PATHS.DASHBOARD.GET_DATA}`
      );
      if (response.data) {
        setDashboardData(response.data);
      }
    } catch (error) {
      console.log("Something went horribly wrong! Please try again.", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect (() => {
    fetchDashboardData();
    return() => {};
  }, []);
  return (
    <DashboardLayout activeMenu="Dashboard">
    <div className="my-5 mx-auto">
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <InfoCard
          icon={<IoMdCard />}
          label="Total Balance"
          value={addThousandsSeparator(dashboardData?.totalBalance || 0)}
          color="bg-primary"
          />
        <InfoCard
          icon={<LuWalletMinimal />}
          label="Total Income"
          value={addThousandsSeparator(dashboardData?.totalIncome || 0)}
          color="bg-orange-500"
          />
        <InfoCard
          icon={<LuHandCoins />}
          label="Total Expense"
          value={addThousandsSeparator(dashboardData?.totalExpense || 0)}
          color="bg-red-500"
          />
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
        <RecentTransactions
          transactions={dashboardData?.recentTransactions}
          onSeeMore={() => navigate("/expense")}
        />
        <FinanceOverview
          totalBalance={dashboardData?.totalBalance || 0}
          totalIncome={dashboardData?.totalIncome || 0}
          totalExpense={dashboardData?.totalExpense || 0}
        />
      </div>
    </div>
    </DashboardLayout>
  );
};
export default Home;