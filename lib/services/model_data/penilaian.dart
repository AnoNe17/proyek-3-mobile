class Penilaian {
  final String? nama_lingkup,
      kd_indikator,
      indikator,
      nilai_ceklis,
      nilai_anekdot,
      nilai_hasil_karya;

  Penilaian(
      {this.nama_lingkup,
      this.kd_indikator,
      this.indikator,
      this.nilai_ceklis,
      this.nilai_anekdot,
      this.nilai_hasil_karya});

  factory Penilaian.fromJson(Map<String, dynamic> json) {
    return Penilaian(
      nama_lingkup: json['nama_lingkup'],
      kd_indikator: json['kd_indikator'],
      indikator: json['indikator'],
      nilai_ceklis: json['nilai_ceklis'],
      nilai_anekdot: json['nilai_anekdot'],
      nilai_hasil_karya: json['nilai_hasil_karya'],
    );
  }
}
