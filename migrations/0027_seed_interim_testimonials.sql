CREATE TABLE IF NOT EXISTS testimonials (
  id TEXT PRIMARY KEY,
  source TEXT NOT NULL DEFAULT 'manual',
  author_name TEXT NOT NULL,
  rating INTEGER NOT NULL DEFAULT 5,
  review_text TEXT NOT NULL DEFAULT '',
  relative_time TEXT DEFAULT '',
  verified INTEGER NOT NULL DEFAULT 1,
  active INTEGER NOT NULL DEFAULT 1,
  sort_order INTEGER NOT NULL DEFAULT 0,
  image_url TEXT DEFAULT '',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO testimonials (id, source, author_name, rating, review_text, relative_time, verified, active, sort_order) VALUES
('seed-dhanashree', 'manual', 'Dhanashree Maghade', 5, 'If I could give 100 stars I would! Our photographer captured all the magic of our girl''s 2nd birthday, getting a great mixture of candid family shots as well as adorable details of the theme. The photos are SO beautiful, crisp colors and amazing composition. She was a treat to work with and made us feel relaxed in the moment. Recommend Photoshoot too all. Thank you for lovely photos.', '4 months ago', 1, 1, 1),
('seed-neha', 'manual', 'Neha Pandita', 5, 'We had a wonderful experience with the team, the photos and videos are absolutely stunning. Dhruv suggested so many creative ideas for the shoot, and each one worked beautifully. Thank you to Sonia and the whole team for their prompt responses and helpful suggestions; they even brought props for my daughter, which added a delightful charm to the photos. We requested several changes for the Instagram reel, and they listened patiently and implemented everything exactly as we wanted. Thank you for making our daughter''s birthday so memorable by capturing these beautiful moments.', '3 months ago', 1, 1, 2),
('seed-vivek', 'manual', 'Vivek Brundavanam', 5, 'Your photographer Dhruv is very good. He is very professional, and well-behaved. He is very good at his work, and his style of working too. We felt very comfortable shooting with him. He stayed till we were satisfied with every shot. Overall, he is awesome! Your manager Sonia was very professional, and ready to accommodate timings and location of shoot, due to unpredictable weather. Good to have received all the raw data in less than a day, and reel within 2 days. Editing was quick too. I recommend this studio for Goa photoshoots', '2 months ago', 1, 1, 3),
('seed-swaroopkumar', 'manual', 'Swaroopkumar Jadhao', 5, 'Great Quality Photos. Had amazing photoshoot and service was quick and smooth.', '2 months ago', 1, 1, 4),
('seed-vidhee', 'manual', 'Vidhee Goud', 5, 'We had planned to celebrate our baby''s first birthday in Goa. After few searches, I came across impression photography. Since the first interaction Sonia was very cooperative. We had a really pleasant experience with our baby''s first birthday photoshoot. The whole photo session went so smooth. Our photographer Sara captured the moments so well. Everyone in our family loved it.', '3 months ago', 1, 1, 5),
('seed-neeraja', 'manual', 'Neeraja N', 5, 'We found impression photography through Google and it was everything more than what we imagined. We did a photoshoot for our 3 months old baby, and Photographer Sara did an excellent job, she was very patient, quick and creative. She was very good with communication. Post shoot the team was very friendly and the edits were extraordinary. I 100 percent recommend.', '5 months ago', 1, 1, 6),
('seed-nikhil', 'manual', 'Nikhil Kumar', 5, 'We had an amazing experience with this photography studio for our child''s photoshoot! The team was extremely patient and friendly, making our little one feel comfortable throughout. The pictures turned out absolutely beautiful. Highly recommended for kids'' photography!', '6 months ago', 1, 1, 7),
('seed-sushant', 'manual', 'Sushant', 5, 'Top-tier photography and even better service! The team at Impression Photography made us feel so comfortable behind the lens. The photos turned out stunning and were delivered right on time. Highly recommend them for any occasion in Goa!', '7 months ago', 1, 1, 8)
ON CONFLICT(id) DO NOTHING;
