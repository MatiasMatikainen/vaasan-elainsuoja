import React from "react";
import { Link } from "react-router-dom";

export default function AnimalCard({ animal }) {
  return (
    <div style={{
      border: "1px solid #ccc",
      padding: 16,
      borderRadius: 8,
      width: 250
    }}>
      <img src={animal.image_url || "https://via.placeholder.com/200"} 
           alt={animal.name}
           style={{ width: "100%", borderRadius: 8 }} />
      <h3>{animal.name}</h3>
      <p>{animal.type} – {animal.age} v</p>
      <Link to={`/animal/${animal.id}`}>Katso lisää</Link>
    </div>
  );
}
