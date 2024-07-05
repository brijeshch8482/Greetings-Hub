
class InvitationsHomeData {
  final String color1;
  final String color2;
  final String name;
  final String url;

  InvitationsHomeData({
    required this.color1,
    required this.color2,
    required this.name,
    required this.url,

  });

  factory InvitationsHomeData.fromJson(Map<String, dynamic> json) {
    return InvitationsHomeData(
      color1: json['color1'],
      color2: json['color2'],
      name: json['name'],
      url: json['url'],
    );
  }
}
