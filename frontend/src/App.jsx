import React from "react";
import { Routes, Route, Link } from "react-router-dom";
import Home from "./pages/Home";
import Animal from "./pages/Animal";
import AdoptSuccess from "./pages/AdoptSuccess";

export default function App() {
  return (
    <div style={{ fontFamily: 'Arial', padding: 20 }}>
      <Link to="/" style={{ textDecoration: 'none' }}><h1>Vaasan Eläinsuoja – Adoptio</h1></Link>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/animal/:id" element={<Animal />} />
        <Route path="/success" element={<AdoptSuccess />} />
      </Routes>
    </div>
  );
}
