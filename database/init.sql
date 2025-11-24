
CREATE TABLE IF NOT EXISTS animals (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  age INT,
  breed TEXT,
  description TEXT,
  image_url TEXT,
  status TEXT DEFAULT 'vapaa'
);

INSERT INTO animals (name, type, age, breed, description, image_url)
VALUES
('Misu', 'kissa', 3, 'eurooppalainen lyhytkarva', 'Rauhallinen ja ystävällinen.', NULL),
('Roki', 'koira', 5, 'labradorinnoutaja', 'Iloinen ja energinen.', NULL),
('Nipsu', 'kissa', 1, 'sekarotu', 'Leikkisä pentu.', NULL);

CREATE TABLE IF NOT EXISTS adoptions (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  applicant_name TEXT,
  applicant_email TEXT,
  applicant_phone TEXT,
  message TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
