class Anim {
  String title;
  List<int> value;

  Anim({required this.title, required this.value});
  Anim.fromMap(Map<String, dynamic> map)
    : title = map['title'],
    value = map['value'];
}