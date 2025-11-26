
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
('Misu', 'kissa', 3, 'eurooppalainen lyhytkarva',
 'Rauhallinen ja ystävällinen.',
 'https://images.unsplash.com/photo-1668013712600-7fb9c3e91109?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

('Roki', 'koira', 5, 'labradorinnoutaja',
 'Iloinen ja energinen.',
 'https://images.unsplash.com/photo-1537204696486-967f1b7198c8?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

('Nipsu', 'kissa', 1, 'sekarotu',
 'Leikkisä pentu.',
 'https://images.unsplash.com/photo-1680924726448-9f499055fb88?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

('Bella', 'koira', 2, 'sekarotu',
 'Söpö ja seurallinen.',
 'https://plus.unsplash.com/premium_photo-1676389281623-bb714b527b50?q=80&w=772&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

('Max', 'koira', 4, 'saksanpaimenkoira',
 'Valpas ja uskollinen.',
 'https://images.unsplash.com/photo-1555573710-118d1049ed07?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

CREATE TABLE IF NOT EXISTS adoptions (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  applicant_name TEXT,
  applicant_email TEXT,
  applicant_phone TEXT,
  message TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
