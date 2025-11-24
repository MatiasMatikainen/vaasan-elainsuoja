
const express = require("express");
const router = express.Router();
const db = require("./db");

router.post("/adoptions", async (req, res) => {
  const { animal_id, applicant_name, applicant_email, applicant_phone, message } =
    req.body;

  const animal = await db.query("SELECT * FROM animals WHERE id=$1", [animal_id]);
  if (!animal.rows.length)
    return res.status(404).json({ error: "Animal not found" });

  if (animal.rows[0].status !== "vapaa")
    return res.status(400).json({ error: "Already adopted" });

  await db.query(
    "INSERT INTO adoptions (animal_id, applicant_name, applicant_email, applicant_phone, message) VALUES ($1,$2,$3,$4,$5)",
    [animal_id, applicant_name, applicant_email, applicant_phone, message]
  );

  await db.query("UPDATE animals SET status='adoptoitu' WHERE id=$1", [animal_id]);

  res.json({ success: true, message: "Adoption completed" });
});

module.exports = router;
