-- Tugas Praktek
SELECT * FROM ms_item_kategori;
SELECT * FROM ms_item_warna;

-- JOIN
-- Hal pertama yang perlu dilakukan sebelum menggabungkan kedua tabel adalah mengidentifikasi kolom mana dari kedua tabel yang memiliki kecocokan atau memiliki informasi yang sama. Coba  kita perhatikan data dari kedua tabel ms_item _warna dan ms_item_kategori berikut
-- Dari rangkaian pembahasan sebelumnya, dapat disimpulkan bahwa kedua tabel tersebut memiliki hubungan/relasi yaitu pada kolom nama_barang (tabel ms_item_warna) dan kolom nama_item (tabel ms_item_kategori) karena banyak kecocokan dari isi data.

--  Kedua kolom ini untuk selanjutnya disebut sebagai kolom kunci atau key columns.

-- Menggabungkan Tabel dengan Key Columns

-- Penggabungan dua tabel menjadi satu tabel baru menggunakan query SELECT pada subbab sebelumnya dilakukan dengan cara berikut:

-- menuliskan dua nama tabel yang akan digunakan dengan dipisahkan operator koma (,).
-- menuliskan pasangan key columns dengan penghubung operator sama dengan (=) di bagian filter atau kondisi.
 
-- SELECT * FROM ms_item_kategori;
-- SELECT * FROM ms_item_warna;
-- Cara join seperti ini disebut dengan cara join menggunakan operator koma
-- Dari tabel hasil penggabungan terlihat bahwa baris data yang muncul hanyalah baris data yang isi datanya terdapat di kedua key columns, dan data yang isinya cocok untuk kedua tabel jumlahnya hanya enam dari total delapan baris data yang ada. Sedangkan baris data yang berisi belimbing, jamur, apel dan daun bawang, tidak terdapat di kedua tabel, sehingga baris data ini akan di-exclude dan tidak akan muncul di tabel hasil penggabungan.
-- Bagaimana jika urutan Tabel diubah?
-- Jika akan mengubah urutan tabel di bagian FROM pada query inner join, maka hanya urutan kolom saja yang berubah tetapi isi data dan jumlah data tidak berubah.
-- inner join dengan 
SELECT * FROM ms_item_warna, ms_item_kategori
WHERE nama_barang = nama_item;

-- Menggunakan Prefix Nama Tabel (merubah urutan tabel / column dengan prefix alias)
SELECT ms_item_kategori.*, ms_item_warna.*
FROM ms_item_warna, ms_item_kategori
WHERE nama_barang = nama_item;

-- Penggabungan Tanpa Kondisi (cross join) 
syntax : SELECT * FROM table1, tabl12
SELECT * FROM ms_item_kategori, ms_item_warna;

-- Inner join terjadi jika kedua tabel digabungkan melalui kolom kunci atau key column. Syarat penggabungan adalah dimana Isi data dari key column tabel yang satu harus dapat dicocokkan dengan isi data dari key column tabel yang lain.

-- Sedangkan cross join terjadi dari penggabungan tabel tanpa kondisi, dan menghasilkan seluruh penggabungan data seperti proses perkalian.
-- syntax keyword inner join : 
SELECT * FROM table1 inner join table2 On table1.column = table2.column

-- Tugas Praktek: Menggunakan INNER JOIN (1/3)
-- Hasil yang diperoleh dengan penggunaan SELECT … FROM … INNER JOIN … ON …; adalah sama dengan penerapan SELECT … FROM … WHERE …;.
SELECT * FROM ms_item_warna INNER JOIN ms_item_kategori ON ms_item_warna.nama_barang = ms_item_kategori.nama_item;

-- tabel tr_penjualan dan tabel ms_produk
SELECT * FROM tr_penjualan;
SELECT * FROM ms_produk;

-- Tugas Praktek: Menggunakan INNER JOIN (2/3)
SELECT *
FROM tr_penjualan
INNER JOIN ms_produk ON tr_penjualan.kode_produk = ms_produk.kode_produk;

-- query inner join take several column
SELECT tabel1.nama_kolom1, tabel1.nama_kolom2, ..., tabel2.nama_kolom2, .... 
FROM tabel1
INNER JOIN tabel2
ON tabel_1.nama_kolom1 = tabel2.nama_kolom1;
-- Perlu diperhatikan jika menampilkan kolom dengan nama yang sama di kedua tabel, maka pada bagian Select, tidak bisa hanya mengetikkan nama kolom saja, tetapi juga harus didahului oleh prefix nama tabel dimana kolom itu berasal untuk menghindari error karena ambiguitas," Senja mengingatkanku sekali lagi.

-- Tugas Praktek: Menggunakan INNER JOIN (3/3)
SELECT tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, tr_penjualan.kode_produk, ms_produk.nama_produk, ms_produk.harga, tr_penjualan.qty, ms_produk.harga * tr_penjualan.qty AS total
FROM tr_penjualan
INNER JOIN ms_produk
ON tr_penjualan.kode_produk = ms_produk.kode_produk;

-- Sesuai dengan syarat untuk penggabungan dengan UNION yang telah dijelaskan tadi bahwa:

-- jumlah kolom tabel_A dan tabel_B adalah sama
-- kolom-kolom pada tabel_A dan tabel_B memiliki tipe data yang sama, dan
-- kolom-kolom pada tabel_A dan tabel_B memiliki urutan posisi yang sama.

-- Tabel yang Akan Digabungkan
SELECT * FROM tabel_A;
SELECT * FROM tabel_B;

-- Menggunakan UNION
SELECT * FROM tabel_A
UNION 
SELECT * FROM tabel_B;

-- Menggunakan UNION dengan Klausa WHERE digunakan dikedua select statement
SELECT * FROM tabel_A
WHERE kode_pelanggan = 'dqlabcust03'
UNION
SELECT * FROM tabel_B
WHERE kode_pelanggan = 'dqlabcust03';

-- Menggunakan UNION dan Menyelaraskan Kolom-Kolomnya.
SELECT CustomerName, ContactName, City, PostalCode 
FROM Customers 
UNION 
SELECT SupplierName, ContactName, City, PostalCode 
FROM Suppliers;
-- Jika terdapat perbedaan nama kolom antara SELECT-statement pertama dan SELECT-statement kedua, maka secara default akan digunakan nama kolom dari SELECT-statement yang pertama.
-- Menggunakan UNION dan Menyelaraskan Kolom-Kolomnya.
--  Kita menggunakan JOIN ketika akan menggabungkan tabel secara horizontal, sehingga hasil join akan memuat kolom - kolom dari kedua atau lebih tabel yang digabungkan. 
-- Pada metode JOIN, penggabungan dilakukan berdasarkan key/kolom tertentu yang terdapat di tabel-tabel yang akan digabungkan dan key/kolom ini memiliki nilai yang saling terkait. Seperti yang terlihat pada gambar, Kolom A dan Kolom E merupakan key/kolom yang saling terkait sehingga kedua tabel dapat digabungkan dengan mencocokan nilai dari kedua kolom ini. Proses JOIN tidak dapat dilakukan jika tidak terdapat key/kolom yang saling terkait di kedua atau lebih tabel yang akan digabungkan.
-- Untuk UNION seperti yang sudah dijelaskan, digunakan ketika ingin menggabungkan tabel secara secara vertikal yaitu menggabungkan baris/row dari dua atau lebih tabel. Tidak seperti JOIN, untuk penggabungan dengan UNION, tidak diperlukan key/kolom yang saling terkait tetapi UNION mensyaratkan bahwa jumlah kolom dari tabel - tabel yang akan digabungkankan adalah sama dan berada diposisi yang sama pula. Berikut ilustrasi penggabungan dengan UNION:
-- -- Pada proses penggabungan UNION, tidak terdapat penambahan kolom tetapi jumlah baris/rows yang akan bertambah. 
-- Pada chapter UNION ini telah dipelajari bagaimana menggabungkan dua tabel secara vertikal (bertambah barisnya). Tentunya ada syarat yang harus dipenuhi oleh kedua tabel yang digabungkan dengan UNION, yaitu:

-- Setiap hasil dari SELECT statement yang akan digabungkan (UNION) memiliki jumlah kolom yang sama
-- Kolom tersebut juga harus memiliki tipe data yang sama, dan
-- Kolom tersebut memiliki urutan posisi yang sama.
-- Selain itu, mempelajari bagaimana penyelerasan kolom sehingga record/baris yang ditampilkan pada tabel hasil penggabungan memiliki arti.
-- Perbedaan mendasar dari JOIN dan UNION adalah JOIN menggabungkan 2 tabel atau lebih berdasarkan baris yang saling berelasi/terkait sedangkan UNION menggabungkan 2 tabel secara vertikal. 

-- Project INNER JOIN
SELECT DISTINCT(ms_pelanggan.kode_pelanggan), ms_pelanggan.nama_customer, ms_pelanggan.alamat
FROM ms_pelanggan
INNER JOIN tr_penjualan
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE tr_penjualan.nama_produk = 'Kotak Pensil DQLab' or tr_penjualan.nama_produk = 'Flashdisk DQLab 32 GB' or tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets';

-- Project UNION
SELECT nama_produk, kode_produk, harga FROM ms_produk_1
WHERE harga < 100000
UNION 
SELECT nama_produk, kode_produk, harga FROM ms_produk_2
WHERE harga < 50000; 

-- IS NULL is a condition in SQL that returns true when the value is NULL and false otherwise