# Backend Guyub

Backend yang sama dengan server kelas `https://guyub.joelmedia.my.id`. Dimulai di Pertemuan 7 (`GET /item`, `POST /item`), ditambah `GET /item/{id}` dan CORS, lalu `PATCH /item/{kode}` di Pertemuan 10. Data disimpan di list, jadi kembali ke lima kartu awal setiap server dimatikan.

## Menjalankan

```bash
cd guyub/backend
python3 -m venv .venv                # Windows: python -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload
```

Buka `http://127.0.0.1:8000/docs`, lalu coba kedua endpoint dengan tombol **Try it out**.

## Tes

```bash
pytest -q
```

| No | Endpoint | Hasil |
|---|---|---|
| 1 | `GET /item` | Daftar item, kode 200 |
| 2 | `GET /item/{id}` | Satu item, kode 200; 404 bila tidak ada |
| 3 | `POST /item` | Item baru dengan `id`, `kode`, `dibuat_pada`, kode 201; 422 bila `judul` kosong atau `poin` bukan angka |
| 4 | `PATCH /item/{kode}` | Mengubah `status` atau `penanggung_jawab`, kode 200; 404 bila kode tidak ada; 422 bila status di luar To Do, In Progress, Review, Done |
