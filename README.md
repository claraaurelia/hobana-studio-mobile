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
### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- StatelessWidget adalah widget yang tidak memiliki state atau keadaan yang dapat berubah selama aplikasi berjalan. Artinya, data atau tampilan widget ini tetap sama setelah pertama kali dibangun. Jika ingin memperbarui tampilannya, widget tersebut perlu dibuat ulang atau diganti dengan widget baru. Contoh stateless widget adalah label yang tidak berubah, icon yang tidak memiliki interaksi, serta gambar statis.
- StatefulWidget adalah widget yang memiliki state atau keadaan yang dapat berubah selama aplikasi berjalan. Data atau tampilan widget ini bisa diperbarui berdasarkan interaksi pengguna atau peristiwa lain. Untuk membuat StatefulWidget, diperlukan dua kelas:
    - Kelas StatefulWidget itu sendiri.
    - Kelas State yang mengelola dan menyimpan status widget tersebut.
    Contoh penggunannya adalah tombol yang berubah warna saat ditekan dan formulir input yang memperbaharui data saat pengguna mengetik.


### 2.  Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
#### A) Widget Umum
- MaterialApp. Merupakan widget utama untuk aplikasi Flutter yang menggunakan Material Design. MaterialApp menyediakan berbagai konfigurasi dasar seperti tema, judul aplikasi, serta pengaturan routing halaman. Dalam kode ini, MaterialApp digunakan sebagai pembungkus aplikasi utama dengan tema warna primarySwatch dan halaman awal yang diatur ke MyHomePage.
- Scaffold. Struktur dasar untuk halaman yang memiliki elemen standar seperti AppBar, Body, dan FloatingActionButton. Scaffold membantu menyusun elemen UI aplikasi dengan mudah. Dalam kode ini, Scaffold digunakan untuk memberikan struktur halaman dengan AppBar dan Body.
- AppBar. Widget yang biasanya berada di bagian atas halaman, berfungsi sebagai tempat untuk menampilkan judul dan aksi penting. Pada kode ini, AppBar menampilkan judul "Hobana Studio" dan mengikuti warna tema utama aplikasi.
- Padding. Menambahkan ruang atau jarak di sekitar widget yang dibungkusnya. Padding digunakan untuk memberikan ruang di sekitar Column utama dalam body agar tidak menempel pada tepi layar.
- Column. Menyusun widget secara vertikal. Dalam kode ini, Column menyusun widget Row, SizedBox, Center, dan GridView.count secara berurutan ke bawah.
- Row. Menyusun widget secara horizontal.
- SizedBox. Menyisipkan ruang kosong atau jarak antar widget.
- Icon. Menampilkan ikon dari pustaka ikon Flutter.
- SnackBar. Notifikasi yang muncul sementara di bagian bawah layar untuk memberikan informasi kepada pengguna. Dalam kode ini, SnackBar ditampilkan ketika pengguna menekan salah satu tombol pada ItemCard. Dan masih ada beberapa widget lainnya
#### B) Widget Custom (Buatan Sendiri)
- InfoCard. Widget custom yang menampilkan informasi statis seperti NPM, Nama, dan Kelas. InfoCard terdiri dari Card, Container, Column, dan Text untuk menyusun informasi dengan rapi. 
- ItemHomePage. Bukan sebuah widget, melainkan sebuah kelas model yang berfungsi sebagai representasi data untuk setiap item di beranda (ItemCard). Setiap ItemHomepage berisi nama item, ikon, dan warna.
- ItemCard. Widget custom yang menampilkan setiap item pada halaman utama, dengan ikon, teks, dan latar belakang berwarna. ItemCard menggunakan beberapa widget seperti Material, InkWell, Container, Icon, dan Text.

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
- setState() adalah fungsi dalam Flutter yang digunakan dalam widget Stateful untuk memperbarui tampilan aplikasi ketika terjadi perubahan data atau state. Ketika setState() dipanggil, Flutter akan menandai widget yang bersangkutan agar dibangun ulang (rebuild), sehingga perubahan data dapat ditampilkan pada UI.

#### Fungsi setState()
- setState() memberi tahu Flutter bahwa ada perubahan data yang memerlukan pembaruan tampilan.
- Saat dipanggil, Flutter menjalankan ulang metode build() dari widget tersebut, yang akan merefleksikan perubahan data pada UI.
- Hanya widget yang berada dalam kelas Stateful (dan bukan Stateless) yang bisa menggunakan setState(), karena setState() bergantung pada manajemen state yang dapat berubah.

#### Variabel yang terdampak
- Variabel penghitung atau numerik lainnya: Misalnya int counter, yang digunakan untuk menampilkan nilai dinamis.
- Variabel boolean: Misalnya bool isVisible untuk menampilkan atau menyembunyikan elemen tertentu.
- List atau Map: Misalnya, List<String> items untuk menambah atau menghapus elemen dari daftar tampilan.
- Variabel String atau tipe data lain: Misalnya, String title untuk memperbarui teks atau label.
- Nilai input pengguna: Data yang didapat dari pengguna, seperti teks dari TextField.

### 4.  Jelaskan perbedaan antara const dengan final.
- Di Dart, const dan final adalah kata kunci untuk mendeklarasikan variabel yang tidak dapat diubah, tetapi ada perbedaan penting di antara keduanya.
- const menetapkan nilai pada saat compile-time, artinya nilai harus sudah diketahui sebelumnya dan bersifat deeply immutable, sehingga seluruh objek dan sub-objeknya juga konstan.
- Sebaliknya, final menetapkan nilai pada saat run-time dan mencegah variabel diubah setelah inisialisasi pertama, tetapi jika variabel tersebut adalah objek, properti di dalamnya tetap bisa diubah.
    - Dalam Flutter, const sering digunakan pada widget statis untuk optimasi memori, karena objek const yang identik hanya dibuat sekali di memori (canonicalized), sementara final digunakan untuk variabel yang nilai akhirnya diketahui pada run-time dan tidak berubah setelahnya.
</details>

<details>
<summary> Tugas Individu 8: Flutter Navigation, Layouts, Forms, and Input Elements </summary>
Nama    : Clara Aurelia Setiady <br>
NPM     : 2306217304 <br>
Kelas   : PBP C     <br>

## Proses implementasi Checklist
### 1. Membuat halaman formulir tambah item baru dengan ketentuan (memakai min tiga elemen input [name, amount, description]), memiliki sebuah tombol Save, setiap element input formulir harus divalidasi [setiap elemen input tidak boleh kosong, setiap elemen input harus berisi data dengan tipe data atribut modelnya, perhatikan juga case-case seperti angkat negatif, dll]
- Kode mengenai hal ini kebanyakan tercantum di page `productentry_form.dart`. Pada file ini, kode membangun halaman formulir di Flutter untuk menambahkan produk baru dengan tiga elemen input utama: nama produk (_nama), deskripsi produk (_description), dan harga produk (_price). Formulir ini menggunakan widget StatefulWidget bernama ProductEntryFormPage yang memiliki state dikelola oleh kelas _ProductEntryFormPageState. Tujuannya adalah untuk menangani input data produk, memvalidasi input, dan menyimpan data dengan tombol "Save".

Formulir menggunakan GlobalKey<FormState>() sebagai kunci global untuk validasi input pada elemen formulir. Setiap input diwakili oleh TextFormField yang memiliki properti decoration untuk menampilkan label dan hint teks agar pengguna memahami jenis data yang harus dimasukkan. Pada setiap input, terdapat validator yang memastikan data sesuai aturan. Untuk input nama produk, validasi memeriksa apakah input tidak kosong, memiliki panjang minimal 3 karakter, dan maksimal 50 karakter. Pada input deskripsi produk, validasi memeriksa agar input tidak kosong dengan panjang minimal 10 karakter dan maksimal 200 karakter. Sedangkan input harga menggunakan keyboardType: TextInputType.number untuk membatasi input menjadi angka, dan validasi memastikan nilainya tidak kosong, berupa angka, serta lebih besar dari nol.

Pengelolaan state dilakukan menggunakan metode setState() di dalam fungsi onChanged, yang memperbarui nilai variabel state (_nama, _description, dan _price) setiap kali pengguna mengubah input. Hal ini memastikan data yang dimasukkan selalu sinkron dengan state aplikasi.

Tombol "Save" pada formulir dibuat menggunakan ElevatedButton. Ketika tombol ditekan, form divalidasi dengan metode _formKey.currentState!.validate(). Jika semua input valid, maka dialog konfirmasi ditampilkan menggunakan showDialog(). Dialog tersebut berisi detail data produk yang berhasil disimpan, ditampilkan menggunakan widget AlertDialog. Setelah dialog ditutup, form akan direset dengan memanggil _formKey.currentState!.reset(), mengosongkan semua input untuk mempersiapkan input berikutnya. Kode ini memperlihatkan bagaimana Flutter memanfaatkan fitur form bawaan untuk membuat proses input yang aman, terstruktur, dan interaktif dengan umpan balik yang jelas kepada pengguna.

### 2. Mengarahkan pengguna ke halaman form tambah item ketika menekan tombol "Tambah Item"
Untuk mengarahkan pengguna ke halaman form tambah item ketika tombol "Tambah Produk" ditekan, kode ini memanfaatkan Navigator.push() pada widget yang berinteraksi dengan pengguna. Navigasi ke halaman formulir dilakukan dengan memeriksa nilai routeKey dari ItemHomepage. Jika routeKey memiliki nilai 'addProduct', kode akan memanggil Navigator.push() untuk membuka halaman ProductEntryFormPage.

Komponen utama yang menangani klik pada item adalah ItemCard. ItemCard dilengkapi dengan GestureDetector yang menangkap event klik dan memanggil fungsi onTap. Fungsi ini memeriksa apakah item yang ditekan memiliki routeKey yang sesuai untuk menavigasi ke halaman form. Dalam hal ini, jika tombol "Tambah Produk" ditekan, pengguna diarahkan ke halaman ProductEntryFormPage dengan menggunakan MaterialPageRoute. Pendekatan ini menjaga navigasi tetap modular dan memisahkan logika navigasi dari elemen presentasi, memungkinkan alur yang lebih bersih dan terorganisir dalam aplikasi.


### 3. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop up setelah menekan tombol Save
Kode ini utamanya terdapat di file `productentry_form.dart`. Kode ini berfokus pada memunculkan data yang diisi dalam formulir sebagai pop-up (dialog) setelah pengguna menekan tombol "Save" dan semua data berhasil divalidasi. Formulir terdiri dari tiga input utama: nama produk (_nama), deskripsi produk (_description), dan harga produk (_price). Setelah pengguna mengisi semua data dan menekan tombol "Save", kode memeriksa apakah semua input valid menggunakan _formKey.currentState!.validate().

Jika validasi berhasil, showDialog() akan dipanggil untuk menampilkan sebuah AlertDialog. Dialog ini berfungsi sebagai pop-up yang menampilkan data yang telah diisi pengguna dalam formulir, termasuk nama produk, deskripsi, dan harga. Informasi tersebut ditampilkan di dalam widget Column yang disusun secara vertikal untuk menunjukkan rincian produk. Tombol "OK" pada dialog memungkinkan pengguna untuk menutup dialog dan secara otomatis mereset formulir menggunakan _formKey.currentState!.reset().

Dengan pendekatan ini, kode memberikan umpan balik langsung kepada pengguna tentang data yang telah diisi dan memastikan pengguna mendapatkan konfirmasi bahwa data telah berhasil dimasukkan sebelum kembali ke tampilan awal atau mengisi data baru. Hal ini meningkatkan pengalaman pengguna dengan memberi kepastian atas tindakan yang mereka lakukan.


### 4. Membuat sebuah drawer pada aplikasi (min memiliki dua buah opsi, "halaman utama" dan "tambah item")
Bagian ini terletak pada file left_drawer.dart. Kode ini membangun sebuah drawer pada aplikasi menggunakan widget Drawer di Flutter. Drawer berfungsi sebagai navigasi samping yang menyediakan opsi bagi pengguna untuk beralih ke halaman yang berbeda dengan cepat. Dalam hal ini, drawer memiliki dua opsi utama: "Halaman Utama" dan "Tambah Produk".

Drawer diimplementasikan dengan ListView yang menampilkan item navigasi (ListTile). Bagian atas drawer ditandai dengan DrawerHeader yang menampilkan judul "Hobana Studio" beserta subteks deskriptif "Ayo belanja setiap hari disini!" yang dirancang untuk menarik perhatian pengguna. DrawerHeader memiliki latar belakang berwarna yang disesuaikan dengan skema warna utama aplikasi.

Opsi pertama, "Halaman Utama", diwakili oleh ListTile dengan ikon rumah (Icons.home_outlined). Ketika opsi ini diklik, Navigator.pushReplacement digunakan untuk mengganti halaman saat ini dengan halaman beranda (MyHomePage). Navigator.pushReplacement memastikan bahwa halaman sebelumnya tidak tetap berada dalam tumpukan navigasi, memberikan pengalaman transisi yang bersih dan langsung.

Opsi kedua, "Tambah Produk", memiliki ikon mood (Icons.mood) dan memungkinkan pengguna untuk menavigasi ke halaman formulir tambah produk (ProductEntryFormPage). Navigasi dilakukan dengan cara serupa, menggunakan Navigator.pushReplacement untuk mengganti halaman saat ini.

Dengan desain ini, drawer berfungsi sebagai elemen navigasi yang ramah pengguna, menyediakan akses cepat ke fitur utama aplikasi dengan minimal dua opsi. Hal ini memastikan pengalaman pengguna yang terorganisir dan efisien dalam menjelajahi aplikasi.


## Menjawab pertanyaan
### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
#### Kegunaan dann Keuntungan Penggunaan Const di Flutter
- *Pengoptimalan performa*. Dengan menggunakan const, Flutter dapat menghindari pembuatan objek baru jika objek tersebut sudah ada. Ini berarti jika widget yang sama dengan nilai yang sama digunakan di berbagai tempat dalam widget tree, Flutter hanya akan menggambar satu instance objek tersebut.
- *Memori yang efisien*. Karena objek const tidak dapat diubah, mereka dapat dibagikan dan digunakan ulang di berbagai tempat dalam aplikasi. Hal ini mengurangi penggunaan memori, karena tidak perlu membuat banyak instance dari objek yang sama.
- *Lebih mudah dalam debugging*. Menandai objek sebagai const memberi tahu developer lain bahwa objek tersebut tidak akan berubah. Ini membantu dalam pemahaman kode dan debugging.

#### Kapan sebaiknya menggunakan const?
- Jika diketahui bahwa widget tersebut tidak akan berubah, seperti ikon statis atau teks yang tidak akan berubah, penggunaan const sangat dianjurkan.
- Jika widget dihasilkan dari data yang tidak berubah (seperti daftar konstanta), const sangat baik untuk menggunakan 

#### Kapan sebaiknya tidak menggunakan const?
- Jika widget bergantung pada data yang dapat berubah, seperti hasil dari API atau input pengguna, sebaiknya tidak menggunakan const. Contoh kasus ini adalah:
-  Jika widget digunakan dalam konteks yang bisa berubah (misalnya, dalam StatefulWidget), sebaiknya tidak menggunakan const pada widget tersebut.

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
#### Column
Widget Column digunakan untuk menyusun anak-anaknya dalam bentuk vertikal. Setiap anak akan ditata satu di atas yang lain. Keuntungannya:
- Memungkinkan penempatan widget secara vertikal.
- Bisa diatur agar anak-anaknya mengisi ruang yang tersedia dengan parameter seperti `mainAxisAlignment` dan `crossAxisAlignment`.
Contoh implementasi:
```
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('Hello'),
    Text('World'),
    ElevatedButton(onPressed: () {}, child: Text('Click Me')),
  ],
)
```
Pada contoh di atas, tiga widget (dua teks dan satu tombol) ditata secara vertikal, di tengah sumbu utama dan di sebelah kiri sumbu silang.

#### Row
Widget Row digunakan untuk menyusun anak-anaknya dalam bentuk horizontal. Setiap anak akan ditata satu di samping yang lain. Keuntungannya:
- Memungkinkan penempatan widget secara horizontal.
- Seperti Column, bisa diatur menggunakan parameter `mainAxisAlignment` dan `crossAxisAlignment`.
Contoh
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Icon(Icons.home),
    Text('Home'),
    ElevatedButton(onPressed: () {}, child: Text('Go')),
  ],
)
```
Di contoh ini, ada ikon, teks, dan tombol yang ditata secara horizontal. Semua widget berada di tengah sumbu silang dan memiliki jarak yang sama antar elemen.

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form yang saya buat, elemen input yang digunakan adalah:

- TextFormField untuk input nama produk (_nama).
- TextFormField untuk input deskripsi produk (_description).
- TextFormField untuk input harga produk (_price), dengan keyboardType yang disesuaikan agar hanya menerima input berupa angka.

Elemen input lainnya dari Flutter yang tidak digunakan dalam tugas ini mencakup:
- Checkbox: Untuk input nilai boolean (ya/tidak).
- Switch: Berfungsi serupa dengan checkbox tetapi dengan gaya visual yang berbeda.
- Radio Button: Untuk pilihan eksklusif dari beberapa opsi.
- DropdownButton: Untuk memilih satu opsi dari menu dropdown.
- Slider: Untuk input nilai numerik atau range dengan menggeser slider.

Saya tidak menggunakan elemen-elemen ini karena fokus formulir adalah input teks untuk nama, deskripsi, dan angka untuk harga produk. Elemen-elemen seperti checkbox, radio button, atau dropdown dapat digunakan jika ada kebutuhan untuk memilih opsi dari sejumlah pilihan atau untuk pengaturan lainnya.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
1.  Di dalam kelas MyApp, ThemeData diatur menggunakan colorScheme untuk menentukan skema warna. Kode berikut menunjukkan cara tema ditetapkan:
```
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
  ).copyWith(secondary: Colors.deepPurple[400]),
),

```
2. Penggunaan Tema pada Komponen: Beberapa widget menggunakan tema ini untuk menjaga konsistensi warna di seluruh aplikasi, seperti AppBar, DrawerHeader, ElevatedButton, dan Card. Contoh penerapannya:
```
backgroundColor: Theme.of(context).colorScheme.primary,
```
```
backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),

```
3. Inheritan Tema. Setiap komponen menggunakan `Theme.of(context).colorScheme` untuk mengakses warna-warna dari tema yang telah ditetapkan di `main.dart`, memastikan bahwa perubahan pada `ThemeData` akan berlaku untuk semua elemen yang menggunakannya.

Dengan cara ini, aplikasi secara konsisten mengikuti skema warna yang sama di semua halaman dan komponen, yang memberikan pengalaman visual yang seragam dan memudahkan pengelolaan warna jika ingin mengubah skema warna di masa depan.


### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Pada aplikasi Flutter, navigasi antara halaman dapat ditangani dengan menggunakan kelas Navigator dan MaterialPageRoute. Berikut adalah cara menangani navigasi pada aplikasi dengan banyak halaman di Flutter:
1. Menggunakan `Navigator.push` dan `Navigator.pushReplacement`. Navigator memungkinkan kita untuk menambahkan (push) halaman baru di atas halaman yang sedang aktif. `Navigator.pushReplacement` menggantikan halaman saat ini dengan halaman baru tanpa menambahkan halaman baru ke dalam tumpukan navigasi, sehingga tidak dapat kembali ke halaman sebelumnya. Contoh penggunaan:
```
onTap: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ),
  );
},
```

2. Membuat Route pada `MaterialPageRoute`. `MaterialPageRoute` digunakan untuk mendefinisikan halaman baru yang akan ditampilkan. `builder` dalam `MaterialPageRoute` mendefinisikan widget yang akan dirender sebagai halaman baru; Contoh penggunaan:
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ProductEntryFormPage(),
  ),
);
```

3. Navigasi Berdasarkan Kondisi: Pada ItemCard, ada navigasi yang ditentukan berdasarkan nama item. Contoh penggunaan:
```
if (item.name == "Tambah Produk") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProductEntryFormPage(),
    ),
  );
}
```
</details>

<details>
<summary> Tugas Individu 9: Integrasi Layanan Web Django dengan Aplikasi Flutter </summary>
Nama    : Clara Aurelia Setiady <br>
NPM     : 2306217304 <br>
Kelas   : PBP C     <br>

## Proses implementasi Checklist
### 1. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter, membuat halaman login pada proyek flutter, dan mengintegrasikan sistem autentikasi django dengan proyek tugas Flutter
#### Kode ini memodifikasi proyek Django dan proyek Flutter. Terdapat aplikasi baru yaitu autentikasi pada proyek Django yang nantinya akan diintegrasikan dengan proyek Flutter. Backend terdapat pada proyek Django
- Hal pertama yang dilakukan adalah set up autentikasi pada Django setelah itu mengintegrasikannya dengan proyek Flutter, dengan membuat aplikasi baru di proyek Django  bernama `authentication` dan tidak lupa melakukan beberapa steps yang mengikutinya (seperti menambahkan ke INSTALLED_APPS)
    - Setelah itu tidak lupa install `pip install django-cors-headers` yang akan mengizinkan akses antar domain. Tambahkan `corsheaders` ke INSTALLED_APPS dan tambahkan `corsheaders.middleware.CorsMiddleware` ke MIDDELWARE
    - tambahkan beberapa variabel perizinan di `settings.py` dan tambahkan 10.0.2.2 ke ALLOWED_HOSTS untuk emulator Android
    ```
    ...
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ...
    ```
    - Pada proyek Django tersebut, tambahkan metode view untuk login di `authentication/views.py`
    ```
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
    ```

    - Setelah itu buat file `urls.py` pada folder auth dan tambahkan routing
    ```
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]
    ```
    - Pada urls proyek root tambahkan `path('auth/', include('authentication.urls'))`
- Setelah sistem autentikasi dikembangkan di Django, lalu integrasikan dengan sistem autentikasi pada flutter
    - Hal yang dilakukan adalah emndownload package Flutter yang dapat dipakai untuk menyambung ke web service Django (yang sudah disediakan)
     `flutter pub add provider`

### 2. Membuat model kustom sesuai dengan proyek aplikasi Django. 
- Saya mengikuti model yang sudah ditetapkan pada proyek Django sebelumnya dan memastikan menyimpan informasi yan gsama yaitu product_name, product_price, serta product_descriptioin. Model kustom ini akan digunakan untuk menyimpan data produk. Hal ini digunakan pada productentry_form.dart dan product_entry.dart


### 3. Membuat halaman yang berisi daftar semua item yang terdapat pada JSON dan membuat halaman detail untuk setiap item, serta melakukan filter pada halamand aftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang sedang log in
- Pada Django, sudah ditetapkan di function show_json yang sudah disesuaikan dengan user tertentu yang bersangkutan.
- Pada Flutter di page product_detail.dart juga dmenjadi halaman detail untuk setiap item, dimana setiap item dapat ditekan dan user akan didirect ke page detail product dan terdapat juga tombol untuk kembali ke page sebelumnya. Karena atribut dari produk aplikasi ini adalah nama, harga, dan deskripsi, maka ketiga atribut ini lah yang dimunculkan


## Menjawab pertanyaan
### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
-  Membuat model di Django sangat penting untuk pengambilan dan pengiriman data JSON karena model berfungsi sebagai struktur yang mendefinisikan bagaimana data disimpan di database dan bagaimana data tersebut dikirimkan atau diterima dalam format JSON. Dengan menggunakan model, kita dapat dengan mudah memetakan data ke dalam JSON menggunakan Django's serializers, serta memvalidasi dan mengelola data dengan cara yang konsisten. 
Tanpa model, kita akan kesulitan dalam menyimpan, mengambil, dan memvalidasi data secara efisien, serta berisiko mengirimkan atau menerima data yang tidak terstruktur dengan baik, yang dapat menyebabkan inkonsistensi dan kesalahan. Selain itu, model juga memudahkan pengelolaan relasi antar entitas yang ada di aplikasi, seperti menghubungkan produk dengan pengguna. Oleh karena itu, meskipun tidak selalu langsung menyebabkan error, tidak menggunakan model akan membuat pengelolaan data menjadi lebih rumit dan rentan terhadap kesalahan.



### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
- Library http yang diimplementasikan dalam tugas ini berfungsi untuk melakukan komunikasi HTTP antara aplikasi Flutter dengan backend Django. Fungsi utama dari library ini adalah untuk mengirimkan permintaan HTTP (seperti GET, POST, PUT, DELETE) ke server dan menerima respons dari server.

    Pada tugas ini, kita menggunakan HTTP POST untuk mengirimkan data, seperti data produk yang dimasukkan oleh pengguna, ke server Django. Misalnya, saat pengguna mendaftar, login, atau menambahkan produk baru, aplikasi Flutter mengirimkan data dalam format JSON ke backend menggunakan http.post(). Selain itu, library ini juga digunakan untuk melakukan permintaan GET ke server untuk mengambil data produk yang ada di database Django, misalnya saat menampilkan daftar produk di aplikasi Flutter.

    Dengan library ini, aplikasi Flutter dapat berkomunikasi dengan backend Django, mengirimkan data dari frontend, dan menerima data dari backend secara mudah dan efisien. Library http juga memungkinkan kita untuk menangani respons yang diterima dari server, seperti status kode, data JSON, dan pesan kesalahan, yang memungkinkan aplikasi untuk memberikan feedback yang sesuai kepada pengguna.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
- CookieRequest berfungsi untuk menangani permintaan HTTP di Flutter dengan mengelola cookie yang digunakan untuk autentikasi dan sesi pengguna. Cookie ini memungkinkan aplikasi untuk mengirimkan data sesi (seperti token login) pada setiap permintaan HTTP ke backend Django, tanpa perlu login ulang. Dengan menggunakan CookieRequest, aplikasi dapat menjaga konsistensi autentikasi pengguna di seluruh aplikasi, memudahkan pengelolaan sesi, dan memastikan bahwa setiap permintaan dari berbagai komponen aplikasi menggunakan informasi yang sama.

    Membagikan instance CookieRequest ke seluruh aplikasi penting untuk menjaga akses yang konsisten terhadap sesi pengguna. Hal ini memastikan bahwa setiap halaman atau komponen yang membutuhkan autentikasi (misalnya, untuk mengambil data atau menambahkan produk) dapat menggunakan cookie yang relevan, menghindari masalah seperti logout yang tidak diinginkan atau permintaan yang gagal karena kehilangan sesi. Menggunakan state management seperti Provider memungkinkan pengelolaan dan pembagian CookieRequest secara efisien di seluruh aplikasi.


### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
- Pada Flutter, data pertamakali dikumpulkan melalui widget formulir. Ketika user memasukkan data, maka data tersebut kana disimpan dalam variabel lokal (_nama, _price, _description) ketika tombol submit ditekan
- Setelah dimasukkan, Flutter akan mengirimkan data tersebut ke backed menggunakan permintaan HTTP. Menggunakan library seperti http atau pbp_django_auth, aplikasi Flutter mengirim data ke server dengan menggunakan metode POST. Data yang dikirim biasanya dalam format JSON, yang memudahkan pengolahan di server.
- Di sisi server, Django menerima data tersebut dan memprosesnya. Data akan dipetakan ke dalam model yang sesuai (misalnya, model ProductEntry), dan kemudian disimpan ke dalam database. Setelah data berhasil disimpan, Django akan mengirimkan respons kembali ke Flutter, biasanya berupa pesan konfirmasi atau data yang diminta, dalam format JSON.
- Setelah menerima respons dari server, aplikasi Flutter memproses data tersebut (misalnya, untuk konfirmasi atau menampilkan produk yang baru saja ditambahkan). Respons yang diterima akan diubah menjadi objek Dart menggunakan deserialisasi JSON. Data ini kemudian disimpan dalam state atau provider untuk ditampilkan ke pengguna.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Mekanisme autentikasi dimulai dengan pengguna memasukkan data akun pada halaman login atau registrasi di Flutter. Saat pengguna mengisi formulir, data seperti username dan password akan dikirimkan ke server Django menggunakan permintaan HTTP POST. Pada proses registrasi, Django akan memeriksa apakah username sudah terdaftar dan apakah password yang dimasukkan valid, kemudian membuat akun pengguna baru jika semuanya valid.
- Setelah itu, aplikasi Flutter akan menerima respons dari Django yang mengindikasikan bahwa akun berhasil dibuat atau jika terjadi kesalahan. Pada proses login, data login (username dan password) dikirimkan ke Django, yang kemudian memverifikasi kredensial tersebut menggunakan authenticate() dan jika valid, Django akan mengautentikasi pengguna dengan auth_login().
- Jika berhasil, Django akan mengirimkan respons berisi status login dan informasi pengguna (seperti username) yang kemudian disimpan di Flutter, biasanya dalam bentuk cookie atau token. Setelah login berhasil, aplikasi Flutter akan menampilkan menu atau tampilan utama yang sesuai dengan status pengguna yang terautentikasi. Untuk logout, ketika pengguna menekan tombol logout, aplikasi Flutter akan mengirimkan permintaan logout ke Django, yang kemudian menghapus sesi pengguna menggunakan auth_logout(), dan aplikasi Flutter akan menampilkan halaman login lagi. Seluruh proses ini memastikan bahwa hanya pengguna yang terautentikasi yang dapat mengakses fitur atau menu tertentu di aplikasi.

</details>