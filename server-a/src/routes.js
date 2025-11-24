
const express = require("express");
const router = express.Router();
const db = require("./db");
const axios = require("axios");
const { SERVER_B_URL } = require("./config");

// GET animals
router.get("/animals", async (req, res) => {
  const { rows } = await db.query("SELECT * FROM animals ORDER BY id");
  res.json(rows);
});

// GET one
router.get("/animals/:id", async (req, res) => {
  const { id } = req.params;
  const { rows } = await db.query("SELECT * FROM animals WHERE id=$1", [id]);
  if (!rows.length) return res.status(404).json({ error: "Not found" });
  res.json(rows[0]);
});

// ADOPT
router.post("/animals/:id/adopt", async (req, res) => {
  const { id } = req.params;

  const animal = await db.query("SELECT * FROM animals WHERE id=$1", [id]);
  if (!animal.rows.length)
    return res.status(404).json({ error: "Animal not found" });

  if (animal.rows[0].status !== "vapaa")
    return res.status(400).json({ error: "Already adopted" });

  try {
    const result = await axios.post(`${SERVER_B_URL}/adoptions`, {
      animal_id: id,
      ...req.body
    });
    res.json(result.data);
  } catch (e) {
    res.status(500).json({ error: "Failed to adopt" });
  }
});

module.exports = router;
