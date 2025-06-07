import axios from "axios";
import { BASE_URL } from "./apiPaths";

const axiosInstance = axios.create({
    baseURL: BASE_URL,
    timeout: 10000,
    headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
    },
});
// Request Interceptor
axiosInstance.interceptors.request.use(
    (config) => {
        const accessToken = localStorage.GetItem("token");
        if (accessToken) {
            config.headers.Authorization = `Bearer ${accessToken}`;
        }
        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

// Response Interceptor
axiosInstance.interceptors.response.use(
    (response) => {
        return response;
    },
    (error) => {
        // Lets handle all of the common errors (globally)
        if (error.response) {
            if (error.response.status === 401) {
                // Redirect to the Home/Login Page
                window.location.href = "/login";
            } else if (error.response.status === 500) {
                console.error(" Server Error. Please try again much much later.");
            }
        } else if (error.code === "ECONNABORTED") {
            console.error("Request Timeout. Please try again later.");
        }
        return Promise.reject (error);
    }
);

export default axiosInstance;