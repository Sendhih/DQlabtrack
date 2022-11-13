-- Fungsi skalar dalam SQL digunakan untuk mengembalikan nilai tunggal (single value) dari suatu nilai input yang diberikan, sedangkan fungsi agregat dalam SQL digunakan untuk melakukan perhitungan pada sekelompok nilai dan kemudian mengembalikan nilai tunggal. Nah, biar lebih mudah dipahami mari kita bahas dan praktekkan fungsi-fungsi dari kedua kategori ini.

-- Fungsi Skalar Matematika - ABS() return the absolute value
SELECT StudentId, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) AS MarkGrowth FROM students;

-- Fungsi Skalar Matematika - CEILING() return the largest value e.g 7.5 output 8
SELECT StudentId, FirstName, LastName, CEILING(semester1) as Semester1, CEILING(semester2) AS Semester2, MarkGrowth FROM students;

-- Fungsi Skalar Matematika - FLOOR() return the smallest value
SELECT StudentID, FirstName, LastName, FLOOR(semester1) AS Semester1, FLOOR(semester2) AS Semester2, MarkGrowth FROM students;

-- Fungsi Skalar Matematika - ROUND() membulatkan angka koma jika 6,5 kita round(col, 2) outputnya jadi 6,50 jika ( , 1) hasilnya tdk berupa jika (, 0) hasilnya akan 7
--  jika 6,78 kita round(col , 1) pasti akan menghasilkan 6,8
SELECT StudentId, FirstName, LastName, ROUND(semester1,1) AS Semester1, ROUND(semester2,0) AS Semester2, MarkGrowth FROM students;


-- Fungsi Skalar Matematika - SQRT( ) mengembalikan nilai kuadrat e.g sqrt(144) output 12
SELECT StudentId, FirstName, LastName, SQRT(semester1) AS Semester1, SQRT(semester2) AS Semester2, MarkGrowth FROM students;

-- Practice MOD(col, mau bagi brp) sisa bagi, exp() exponen
SELECT StudentId, FirstName, LastName, MOD(Semester1, 2) as Semester1, Semester2, EXP(MarkGrowth) From Students;

-- Fungsi Text - CONCAT( ) menggabungkan args 
SELECT StudentId, CONCAT(FirstName, LastName) AS Name, Semester1, Semester2, MarkGrowth FROM students;

-- Fungsi Text - SUBSTRING_INDEX( )
-- Keterangan:

    --  column --> merupakan nama kolom yang akan dipecah text-nya,

    --  delimiter --> karakter atau gabungan beberapa karakter untuk pemecah text pada kolom bersangkutan,

    --  index_to_return --> indeks dari pecahan text yang akan diambil.
SELECT StudentID, SUBSTRING_INDEX(Email, '@', 1) AS Name FROM students;

-- Fungsi Text - SUBSTR( )

-- Keterangan:

--      columnName --> nama kolom yang akan dicari substring-nya

--      Start Index --> indeks dari text yang dimiliki (dimulai dari 1)

--      Number of string to be extract --> jumlah karakter atau beberapa karakter yang akan diambil.

SELECT StudentID, SUBSTR(FirstName, 2, 3) AS Initial FROM students;

-- Fungsi Text - LENGTH( )
SELECT StudentID, FirstName, LENGTH(FirstName) as Total_Char FROM students;

-- -- Fungsi Text - REPLACE( )
-- Keterangan:

--      ColumnName --> nama kolom yang akan diganti isi tiap record/barisnya berdasarkan string/karakter tertentu

--      Character/String to be change --> string/karakter yang dimiliki untuk diganti

--      New String/Character --> string/karakter baru pengganti string/karakter sebelumnya

SELECT StudentID, Email, REPLACE(Email, 'yahoo', 'gmail') AS New_Email FROM students;

-- Tugas Praktek
SELECT StudentID, UPPER(FirstName) as FirstName, LOWER(LastName) as LastName FROM students;

-- Fungsi Aggregate
-- Fungsi Aggregate - SUM()
SELECT SUM(Semester1) as Total_1, SUM(Semester2) as Total_2 FROM students;

-- Fungsi Aggregate - COUNT() menghitung row    
SELECT COUNT(FirstName) as Total_Student FROM students;

-- Fungsi Aggregate - AVG( )
SELECT AVG(Semester1) as AVG_1, AVG(Semester2) as AVG_2 FROM students;

-- Tugas Praktek
SELECT MIN(Semester1) as Min1, MAX(Semester1) as Max1, MIN(Semester2) as Min2, MAX(Semester2) as Max2 FROM students;

-- Pengenalan GROUP BY
-- Hal penting yang perlu diperhatikan adalah: 

-- GROUP BY digunakan dengan SELECT, artinya kolom yang digunakan di GROUP BY statement, juga perlu ditempatkan di SELECT.
-- GROUP BY ditempatkan setelah WHERE, tetapi jika tidak menggunakan WHERE maka langsung ditempatkan setelah FROM. 
-- Jika menggunakan ORDER BY, maka GROUP BY ditempatkan sebelum ORDER BY. 

--  “Apakah kita bisa menggunakan group by untuk mengelompokkan data menggunakan 2 kriteria atau 2 kolom, Nja?” tanyaku penasaran.

--   “Tentu saja bisa. Group by bisa dilakukan dengan single column ataupun multiple column. Seperti ini contohnya:”

-- Group by Single Column, data dikelompokkan menggunakan kriteria dari satu kolom saja, misalnya mengelompokkan data berdasarkan provinsi saja. 
-- Group by Multiple Column, data dikelompokkan menggunakan kriteria dari dua kolom atau lebih, misalnya mengelompokkan data berdasarkan province dan brand.

-- Group by Single Column   
SELECT province,
COUNT(DISTINCT order_id) as total_order,
SUM(item_price) as total_price
FROM sales_retail_2019
GROUP BY province;

-- Group by Multiple Column
SELECT province, brand,
COUNT(DISTINCT order_id) as total_order,
SUM(item_price) as total_price FROM sales_retail_2019
GROUP BY province, brand;

-- Fungsi Aggregate dengan Grouping
SELECT province, COUNT(DISTINCT order_id) as total_unique_order,
SUM(item_price) as revenue FROM sales_retail_2019
GROUP BY province;

-- Penggunaan CASE … WHEN….
-- SELECT ColumnName1, ColumnName2,  
-- CASE  
--     WHEN condition1 THEN result1  
--     WHEN condition2 THEN result2  
--     WHEN conditionN THEN resultN  
--     ELSE result  
-- END as alias  
-- FROM TableName; 

-- Tugas Praktek
SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
CASE  
    WHEN SUM(item_price) >= 30000000000 THEN 'Target Achieved'
    WHEN SUM(item_price) <= 25000000000 THEN 'Less Performed'
    ELSE 'Follow Up'
END as remark
FROM sales_retail_2019
GROUP BY MONTH(order_date);

-- Proyek Pekerjaan - Analisis Penjualan Part 1
## 1. Total jumlah seluruh penjualan (total/revenue).
SELECT SUM(total) as total 
FROM tr_penjualan;
## 2. Total quantity seluruh produk yang terjual.
SELECT SUM(qty) as qty 
FROM tr_penjualan;
## 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, SUM(qty) as qty, SUM(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;

-- Proyek Pekerjaan - Analisis Penjualan Part 2
## 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
## 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low' 
    ELSE 'Medium'  
END as kategori
FROM tr_penjualan;

-- yeay finish 