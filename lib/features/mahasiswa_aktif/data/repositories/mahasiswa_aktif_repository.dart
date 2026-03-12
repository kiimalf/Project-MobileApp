import 'package:project/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaAktifModel(
        nama: 'Alondonia',
        nim: '12345678',
        email: 'Alondonia@mail.com',
        jurusan: 'Teknik Informatika',
        semester: '1'
      ),
      MahasiswaAktifModel(
        nama: 'Lualue Danant',
        nim: '12345678',
        email: 'lualue.danant@mail.com',
        jurusan: 'Teknik Informatika',
        semester: '3'
      ),
      MahasiswaAktifModel(
        nama: 'Muhammad Jannah',
        nim: '12345678',
        email: 'muhammad.jannah@mail.com',
        jurusan: 'Teknik Informatika',
        semester: '3'
      ),
    ];
  }
}