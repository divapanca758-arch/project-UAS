import os

# 1. CLASS DATA: Menyimpan atribut objek
class MahasiswaData:
    def __init__(self, nama, nilai):
        self.nama = nama
        self.nilai = nilai

# 2. CLASS PROCESS: Logika untuk mengolah data (Menambah data ke list)
class MahasiswaProcess:
    def __init__(self):
        self.daftar_mahasiswa = []

    def tambah_data(self, nama, nilai):
        # Membuat objek baru dari class data dan menyimpannya
        baru = MahasiswaData(nama, nilai)
        self.daftar_mahasiswa.append(baru)

# 3. CLASS VIEW: Menangani interaksi pengguna (Input dan Tampilan)
class MahasiswaView:
    def form_input(self):
        print("\n--- Form Input Data Mahasiswa ---")
        try:
            nama = input("Masukkan Nama : ")
            if not nama.strip():
                raise ValueError("Nama tidak boleh kosong!")
            
            nilai = int(input("Masukkan Nilai: "))
            if nilai < 0 or nilai > 100:
                raise ValueError("Nilai harus berada di rentang 0-100!")
            
            return nama, nilai
        except ValueError as e:
            print(f"Kesalahan Input: {e}")
            return None

    def cetak_tabel(self, daftar):
        print("\n" + "="*35)
        print(f"{'No':<3} | {'Nama Mahasiswa':<18} | {'Nilai':<5}")
        print("-" * 35)
        
        if not daftar:
            print(f"{'':<3} | {'Data Kosong':<18} | {'':<5}")
        else:
            for i, mhs in enumerate(daftar, 1):
                print(f"{i:<3} | {mhs.nama:<18} | {mhs.nilai:<5}")
        
        print("="*35)

# FUNGSI UTAMA (Modular Orchestration)
def main():
    # Inisialisasi objek dari masing-masing kelas
    proses = MahasiswaProcess()
    view = MahasiswaView()

    while True:
        # Mengambil input dari view
        inputan = view.form_input()
        
        if inputan:
            # Mengolah input ke process
            nama, nilai = inputan
            proses.tambah_data(nama, nilai)
        
        tanya = input("\nTambah data lagi? (y/n): ").lower()
        if tanya != 'y':
            break
    
    # Menampilkan hasil akhir dalam bentuk tabel
    view.cetak_tabel(proses.daftar_mahasiswa)

if __name__ == "__main__":
    main()
