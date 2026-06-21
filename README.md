# Deploy Backend as a Service (BaaS) dengan PocketBase, GitHub Actions, Self-Hosted Runner, GHCR, Docker, Caddy, dan RustFS di Google Cloud VPS

Proyek Backend as a Service (BaaS) ini menggunakan **PocketBase** sebagai backend utama yang menangani autentikasi pengguna, manajemen database, serta penyediaan REST API. Seluruh layanan dijalankan menggunakan **Docker** di atas Google Cloud VPS untuk memastikan lingkungan yang konsisten, portabel, dan mudah dikelola.

Proses pengembangan dan deployment diotomatisasi menggunakan **GitHub Actions** sebagai pipeline CI/CD. Setiap perubahan pada branch utama akan memicu proses build Docker image secara otomatis. Image yang berhasil dibangun kemudian dipublikasikan ke **GitHub Container Registry (GHCR)** sebagai pusat penyimpanan dan distribusi versi aplikasi.

Proses deployment dijalankan melalui **Self-Hosted Runner** yang terpasang langsung pada VPS. Runner ini menerima instruksi dari GitHub Actions untuk menarik (pull) Docker image terbaru dari GHCR dan memperbarui layanan yang sedang berjalan. Pendekatan ini menghilangkan kebutuhan akses SSH eksternal, sehingga meningkatkan keamanan infrastruktur.

Untuk pengelolaan lalu lintas jaringan, sistem menggunakan **Caddy** sebagai reverse proxy. Caddy menangani seluruh request dari internet, meneruskannya ke layanan Docker yang sesuai, serta secara otomatis mengelola sertifikat SSL/TLS. Dengan demikian, seluruh komunikasi aplikasi berjalan aman melalui HTTPS yang terenkripsi.

Penyimpanan file dipisahkan dari database menggunakan **RustFS** yang kompatibel dengan protokol S3. Berkas seperti gambar, dokumen, dan media disimpan di RustFS, bukan di dalam PocketBase. Arsitektur ini mengurangi beban database utama, meningkatkan performa, serta mempermudah skalabilitas penyimpanan.

Secara keseluruhan, kombinasi **PocketBase, Docker, GitHub Actions, GHCR, Self-Hosted Runner, Caddy, dan RustFS** menghasilkan platform BaaS yang modern, aman, mudah dipelihara, serta mendukung deployment otomatis yang berkelanjutan.
