-- Inserciones en la tabla TipoProducto
INSERT INTO TipoProducto (nombre, estado) VALUES ('Teléfono', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Refrigerador', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Laptop', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Televisor', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Tablet', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Smartwatch', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Auriculares', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Cámara', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Consola de videojuegos', true);
INSERT INTO TipoProducto (nombre, estado) VALUES ('Altavoz', true);

-- Inserciones en la tabla Marca
INSERT INTO Marca (nombre, estado) VALUES ('Samsung', true);
INSERT INTO Marca (nombre, estado) VALUES ('LG', true);
INSERT INTO Marca (nombre, estado) VALUES ('Apple', true);
INSERT INTO Marca (nombre, estado) VALUES ('Sony', true);
INSERT INTO Marca (nombre, estado) VALUES ('Huawei', true);
INSERT INTO Marca (nombre, estado) VALUES ('Xiaomi', true);
INSERT INTO Marca (nombre, estado) VALUES ('Bose', true);
INSERT INTO Marca (nombre, estado) VALUES ('Canon', true);
INSERT INTO Marca (nombre, estado) VALUES ('Nintendo', true);
INSERT INTO Marca (nombre, estado) VALUES ('Microsoft', true);

-- Inserciones en la tabla Producto
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Samsung Galaxy S21', 'Smartphone con pantalla AMOLED de 6.2 pulgadas', 799.99, true, 1, 1);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('LG Smart Refrigerator', 'Refrigerador inteligente con pantalla táctil y conexión WiFi', 1599.99, true, 2, 2);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Apple MacBook Pro', 'Laptop con chip M1 de 13 pulgadas', 1299.99, true, 3, 3);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Sony Bravia 55"', 'Televisor 4K UHD con HDR y Android TV', 999.99, true, 4, 4);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Huawei MatePad Pro', 'Tablet con pantalla 10.8 pulgadas y procesador Kirin 9000E', 699.99, true, 5, 5);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Xiaomi Mi Smartwatch', 'Smartwatch con pantalla AMOLED de 1.39 pulgadas', 199.99, true, 6, 6);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Bose QuietComfort 35', 'Auriculares inalámbricos con cancelación de ruido', 349.99, true, 7, 7);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Canon EOS R6', 'Cámara mirrorless de 20.1 MP y grabación 4K', 2499.99, true, 8, 8);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Nintendo Switch OLED', 'Consola de videojuegos híbrida con pantalla OLED de 7 pulgadas', 349.99, true, 9, 9);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Microsoft Xbox Series X', 'Consola de videojuegos 4K UHD con SSD de 1TB', 499.99, true, 9, 10);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Apple iPhone 13', 'Smartphone con chip A15 Bionic y pantalla Super Retina XDR', 999.99, true, 1, 3);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('LG InstaView Refrigerator', 'Refrigerador con tecnología InstaView Door-in-Door', 1899.99, true, 2, 2);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Samsung Galaxy Tab S7', 'Tablet con pantalla de 11 pulgadas y 120Hz de refresco', 649.99, true, 5, 1);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Sony WH-1000XM4', 'Auriculares con cancelación de ruido y hasta 30 horas de batería', 299.99, true, 7, 4);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Huawei P40 Pro', 'Smartphone con cámara Ultra Vision Leica de 50MP', 899.99, true, 1, 5);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Bose SoundLink Revolve', 'Altavoz portátil con sonido de 360 grados', 199.99, true, 10, 7);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Xiaomi Mi 11', 'Smartphone con pantalla AMOLED de 6.81 pulgadas y 120Hz de refresco', 749.99, true, 1, 6);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Sony Alpha a7 III', 'Cámara mirrorless de fotograma completo con sensor de 24.2MP', 1999.99, true, 8, 4);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Microsoft Surface Laptop 4', 'Laptop de 13.5 pulgadas con procesador Intel Core i5', 999.99, true, 3, 10);
INSERT INTO Producto (nombre, descripcion, precioVenta, estado, idTipoProducto, idMarca) 
VALUES ('Nintendo Switch Lite', 'Consola portátil de videojuegos con pantalla de 5.5 pulgadas', 199.99, true, 9, 9);

-- Inserciones en la tabla ImagenProducto (rutas como enlaces de imágenes)
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/samsung_galaxy_s21.jpg', 'Samsung Galaxy S21', 1);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/lg_smart_fridge.jpg', 'LG Smart Refrigerator', 2);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/macbook_pro_m1.jpg', 'Apple MacBook Pro', 3);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/sony_bravia_tv.jpg', 'Sony Bravia TV', 4);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/huawei_matepad_pro.jpg', 'Huawei MatePad Pro', 5);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/xiaomi_smartwatch.jpg', 'Xiaomi Mi Smartwatch', 6);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/bose_qc35.jpg', 'Bose QuietComfort 35', 7);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/canon_eos_r6.jpg', 'Canon EOS R6', 8);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/nintendo_switch_oled.jpg', 'Nintendo Switch OLED', 9);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/xbox_series_x.jpg', 'Microsoft Xbox Series X', 10);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/iphone_13.jpg', 'Apple iPhone 13', 11);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/lg_instaview_fridge.jpg', 'LG InstaView Refrigerator', 12);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/samsung_tab_s7.jpg', 'Samsung Galaxy Tab S7', 13);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/sony_wh1000xm4.jpg', 'Sony WH-1000XM4', 14);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/huawei_p40_pro.jpg', 'Huawei P40 Pro', 15);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/bose_soundlink.jpg', 'Bose SoundLink Revolve', 16);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/xiaomi_mi_11.jpg', 'Xiaomi Mi 11', 17);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/sony_alpha_a7.jpg', 'Sony Alpha a7 III', 18);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/surface_laptop_4.jpg', 'Microsoft Surface Laptop 4', 19);
INSERT INTO ImagenProducto (ruta, nombre, idProducto) 
VALUES ('https://example.com/images/nintendo_switch_lite.jpg', 'Nintendo Switch Lite', 20);
