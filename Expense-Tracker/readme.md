nvm use node
24.1.0
======================
npm create vite@latest
Need to install the following packages:
create-vite@6.5.0
Ok to proceed? (y) y
======================
Project name:
│  expense-tracker-v1
│
◇  Select a framework:
│  React
│
◇  Select a variant:
│  JavaScript
│
◇  Scaffolding project in H:\REPOSITORIES\Expense-Tracker\frontend\expense-tracker-v1...
│
└  Done. Now run:

  cd expense-tracker-v1
  npm install
======================
npm install
npm WARN EBADENGINE Unsupported engine {
npm WARN EBADENGINE   package: 'vite@6.3.5',
npm WARN EBADENGINE   required: { node: '^18.0.0 || ^20.0.0 || >=22.0.0' },
npm WARN EBADENGINE   current: { node: 'v21.4.0', npm: '10.2.4' }
npm WARN EBADENGINE }

added 154 packages, and audited 155 packages in 10s

33 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
======================
  npm run dev
======================
  npm install tailwindcss @tailwindcss/vite

  npm WARN EBADENGINE Unsupported engine {
npm WARN EBADENGINE   package: 'vite@6.3.5',
npm WARN EBADENGINE   required: { node: '^18.0.0 || ^20.0.0 || >=22.0.0' },
npm WARN EBADENGINE   current: { node: 'v21.4.0', npm: '10.2.4' }
npm WARN EBADENGINE }

added 20 packages, and audited 175 packages in 3s

36 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
======================
npm i react-icons axios moment emoji-picker-react react-router-dom recharts react-hot-toast

npm WARN EBADENGINE Unsupported engine {
npm WARN EBADENGINE   package: 'vite@6.3.5',
npm WARN EBADENGINE   required: { node: '^18.0.0 || ^20.0.0 || >=22.0.0' },
npm WARN EBADENGINE   current: { node: 'v21.4.0', npm: '10.2.4' }
npm WARN EBADENGINE }

added 72 packages, and audited 247 packages in 5s

42 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
======================
backend folder:
npm init -y
======================
npm i express jsonwebtoken mongoose dotenv cors bcryptjs multer xlsx

added 127 packages, and audited 128 packages in 6s

17 packages are looking for funding
  run `npm fund` for details

1 high severity vulnerability

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
======================
npm i nodemon --save-dev

added 26 packages, and audited 154 packages in 1s

21 packages are looking for funding
  run `npm fund` for details

1 high severity vulnerability

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
======================
MongoDB
Create FREE account in MongoDB.
Create FREE Cluster (name it ExpenseTracker or something that you will not forget) select FREE TIER.
======================
MongoDB
Create a database user (different from your Login user) set username and password and then click Create User.
Do copy the username / password that you have entered before creating the user, into notepad++ or PWS.
======================
MongoDB
Choose Connection type -> Drivers (node.js, Go, etc)
Next page copy the sample + showpassword and place it into your .env MONGO_URI=%%
======================
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
Execute and copy the value into your JWT_SECRET=%% in the .env file.
======================
\backend> npm run dev

> expense-tracker-v1-backend@1.0.0 dev
> nodemon server.js

[nodemon] 3.1.10
[nodemon] to restart at any time, enter `rs`  
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,mjs,cjs,json
[nodemon] starting `node server.js`
Server running on port 8000
MongoDB Connected Successfully