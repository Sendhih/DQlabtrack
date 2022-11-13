--  Contoh komunikasi SQL
--  Terdapat dua kategori dari interaksi SQL: 

--  Data Definition Language (DDL), yaitu berbagai perintah yang berfungsi lebih kepada memanipulasi struktur database, seperti Membuat (CREATE), meubah (ALTER), dan menghapus (DROP) struktur penyimpanan data, yaitu database, table, kolom dan tipe data.
--  Data Manipulation Language (DML), yaitu berbagai perintah yang digunakan untuk Menyisipkan data (INSERT), Mengambil data atau query (SELECT), Meubah data (UPDATE) dan Menghapus data (DELETE).

--  Berikut adalah satu contoh query atau perintah untuk mengambil data:


 SELECT nama_produk FROM ms_produk;
 

--  Dengan perintah tersebut, sistem database akan mengerti bahwa ‘dia’ harus menampilkan data ‘nama_produk’ dari suatu tabel yang namanya ‘ms_produk’ seperti berikut.

 

--  nama_produk                        
--  ------------------------------------
--  Kotak Pensil DQLab                 
--  Flashdisk DQLab 64 GB              
--  Gift Voucher DQLab 100rb           
--  Flashdisk DQLab 32 GB              
--  Gift Voucher DQLab 250rb           
--  Pulpen Multifunction + Laser DQLab 
--  Tas Travel Organizer DQLab         
--  Gantungan Kunci DQLab              
--  Buku Planner Agenda DQLab          
--  Sticky Notes DQLab 500 sheets      
 

--  Terlihat ada sepuluh nama peralatan kantor dengan label DQLab yang ditampilkan. Ini menunjukkan bahwa interaksi antara SQL dan sistem database telah berjalan dengan baik.

--  Mengambil Seluruh Kolom dalam suatu Tabel
-- “Jadi, bagaimana cara mengakses data dari database, Nja? Soalnya sejauh aku mencoba, aku sudah dapat hak akses tapi tidak paham cara membuka maupun mengakses tabel dan data dari database.”

-- Aku akhirnya menyampaikan kendalaku pada Senja.

-- “Untuk mengakses data di database, kita dapat menggunakan SELECT statement. Pada SELECT statement kita menyatakan kolom - kolom mana saja yang ingin kita tampilkan dari suatu tabel di database. SELECT statement tidak berdiri sendiri. Setelah menyatakan kolom - kolom yang ingin ditampilkan, kita melanjutkan dengan FROM. Di FROM inilah kita menyatakan dari tabel mana data yang ingin kita tampilkan berada. SELECT… FROM… adalah statement paling sederhana di SQL, dan merupakan bagian utama dari query. Kita tidak bisa meng-query data tanpa menggunakan statement ini,” jelas Senja.

-- Senja juga menunjukkan padaku Query dasar dan sederhana perintah SELECT yang berfungsi untuk menampilkan seluruh kolom, sebagai berikut:



-- Kata awal, yaitu SELECT digunakan untuk menginformasikan kepada sistem bahwa kita ingin mengambil data. 
-- Tanda * (bintang) artinya seluruh kolom perlu diambil dari tabel yang dirujuk. Tanda ini sering juga disebut sebagai wildcard.
-- FROM [NAMA_TABLE], artinya table yang akan diambil datanya.
-- Tanda ; (titik koma) adalah tanda yang menyatakan akhir dari perintah SELECT atau SQL lain.
 

-- Senja mengajak aku untuk langsung mempraktekkan perintah SQL SELECT untuk menampilkan data pada tabel yang bernama ms_produk. 



-- Jika aku menjalankan tombol RUN, maka aku akan mendapatkan tabel seperti berikut: 

-- take it all coloumn
SELECT * fROM ms_produk;

-- take 1 coloumn
SELECT nama_produk FROM ms_produk;

-- Take over 2 coloumn
SELECT nama_produk, harga FROM ms_produk;

-- Membatasi Pengambilan Jumlah Row Data
SELECT nama_produk, harga FROM ms_produk LIMIT 5;

-- Penggunaan SELECT DISTINCT statement
SELECT DISTICNT nama_customer, alamat FROM ms_pelanggan;

-- Prefix, dimana kita akan menambahkan nama tabel di depan nama kolom.
-- Alias, dimana kita memberikan alias atau nama lain untuk tabel maupun kolom.

-- Menggunakan Prefix pada Nama Kolom
-- “Agar kamu lebih jelas, saya coba praktikkan untuk kamu ya, Aksara.  Pertama, kita mulai dengan menggunakan prefix pada kolom. Pada dasarnya, penulisan nama kolom yang lengkap perlu mencantumkan nama tabel di depan nama kolom tersebut, dengan tanda penyambung berupa tanda titik. Umumnya, jika kita hanya mengambil kolom dari satu tabel, prefix ini jarang digunakan karena sudah jelas dari tabel mana kolom itu berasal. Tetapi ketika kita mengambil data dari dua tabel, misalnya dengan menggabungkan 2 tabel menggunakan JOIN, dan terdapat 2 kolom dengan nama yang sama, maka penggunaan prefix menjadi penting untuk menghindari error karena ambiguitas,” jelas Senja panjang lebar.
SELECT ms_produk.kode_produk FROM ms_produk

-- Menggunakan Alias pada Kolom
-- alias (AS) tidak bisa digunakan untuk (*)
SELECT no_urut AS nomor, nama_produk AS nama FROM ms_produk;

-- Menghilangkan Keyword 'AS'
SELECT no_urut nomor, nama_produk nama FROM ms_produk;

-- Menggabungkan Prefix dan Alias
SELECT ms_produk.harga AS harga_jual FROM ms_produk;

-- Menggunakan Alias pada Tabel
SELECT * FROM ms_produk AS t2;
-- tidak menggunakan AS
SELECT * FROM ms_produk t2;

-- Prefix dengan Alias Tabel (t2 is prefix)
SELECT t2.nama_produk, t2.harga FROM ms_produk t2;

-- Menggunakan WHERE  
SELECT * FROM ms_produk WHERE nama_produk = 'Tas Travel Organizer DQlab';

-- Menggunakan Operand OR (Running when 1 condition True)
SELECT * FROM ms_produk WHERE nama_produk = 'Gantungan Kunci DQlab' or nama_produk = 'Tas Travel Organizer DQLab' or nama_produk = 'Flashdisk DQlab 64 GB';

-- Filter untuk Angka
SELECT * FROM ms_produk WHERE harga > 50000;

-- Menggunakan Operand AND (Running when 2 condition is true )
SELECT * FROM ms_produk WHERE nama_produk = 'Gantungan Kunci DQlab' AND harga < 50000;

-- Proyek dari Cabang A
-- “Jadi, apakah kamu bisa menyiapkan data transaksi penjualan dengan total revenue >= IDR 100.000? 

-- Format datanya yang akan kamu tampilkan adalah: kode_pelanggan, nama_produk, qty, harga, dan total, serta diurutkan mulai dari total revenue terbesar,” pinta Senja padaku.

 

-- Kalau kasusnya seperti ini, berarti aku perlu meng-query data tersebut dari tabel tr_penjualan yang terdapat di database perusahaan.

-- Aku dapat melakukan

-- perkalian antara kolom qty dan harga untuk memperoleh total revenue setiap kode pelanggan yang dinyatakan ke dalam kolom total, dan
-- menggunakan “ORDER BY total DESC” pada akhir query untuk mengurutkan data.
SELECT kode_pelanggan, nama_produk, qty, harga, qty * harga AS total 
FROM tr_penjualan 
WHERE qty * harga >= 100000 
ORDER BY total DESC;