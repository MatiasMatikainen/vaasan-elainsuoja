import React, { useEffect, useState } from "react";
import AnimalCard from "../components/AnimalCard";

export default function Home() {
  const [animals, setAnimals] = useState([]);

  useEffect(() => {
    fetch("http://localhost:4000/animals")
      .then(r => r.json())
      .then(setAnimals);
  }, []);

  return (
    <div className="animal-list">
      {animals.map(a => (
        <AnimalCard key={a.id} animal={a} />
      ))}
    </div>
  );
}