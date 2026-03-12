import 'package:project/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaModel(
        nama: 'Nabil Hakim',
        nim: '12345678',
        email: 'nabil.hakim@mail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2024'
      ),
      MahasiswaModel(
        nama: 'Ahmad Kunto',
        nim: '12345678',
        email: 'ahmad.kunto@mail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021'
      ),
      MahasiswaModel(
        nama: 'Dudung Andana',
        nim: '12345678',
        email: 'dudung.andana@mail.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
      ),
    ];
  }
}