class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final String semester;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.semester,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      semester: json['semester'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama' : nama,
      'nim' : nim,
      'email' : email,
      'jurusan' : jurusan,
      'semester' : semester
    };
  }
}