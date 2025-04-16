"use client";
import { useState } from "react";
import { Circle, X } from "lucide-react";
import Navbar from "../components/Navbar";

type Todo = {
  id: string;
  text: string;
  status: string;
};

export default function TodoList() {
  const [todos, setTodos] = useState<Todo[]>([
    { id: "1", text: "Join Starknet Discord", status: "pending" },
    { id: "2", text: "Write your first Cairo contract", status: "pending" },
    { id: "3", text: "Deploy a dApp on Starknet", status: "completed" },
  ]);
  const [input, setInput] = useState("");

  const addTodo = async () => {
    // add todo
  };

  const deleteTodo = async (index: number) => {
    // delete todo
  };

  const toggleStatus = async (index: number) => {
    // toggle status
  };

  return (
    <div className="min-h-screen bg-[#0d1117] text-white ">
      <Navbar />
      <div className="px-4 py-12 flex flex-col items-center justify-center">
        <div className="w-full max-w-2xl bg-[#0e111a] rounded-3xl shadow-xl p-8 md:p-12 border border-[#1c1f26] relative">
          <h1 className="text-5xl font-extrabold text-center mb-10 leading-snug">
            <span className="bg-gradient-to-r from-[#5C94FF] to-[#FC8181] bg-clip-text text-transparent">
              Starknet
            </span>{" "}
            TODO List
          </h1>

          <div className="w-full flex mb-8">
            <input
              type="text"
              placeholder="e.g. Watch ZK Cairo tutorial"
              className="flex-1 px-6 py-4 text-base md:text-lg bg-[#161b22] text-white rounded-l-full placeholder-gray-400 focus:outline-none"
              value={input}
              onChange={(e) => setInput(e.target.value)}
            />
            <button
              onClick={addTodo}
              className="px-6 md:px-8 py-4 text-base md:text-lg font-bold bg-gradient-to-r from-[#FC8181] to-[#5C94FF] rounded-r-full hover:opacity-90 transition-all duration-200"
            >
              Add
            </button>
          </div>

          <ul className="space-y-5">
            {todos &&
              todos.map(({ status, text }, index) => (
                <li
                  key={index}
                  className="flex items-center justify-between px-6 py-4 rounded-2xl bg-[#161b22] hover:shadow-lg transition-all duration-300 border border-transparent hover:border-[#5C94FF]"
                >
                  <div
                    className={`flex flex-col sm:flex-row sm:items-center gap-2 sm:gap-4 cursor-pointer ${
                      status == "completed"
                        ? "text-gray-500 line-through"
                        : "text-white font-medium"
                    }`}
                    onClick={() => toggleStatus(index)}
                  >
                    <div className="flex items-center gap-3">
                      <Circle className="text-[#5C94FF] w-5 h-5 shrink-0" />
                      <span className="text-sm md:text-base">{text}</span>
                    </div>

                    <span
                      className={`text-xs py-1 px-3 rounded-full font-semibold ${
                        status == "completed"
                          ? "bg-green-700 text-green-300"
                          : "bg-yellow-700 text-yellow-300"
                      }`}
                    >
                      {status}
                    </span>
                  </div>

                  <button
                    onClick={() => deleteTodo(index)}
                    className="text-gray-400 hover:text-red-500 transition"
                  >
                    <X className="w-5 h-5" />
                  </button>
                </li>
              ))}
          </ul>
        </div>
      </div>
    </div>
  );
}
