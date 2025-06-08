# 💰 Expense Tracker v1

A simple full-stack Expense Tracker app using **React**, **TailwindCSS**, **Express**, and **MongoDB**.

---

## 🚀 Getting Started

### 1. Frontend Setup

```bash
nvm use 24.1.0
```

#### Create Project with Vite

```bash
npm create vite@latest
```

- **Project name**: `expense-tracker-v1`
- **Framework**: `React`
- **Variant**: `JavaScript`

```bash
cd expense-tracker-v1
npm install
```

> ⚠️ **Warning**: You may see a warning about unsupported Node version:
> ```
> npm WARN EBADENGINE Unsupported engine {
>   package: 'vite@6.3.5',
>   required: { node: '^18.0.0 || ^20.0.0 || >=22.0.0' },
>   current: { node: 'v21.4.0', npm: '10.2.4' }
> }
> ```

#### Start the Dev Server

```bash
npm run dev
```

#### Install Frontend Dependencies

```bash
npm install tailwindcss @tailwindcss/vite
npm install react-icons axios moment emoji-picker-react react-router-dom recharts react-hot-toast
```

---

## 🛠 Backend Setup

```bash
cd backend
npm init -y
```

#### Install Backend Dependencies

```bash
npm install express jsonwebtoken mongoose dotenv cors bcryptjs multer xlsx
npm install nodemon --save-dev
```

> ⚠️ **Warning**: You may encounter a **high severity vulnerability**.
> Run `npm audit` to review and resolve any issues.

#### Run Backend Dev Server

```bash
npm run dev
```

Expected output:

```
[nodemon] starting `node server.js`
Server running on port 8000
MongoDB Connected Successfully
```

---

## ☁️ MongoDB Setup (FREE)

1. Create a free MongoDB account at [MongoDB Atlas](https://www.mongodb.com/atlas/database).
2. Create a **free cluster** (e.g., name it `ExpenseTracker`).
3. Create a **database user** (different from your login user).
   - Set a username and password.
   - Save them securely (e.g., Notepad++).
4. Choose **Connect > Drivers > Node.js**.
   - Copy the connection string (use “Show Password”).
   - Add it to your `.env` file as:

```env
MONGO_URI=mongodb+srv://<username>:<password>@yourcluster.mongodb.net/?retryWrites=true&w=majority
```

---

## 🔐 Environment Variables

Generate a secure JWT secret:

```bash
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
```

Add it to your `.env` file:

```env
JWT_SECRET=your_generated_secret
```

---

## ✅ Summary

| Component     | Stack                         |
|---------------|-------------------------------|
| Frontend      | React + Vite + TailwindCSS    |
| Backend       | Node.js + Express             |
| Database      | MongoDB Atlas                 |
| Auth & Utils  | JWT, bcryptjs, multer, xlsx   |

---

## 🧾 Notes

- Use `npm fund` to see which packages are looking for funding.
- Use `npm audit` to check and fix security vulnerabilities.
- Node version warnings (`EBADENGINE`) can typically be ignored if the app functions correctly.

---

## 💡 Tip

Use [Notepad++](https://notepad-plus-plus.org/) or another editor to store important config values (like passwords and secrets) during setup.

---

Happy Tracking! 🧾📊💸
