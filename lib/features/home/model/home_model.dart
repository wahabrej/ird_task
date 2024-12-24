class Topdata {
  final String title;
  final String location;
  final String distance;
  final String imageUrl;
  final String nobedroom;
  final String nobathroom;

  Topdata({
    required this.title,
    required this.location,
    required this.distance,
    required this.imageUrl,
    required this.nobedroom,
    required this.nobathroom,
  });

  factory Topdata.fromJson(Map<String, dynamic> json) {
    return Topdata(
      title: json['title'],
      location: json['location'],
      distance: json['distance'] ?? '',
      imageUrl: json['imageUrl'],
      nobedroom: json['nobedroom'],
      nobathroom: json['nobathroom'],
    );
  }
}