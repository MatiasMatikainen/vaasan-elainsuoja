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
-- 1
('Misu', 'kissa', 3, 'eurooppalainen lyhytkarva',
 'Rauhallinen ja ystävällinen.',
 'https://images.unsplash.com/photo-1668013712600-7fb9c3e91109?q=80&w=627&auto=format&fit=crop'),

-- 2
('Roki', 'koira', 5, 'labradorinnoutaja',
 'Iloinen ja energinen.',
 'https://images.unsplash.com/photo-1537204696486-967f1b7198c8?q=80&w=774&auto=format&fit=crop'),

-- 3
('Nipsu', 'kissa', 1, 'sekarotu',
 'Leikkisä pentu.',
 'https://images.unsplash.com/photo-1680924726448-9f499055fb88?q=80&w=627&auto=format&fit=crop'),

-- 4
('Bella', 'koira', 2, 'sekarotu',
 'Söpö ja seurallinen.',
 'https://plus.unsplash.com/premium_photo-1676389281623-bb714b527b50?q=80&w=772&auto=format&fit=crop'),

-- 5
('Max', 'koira', 4, 'saksanpaimenkoira',
 'Valpas ja uskollinen.',
 'https://images.unsplash.com/photo-1555573710-118d1049ed07?q=80&w=774&auto=format&fit=crop'),

-- 6
('Luna', 'kissa', 2, 'maine coon',
 'Suurikokoinen mutta lempeä ja seurallinen.',
 'https://images.unsplash.com/photo-1606213651356-0272cc0becd2?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

-- 7
('Koda', 'koira', 1, 'bordercollie',
 'Älykäs ja energinen, tarvitsee paljon aktiviteettia.',
 'https://images.unsplash.com/photo-1612698827824-9e7965ec8185?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

-- 8
('Muru', 'kissa', 4, 'sekarotu',
 'Hellyydenkipeä sisäkissa, rakastaa rapsutuksia.',
 'https://images.unsplash.com/photo-1680924883806-ff30ff09aabf?q=80&w=942&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

-- 9
('Rex', 'koira', 6, 'rottweiler',
 'Suojelunhaluinen mutta rauhallinen ja hyvin koulutettu.',
 'https://images.unsplash.com/photo-1673474025690-eacc81e21daa?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

-- 10
('Papu', 'kissa', 1, 'brittiläinen lyhytkarva',
 'Pehmeä ja pyöreä pentu, joka on aina utelias.',
 'https://images.unsplash.com/photo-1629624467541-f73ef8f12df2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnJpdGlzaCUyMHNob3J0aGFpciUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D')
;

CREATE TABLE IF NOT EXISTS adoptions (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  applicant_name TEXT,
  applicant_email TEXT,
  applicant_phone TEXT,
  message TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
