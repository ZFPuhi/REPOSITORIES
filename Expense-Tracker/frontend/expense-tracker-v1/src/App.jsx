import React from "react";

import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import Login from "./pages/Auth/Login";
import SignUp from "./pages/Auth/SignUp";
import Home from "./pages/Dashboard/Home";
import Income from "./pages/Dashboard/Income";
import Expense from "./pages/Dashboard/Expense";
import UserProvider from "./context/UserContext";
import { Toaster } from "react-hot-toast";
// Adding specific Theme Provider from shadcn for DarkMode
import { ThemeProvider } from "./components/theme-provider"; 

const App = () => {
  return (
    // <ThemeProvider defaultTheme="dark" storageKey="vite-ui-theme">
      <UserProvider>
        <div>
          <Router>
            <Routes>
              <Route path="/" element={<Root />} />
              <Route path="/login" element={<Login />} />
              <Route path="/signUp" element={<SignUp />} />
              <Route path="/dashboard" element={<Home />} />
              <Route path="/income" element={<Income />} />
              <Route path="/expense" element={<Expense />} />
            </Routes>
          </Router>
        </div>
        <Toaster
          toastOptions={{
            className: "",
            style: {
              fontSize:'13px'
            },
          }}
        />
      </UserProvider>
    // </ThemeProvider>
  );
};

export default App;

const Root = () => {
  // Lets check if the token actually exists in the LocalStorage
  const isAuthenticated = !!localStorage.getItem("token");

  // If Authentication is true, then redirect to the Dashboard. Otherwise back to the login page with you bad boy you.
  return isAuthenticated ? (
    <Navigate to="/dashboard" />
  ) : (
    <Navigate to="/login" />
  );
};