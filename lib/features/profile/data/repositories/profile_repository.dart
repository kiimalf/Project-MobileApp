import 'package:project/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  Future<List<ProfileModel>> getProfileList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProfileModel(
        nama: 'Muhammad Jannah',
        nim: '12345678',
        email: 'muhammad.jannah@mail.com',
        jurusan: 'Ilmu Hukum',
        ipk: '3.8',
      ),
    ];
  }
}