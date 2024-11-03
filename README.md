# Hobana Studio
<details>
<summary> Tugas Individu 7: Elemen Dasar Flutter </summary>
Nama    : Clara Aurelia Setiady <br>
NPM     : 2306217304 <br>
Kelas   : PBP C     <br>

## Proses mengimplementasikan cheklist-checklist
1. Membuat program Flutter baru
    - Masuk ke direktori untuk menyimpan proyek Flutter baru
    - Generate proyek Flutter baru
        ```
        flutter create hobana_studio
        ```
    - Jalankan proyek
        ```
        flutter run
        ```
    - Untuk merapikan struktur proyek, buat file baru bernama `menu.dart` pada direktori `hobana_studio/lib`. Pada baris pertama import package
        ```
        import 'package:flutter/material.dart';
        ```
    Selanjutnya, dari `main.dart`, pindahkan kode baris ke-39 hingga akhir (class MyHomePage dan _MyHomePageState) ke file `menu.dart` yang baru dibuat. Tidak lupa untuk menambahkan import package di file `main.dart`
        ```
        import 'package:hobana_studio/menu.dart';
        ```
2. Membuat tiga tombol sederhana dengan ikon dan teks untuk melihat daftar produk, menambah produk, dan logout. Setelah itu mengimplementasikan warna-warna yang berbeda untuk setiap tombol dan munculkan snackbar untuk memberitahu bahwa tombol sudah ditekan
    - Pada `main.dart`, ubah kode sesuai dengan warna yang diinginkan
    ```
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
    ).copyWith(secondary: Colors.deepPurple[400]),
    ```
    - Setelah itu, ubah sifat widget menjadi stateless dengan menghapus `const MyHomePage(title: 'Flutter Demo Home Page') menjadi `MyHomePage(),`
    - Mengimplementasikan warna yang berbeda, memunculkan snackbar, hasil akhirnya akan
    ```
    import 'package:flutter/material.dart';

    class MyHomePage extends StatelessWidget {
    final String npm = '2306217304'; // NPM
    final String name = 'Clara Aurelia Setiady'; // Nama
    final String className = 'PBP C'; // Kelas
    MyHomePage({super.key});

    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".

    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.blue),
        ItemHomepage("Tambah Produk", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];

    @override
    Widget build(BuildContext context) {
        // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
        return Scaffold(
        // AppBar adalah bagian atas halaman yang menampilkan judul.
        appBar: AppBar(
            // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
            title: const Text(
            'Hobana Studio',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
            ),
            // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
            backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        // Body halaman dengan padding di sekelilingnya.
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            // Menyusun widget secara vertikal dalam sebuah kolom.
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                // Row untuk menampilkan 3 InfoCard secara horizontal.
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: name),
                    InfoCard(title: 'Class', content: className),
                ],
                ),

                // Memberikan jarak vertikal 16 unit.
                const SizedBox(height: 16.0),

                // Menempatkan widget berikutnya di tengah halaman.
                Center(
                child: Column(
                    // Menyusun teks dan grid item secara vertikal.

                    children: [
                    // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                    const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                        'Welcome to Hobana Studio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                        ),
                        ),
                    ),

                    // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        // Agar grid menyesuaikan tinggi kontennya.
                        shrinkWrap: true,

                        // Menampilkan ItemCard untuk setiap item dalam list items.
                        children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ],
            ),
        ),
        );
    }
    }

    class InfoCard extends StatelessWidget {
    // Kartu informasi yang menampilkan title dan content.

    final String title;  // Judul kartu.
    final String content;  // Isi kartu.

    const InfoCard({super.key, required this.title, required this.content});

    @override
    Widget build(BuildContext context) {
        return Card(
        // Membuat kotak kartu dengan bayangan dibawahnya.
        elevation: 2.0,
        child: Container(
            // Mengatur ukuran dan jarak di dalam kartu.
            width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
            padding: const EdgeInsets.all(16.0),
            // Menyusun title dan content secara vertikal.
            child: Column(
            children: [
                Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(content),
            ],
            ),
        ),
        );
    }
    }

    class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;

        ItemHomepage(this.name, this.icon, this.color);
    }

    class ItemCard extends StatelessWidget {
    final ItemHomepage item;

    const ItemCard(this.item, {super.key});

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color, // Use the color property here
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
            onTap: () {
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                );
            },
            child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
    ```
    - Untuk membuat setiap button berbeda warnanya, saya menambahkan property color di class ItemHomePage dan mendefinisikan colors di setiap item. Selain itu, saya menggunakna Color tersebut dalam ItemCard

## Menjawab pertanyaan
1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- StatelessWidget adalah widget yang tidak memiliki state atau keadaan yang dapat berubah selama aplikasi berjalan. Artinya, data atau tampilan widget ini tetap sama setelah pertama kali dibangun. Jika ingin memperbarui tampilannya, widget tersebut perlu dibuat ulang atau diganti dengan widget baru. Contoh stateless widget adalah label yang tidak berubah, icon yang tidak memiliki interaksi, serta gambar statis.
- StatefulWidget adalah widget yang memiliki state atau keadaan yang dapat berubah selama aplikasi berjalan. Data atau tampilan widget ini bisa diperbarui berdasarkan interaksi pengguna atau peristiwa lain. Untuk membuat StatefulWidget, diperlukan dua kelas:
    - Kelas StatefulWidget itu sendiri.
    - Kelas State yang mengelola dan menyimpan status widget tersebut.
    Contoh penggunannya adalah tombol yang berubah warna saat ditekan dan formulir input yang memperbaharui data saat pengguna mengetik.

2.  Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
    ### 1. Widget Umum
        - MaterialApp. Merupakan widget utama untuk aplikasi Flutter yang menggunakan Material Design. MaterialApp menyediakan berbagai konfigurasi dasar seperti tema, judul aplikasi, serta pengaturan routing halaman. Dalam kode ini, MaterialApp digunakan sebagai pembungkus aplikasi utama dengan tema warna primarySwatch dan halaman awal yang diatur ke MyHomePage.
        - Scaffold. Struktur dasar untuk halaman yang memiliki elemen standar seperti AppBar, Body, dan FloatingActionButton. Scaffold membantu menyusun elemen UI aplikasi dengan mudah. Dalam kode ini, Scaffold digunakan untuk memberikan struktur halaman dengan AppBar dan Body.
        - AppBar. Widget yang biasanya berada di bagian atas halaman, berfungsi sebagai tempat untuk menampilkan judul dan aksi penting. Pada kode ini, AppBar menampilkan judul "Hobana Studio" dan mengikuti warna tema utama aplikasi.
        - Padding. Menambahkan ruang atau jarak di sekitar widget yang dibungkusnya. Padding digunakan untuk memberikan ruang di sekitar Column utama dalam body agar tidak menempel pada tepi layar.
        - Column. Menyusun widget secara vertikal. Dalam kode ini, Column menyusun widget Row, SizedBox, Center, dan GridView.count secara berurutan ke bawah.
        - Row. Menyusun widget secara horizontal.
        - SizedBox. Menyisipkan ruang kosong atau jarak antar widget.
        - Icon. Menampilkan ikon dari pustaka ikon Flutter.
        - SnackBar. Notifikasi yang muncul sementara di bagian bawah layar untuk memberikan informasi kepada pengguna. Dalam kode ini, SnackBar ditampilkan ketika pengguna menekan salah satu tombol pada ItemCard. Dan masih ada beberapa widget lainnya
    ### 2. Widget Custom (Buatan Sendiri)
        - InfoCard. Widget custom yang menampilkan informasi statis seperti NPM, Nama, dan Kelas. InfoCard terdiri dari Card, Container, Column, dan Text untuk menyusun informasi dengan rapi. 
        - ItemHomePage. Bukan sebuah widget, melainkan sebuah kelas model yang berfungsi sebagai representasi data untuk setiap item di beranda (ItemCard). Setiap ItemHomepage berisi nama item, ikon, dan warna.
        - ItemCard. Widget custom yang menampilkan setiap item pada halaman utama, dengan ikon, teks, dan latar belakang berwarna. ItemCard menggunakan beberapa widget seperti Material, InkWell, Container, Icon, dan Text.

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    - setState() adalah fungsi dalam Flutter yang digunakan dalam widget Stateful untuk memperbarui tampilan aplikasi ketika terjadi perubahan data atau state. Ketika setState() dipanggil, Flutter akan menandai widget yang bersangkutan agar dibangun ulang (rebuild), sehingga perubahan data dapat ditampilkan pada UI.

    ### Fungsi setState()
    - setState() memberi tahu Flutter bahwa ada perubahan data yang memerlukan pembaruan tampilan.
    - Saat dipanggil, Flutter menjalankan ulang metode build() dari widget tersebut, yang akan merefleksikan perubahan data pada UI.
    - Hanya widget yang berada dalam kelas Stateful (dan bukan Stateless) yang bisa menggunakan setState(), karena setState() bergantung pada manajemen state yang dapat berubah.

    ### Variabel yang terdampak
    - Variabel penghitung atau numerik lainnya: Misalnya int counter, yang digunakan untuk menampilkan nilai dinamis.
    - Variabel boolean: Misalnya bool isVisible untuk menampilkan atau menyembunyikan elemen tertentu.
    - List atau Map: Misalnya, List<String> items untuk menambah atau menghapus elemen dari daftar tampilan.
    - Variabel String atau tipe data lain: Misalnya, String title untuk memperbarui teks atau label.
    - Nilai input pengguna: Data yang didapat dari pengguna, seperti teks dari TextField.

4.  Jelaskan perbedaan antara const dengan final.
    - Di Dart, const dan final adalah kata kunci untuk mendeklarasikan variabel yang tidak dapat diubah, tetapi ada perbedaan penting di antara keduanya.
    - const menetapkan nilai pada saat compile-time, artinya nilai harus sudah diketahui sebelumnya dan bersifat deeply immutable, sehingga seluruh objek dan sub-objeknya juga konstan.
    - Sebaliknya, final menetapkan nilai pada saat run-time dan mencegah variabel diubah setelah inisialisasi pertama, tetapi jika variabel tersebut adalah objek, properti di dalamnya tetap bisa diubah.
        - Dalam Flutter, const sering digunakan pada widget statis untuk optimasi memori, karena objek const yang identik hanya dibuat sekali di memori (canonicalized), sementara final digunakan untuk variabel yang nilai akhirnya diketahui pada run-time dan tidak berubah setelahnya.
</details>