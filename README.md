# Backend as a Service (BaaS) dengan CI/CD GitHub Actions, Self-Hosted Runner, GHCR, Docker, dan Caddy di Google Cloud VPS

Layanan Backend as a Service (BaaS) menggunakan PocketBase. Seluruh sistem dikemas dengan Docker, dikelola melalui GitHub Actions, dan dijalankan pada VPS Google Cloud. Tujuan utamanya adalah menciptakan proses pengembangan dan deployment yang otomatis, aman, serta minim intervensi manual.

Proses dimulai ketika terdapat perubahan kode pada branch utama GitHub. GitHub Actions secara otomatis menjalankan proses build dan mengemas aplikasi menjadi Docker Image yang bersifat portabel dan konsisten. Setelah proses build selesai, image tersebut dikirim ke GitHub Container Registry (GHCR) sebagai repositori penyimpanan terpusat untuk kebutuhan distribusi dan versioning aplikasi.

Pada tahap deployment, sistem menggunakan Self-Hosted Runner yang berjalan langsung di dalam VPS Google Cloud. Berbeda dengan metode tradisional yang mengandalkan akses SSH dari luar, runner ini secara aktif terhubung ke GitHub dan menunggu instruksi deployment. Ketika terdapat versi baru, runner akan menarik image terbaru dari GHCR dan memperbarui layanan secara otomatis. Pendekatan ini meningkatkan keamanan karena VPS tidak perlu membuka akses masuk yang tidak diperlukan dari internet.

Setelah aplikasi berjalan, Caddy berfungsi sebagai reverse proxy yang menerima seluruh lalu lintas dari internet. PocketBase tetap berada di jaringan internal dan tidak dapat diakses secara langsung oleh pengguna. Caddy meneruskan permintaan ke aplikasi serta secara otomatis mengelola sertifikat SSL/TLS, sehingga seluruh komunikasi data berlangsung melalui koneksi yang aman dan terenkripsi.
