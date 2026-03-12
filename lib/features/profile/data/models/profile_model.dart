class ProfileModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final String ipk;

  ProfileModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.ipk,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      ipk : json['ipk'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama' : nama,
      'nim' : nim,
      'email' : email,
      'jurusan' : jurusan,
      'ipk' : ipk,
    };
  }
}