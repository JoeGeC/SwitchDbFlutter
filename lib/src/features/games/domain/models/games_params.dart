class GamesParams {
  GamesParams({
    required this.name,
  });

  late final String name;

  GamesParams.fromJson(Map<String, dynamic> json){
    name = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['period'] = name;
    return _data;
  }
}
