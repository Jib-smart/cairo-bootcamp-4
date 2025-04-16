---
# 📝 Starknet Todo App

A decentralized Todo List built with [Next.js](https://nextjs.org), styled using **Tailwind CSS**, and powered by **Starknet smart contracts**. Users can connect their wallets, manage tasks (add, toggle, delete), and interact with the blockchain in real-time.

> ⚡ Built with [`@starknet-react/core`](https://github.com/apibara/starknet-react) and Cairo smart contracts.
---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/BlockheaderWeb3-Community/cairo-bootcamp-4
cd cairo-bootcamp-4
git checkout frontend
```

### 2. Install dependencies

```bash
npm install --legacy-peer-deps
# or
yarn install
```

### 3. Run the development server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the app.

---

## 🔧 Features

- ⚡ **Starknet Wallet Connection** – supports Argent X & Braavos
- ✅ **Add Todo** – add a new task to the blockchain
- 🔄 **Toggle Status** – mark tasks as complete or incomplete
- ❌ **Delete Todo** – remove a task permanently from the chain
- 🎨 **Beautiful UI** – built with Tailwind CSS and Radix UI

---

## 📜 Smart Contract Functions

The contract is written in **Cairo** and deployed to Starknet Testnet.

- `add_todo(string description)`
- `toggle_status(u256 id)`
- `delete_todo(u256 id)`
- `get_todos()`

---

## 🛠️ Tech Stack

| Layer      | Technology             |
| ---------- | ---------------------- |
| Frontend   | Next.js 14, TypeScript |
| UI         | Tailwind CSS, Radix UI |
| Blockchain | Starknet, Cairo        |
| Wallets    | Argent X, Braavos      |
| State      | React Hooks            |

---

## 🗂 Project Structure

```
.
├── app/                # App router pages
├── constants/abi/      # Contract ABI
├── public/             # Static files
└── README.md
```

---

## 📦 Deployment

Deploy easily on Vercel:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new)

---

## 🔗 Resources

- [Starknet Docs](https://docs.starknet.io/)
- [Cairo Book](https://book.cairo-lang.org/)
- [Starknet React](https://github.com/apibara/starknet-react)
- [Next.js App Router](https://nextjs.org/docs/app)

---

## 👩🏾‍💻 Author

Built with ❤️ by [@zintarh](https://github.com/zintarh)

---

Let me know if you want to add:

- Live demo URL
- Starknet Testnet contract address
- Screenshots or walkthrough GIFs
