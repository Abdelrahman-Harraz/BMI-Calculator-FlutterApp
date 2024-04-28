class BmiModel {
  final String id;
  final double weight;
  final double height;
  final int age;
  final double bmi;
  final DateTime timestamp;

  BmiModel(
      {required this.id,
      required this.weight,
      required this.height,
      required this.age,
      required this.bmi,
      required this.timestamp});

  factory BmiModel.fromJson(Map<String, dynamic> json, String id) {
    return BmiModel(
      id: id,
      weight: json['weight'] ?? 0.0,
      height: json['height'] ?? 0.0,
      age: json['age'] ?? 0,
      bmi: json['bmi'] ?? 0.0,
      timestamp: json['timestamp'].toDate(),
    );
  }
}
