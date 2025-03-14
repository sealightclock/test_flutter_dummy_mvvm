class MyStringModel {
  final String value;

  MyStringModel(this.value);

  Map<String, dynamic> toJson() => {'value': value};

  factory MyStringModel.fromJson(Map<String, dynamic> json) {
    return MyStringModel(json['value'] ?? '');
  }
}
