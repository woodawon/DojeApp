class Anim {
  String title;
  List<String> value;

  Anim({required this.title, required this.value});
  Anim.fromMap(Map<String, dynamic> map)
    : title = map['title'],
    value = map['value'];
}