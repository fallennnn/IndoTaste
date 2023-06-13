class Pesanan {
  final int id;
  final int user_id;
  final int product_id;
  final String tanggal;
  final String status;
  final int jumlah;
  final int jumlah_harga;

  const Pesanan({
    required this.id,
    required this.user_id,
    required this.product_id,
    required this.tanggal,
    required this.status,
    required this.jumlah,
    required this.jumlah_harga,
  });

  factory Pesanan.fromJson(Map<String, dynamic> json) {
    return Pesanan(
      id: json['id'],
      user_id: json['user_id'],
      product_id: json['product_id'],
      tanggal: json['tanggal'],
      status: json['status'],
      jumlah: json['jumlah'],
      jumlah_harga: json['jumlah_harga'],
    );
  }
}
