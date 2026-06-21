# Backend as a Service (BaaS) dengan GitHub Actions, Self-Hosted Runner, GHCR, Docker, Caddy, dan RustFS di Google Cloud VPS

Proyek Backend as a Service (BaaS) ini menggunakan PocketBase sebagai backend utama yang menangani autentikasi pengguna, manajemen database, dan penyediaan REST API. Seluruh layanan dijalankan menggunakan Docker di atas Google Cloud VPS untuk memastikan lingkungan yang konsisten, portabel, dan mudah dikelola.

Proses pengembangan dan deployment diotomatisasi menggunakan GitHub Actions sebagai pipeline CI/CD. Setiap perubahan kode yang masuk ke branch utama akan memicu proses build Docker Image secara otomatis. Image yang berhasil dibangun kemudian dipublikasikan ke GitHub Container Registry (GHCR) sebagai repositori terpusat untuk penyimpanan dan distribusi versi aplikasi.

Proses deployment dilakukan melalui Self-Hosted Runner yang berjalan langsung di dalam VPS. Runner ini menerima instruksi dari GitHub Actions untuk menarik (pull) Docker Image terbaru dari GHCR dan memperbarui layanan yang sedang berjalan. Pendekatan ini menghilangkan kebutuhan akses SSH dari luar sehingga meningkatkan keamanan infrastruktur.

Untuk pengelolaan lalu lintas jaringan, sistem menggunakan Caddy sebagai reverse proxy. Caddy menerima seluruh permintaan dari internet, meneruskannya ke layanan Docker yang sesuai, serta secara otomatis mengelola sertifikat SSL/TLS. Dengan demikian, seluruh komunikasi aplikasi berjalan melalui koneksi HTTPS yang aman dan terenkripsi.

Penyimpanan file dipisahkan dari database menggunakan RustFS yang kompatibel dengan protokol S3. Berkas seperti gambar, dokumen, dan media lainnya disimpan di RustFS, bukan di dalam database PocketBase. Arsitektur ini mengurangi beban penyimpanan pada backend utama, meningkatkan performa, serta mempermudah pengelolaan dan skalabilitas penyimpanan data.

Secara keseluruhan, kombinasi PocketBase, Docker, GitHub Actions, GHCR, Self-Hosted Runner, Caddy, dan RustFS menghasilkan platform BaaS yang modern, aman, mudah dipelihara, serta mendukung proses deployment otomatis secara berkelanjutan.
