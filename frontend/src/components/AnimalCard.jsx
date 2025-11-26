import React from "react";
import { Link } from "react-router-dom";

export default function AnimalCard({ animal }) {
  return (
    <div className="animal-card">
      <img
        src={animal.image_url || "https://via.placeholder.com/200"}
        alt={animal.name}
      />
      <h3>{animal.name}</h3>
      <p>{animal.type} – {animal.age} v</p>

      <Link to={`/animal/${animal.id}`}>
        Katso lisää
      </Link>
    </div>
  );
}