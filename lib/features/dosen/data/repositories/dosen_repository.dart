import 'package:project/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  /// Mendapatkan Daftar Dosen
  Future<List<DosenModel>> getDosenList() async {
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy dosen
    return [
      DosenModel(
        nama: 'Anank Prasetyo',
        nip: '1234567890',
        email: 'anank.prasetyo@mail.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Rachman Sinatriya',
        nip: '0987654321',
        email: 'rachman.sinatriya@mail.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Alfian Sukma',
        nip: '6789012345',
        email: 'alfian.sukma@mail.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}