-- Nama : STANISLAUS NANI
-- NIM : 22241067
-- TUGAS

-- menggabungkan  database
use undikma_mart;

-- join
-- tampilkan nama pelanggan beserta qty nya
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM  ms_pelanggan_dqlab As mp JOIN tr_penjualan_dqlab AS tp ON mp.kode_pelanggan = tp.kode_pelanggan;

-- join tanpa filtering = cross join
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab tp JOIN ms_pelanggan_dqlab mp 
ON true;

-- INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM  ms_pelanggan_dqlab As mp INNER JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN 
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab tp LEFT OUTER JOIN ms_pelanggan_dqlab mp 
ON tp.kode_pelanggan = mp.kode_pelanggan; 

-- RIGHT OUTHER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab tp RIGHT OUTER JOIN ms_pelanggan_dqlab mp 
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN untuk 3 tabel
-- TAMPILKAN NMA PELANGGAN,KATEGORIPELANGGAN YANG DI BELI, NAMA PRODUK DAN QTY BELANJANYA
SELECT tp.kode_pelanggan, mp.nama_pelanggan, 
mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab mp 
LEFT OUTER JOIN tr_penjualan_dqlab tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab mpd
ON mpd.kode_produk = tp.kode_produk;

-- ORDER BY pada JOIN
-- mengurutkan hasil JOIN berdasarkan qty
SELECT tp.kode_pelanggan, mp.nama_pelanggan, 
mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab mp 
LEFT OUTER JOIN tr_penjualan_dqlab tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;
      
-- GROUPNG DAN FUNSI AGREGASI
-- TAMPILKAN KATEGORI PRODUK, NAMA PRODUK DAN JumLA QTTY yang dihasilkan berdasarkan kategori dan nama prduk
SELECT mpd.kategori_produk , mpd.nama_produk , sum(tp.qty) as qty
FROM ms_pelanggan_dqlab mp 
LEFT OUTER JOIN tr_penjualan_dqlab tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab mpd
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk , mpd.nama_produk
ORDER BY sum(qty) DESC;

-- LATIHAN MANDIRI 
-- MENAMPILKAN 3 TABEL INNER
SELECT tp.kode_pelanggan, mp.nama_pelanggan, 
mpd.kategori_produk , mpd.nama_produk , tp.qty
FROM ms_pelanggan_dqlab mp 
INNER JOIN tr_penjualan_dqlab tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab mpd
ON mpd.kode_produk = tp.kode_produk;
