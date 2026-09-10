INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Wedding','',0,'',1,0,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Wedding');
INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Pre-Wedding','',0,'',1,1,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Pre-Wedding');
INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Birthday','',0,'',1,2,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Birthday');
INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Family','',0,'',1,3,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Family');
INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Beach','',0,'',1,4,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Beach');
INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Portfolio','',0,'',1,5,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Portfolio');
INSERT INTO services(id,title,description,price,image_url,active,sort_order,instagram_hashtags)
SELECT lower(hex(randomblob(16))),'Maternity','',0,'',1,6,'' WHERE NOT EXISTS(SELECT 1 FROM services WHERE title='Maternity');
