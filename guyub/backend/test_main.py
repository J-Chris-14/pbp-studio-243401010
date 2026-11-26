from fastapi.testclient import TestClient

import main

klien = TestClient(main.app)


def test_get_lima_kartu_awal():
    r = klien.get("/item")
    assert r.status_code == 200
    assert [i["kode"] for i in r.json()][:5] == ["GYB-001", "GYB-002", "GYB-003", "GYB-004", "GYB-005"]


def test_get_satu_dan_404():
    assert klien.get("/item/1").json()["judul"] == "Halaman menu roti"
    assert klien.get("/item/999").status_code == 404


def test_post_201_dan_422():
    r = klien.post("/item", json={"judul": "Tombol check-in", "poin": 3})
    assert r.status_code == 201 and r.json()["kode"] == "GYB-006"
    assert klien.post("/item", json={"judul": "", "poin": 3}).status_code == 422
    assert klien.post("/item", json={"judul": "x" * 81, "poin": 3}).status_code == 422
    assert klien.post("/item", json={"judul": "A", "poin": 3, "status": "x"}).status_code == 422
    assert klien.post("/item", json={"judul": "A", "poin": 3, "penanggung_jawab": "x" * 51}).status_code == 422


def test_cors_preflight():
    r = klien.options("/item", headers={"Origin": "http://localhost:54321",
                                        "Access-Control-Request-Method": "POST",
                                        "Access-Control-Request-Headers": "content-type"})
    assert r.status_code == 200 and r.headers["access-control-allow-origin"] == "*"


def test_batas_item():
    main.daftar_item.extend({"id": 0} for _ in range(main.BATAS_ITEM))
    assert klien.post("/item", json={"judul": "Penuh", "poin": 1}).status_code == 403


def test_patch_status_200_404_422():
    r = klien.patch("/item/GYB-004", json={"status": "In Progress"})
    assert r.status_code == 200 and r.json()["status"] == "In Progress"
    assert klien.get("/item/4").json()["status"] == "In Progress"
    r = klien.patch("/item/GYB-004", json={"penanggung_jawab": "Sari"})
    assert r.json()["status"] == "In Progress" and r.json()["penanggung_jawab"] == "Sari"
    assert klien.patch("/item/GYB-999", json={"status": "Done"}).status_code == 404
    assert klien.patch("/item/GYB-004", json={"status": "Selesai"}).status_code == 422
    assert klien.patch("/item/GYB-004", json={"judul": "ganti"}).status_code == 422
