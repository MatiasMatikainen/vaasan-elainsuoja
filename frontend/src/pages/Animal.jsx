import React from "react";
import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";

export default function Animal() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [animal, setAnimal] = useState(null);
  const [form, setForm] = useState({
    applicant_name: "",
    applicant_email: "",
    applicant_phone: "",
    message: ""
  });

  useEffect(() => {
    fetch("http://localhost:4000/animals/" + id)
      .then(r => r.json())
      .then(setAnimal);
  }, [id]);

  const submit = async (e) => {
    e.preventDefault();
    await fetch(`http://localhost:4000/animals/${id}/adopt`, {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(form)
    });
    navigate("/success");
  };

  if (!animal) return <p>Ladataan...</p>;

  return (
    <div className="animal-page">
      <img src={animal.image_url || "https://via.placeholder.com/300"} />
      
      <h2>{animal.name}</h2>
      <p>{animal.type}, {animal.age} vuotta</p>
      <p><b>Rotu:</b> {animal.breed}</p>
      <p style={{ marginBottom: 20 }}>{animal.description}</p>

      {animal.status !== "vapaa" ? (
        <h3 style={{ color: "red" }}>Tämä eläin on jo adoptoitu</h3>
      ) : (
        <form onSubmit={submit}>
          <input
            placeholder="Nimi"
            required
            value={form.applicant_name}
            onChange={(e) => setForm({ ...form, applicant_name: e.target.value })}
          />
          <input
            placeholder="Sähköposti"
            required
            value={form.applicant_email}
            onChange={(e) => setForm({ ...form, applicant_email: e.target.value })}
          />
          <input
            placeholder="Puhelin"
            required
            value={form.applicant_phone}
            onChange={(e) => setForm({ ...form, applicant_phone: e.target.value })}
          />
          <textarea
            placeholder="Viestisi"
            value={form.message}
            onChange={(e) => setForm({ ...form, message: e.target.value })}
          />

          <button type="submit">Adoptoi minut</button>
        </form>
      )}
    </div>
  );
}