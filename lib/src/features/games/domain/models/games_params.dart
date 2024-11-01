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
    _data['name'] = name;
    return _data;
  }
}
