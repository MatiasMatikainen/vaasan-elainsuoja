import React from "react";
import { Routes, Route, Link } from "react-router-dom";
import Home from "./pages/Home";
import Animal from "./pages/Animal";
import AdoptSuccess from "./pages/AdoptSuccess";
import "./styles.css";

export default function App() {
  return (
    <div className="layout">
      <header>
        <Link to="/">
          <h1>Vaasan Eläinsuoja</h1>
        </Link>
      </header>

      <main className="content">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/animal/:id" element={<Animal />} />
          <Route path="/success" element={<AdoptSuccess />} />
        </Routes>
      </main>

      <footer className="footer">
        <p>
          © {new Date().getFullYear()} Vaasan Eläinsuoja ry – Kaikki oikeudet pidätetään
        </p>
      </footer>
    </div>
  );
}