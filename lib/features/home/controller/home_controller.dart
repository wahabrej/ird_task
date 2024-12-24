import 'package:get/get.dart';
import 'package:ird_task/core/utils/constants/image_path.dart';

class HomeController extends GetxController {
  var topics = <String>[
    "House",
    "Apartment",
    "Hotel",
    "Villa",
    "Resturent",
    "Corporet",
    "Office",
  ].obs;
  var selectedCategory = 'House'.obs;

  final List<Map<String, String>> cardData = [
    {
      "title": "Dreamsville House",
      "location": "Jl. Sultan Iskandar Muda",
      "distance": "1.8 km",
      "imageUrl": ImagePath.house1,
    },
    {
      "title": "Ascot House",
      "location": "Jl. Cilandak Tengah",
      "distance": "2.5 km",
      "imageUrl": ImagePath.house1,
    },
    {
      "title": "Sunny Villa",
      "location": "Jl. Sunset Boulevard",
      "distance": "3.2 km",
      "imageUrl": ImagePath.house1,
    },
    {
      "title": "Dreamsville House",
      "location": "Jl. Sultan Iskandar Muda",
      "distance": "1.8 km",
      "imageUrl": ImagePath.house1,
    },
    {
      "title": "Ascot House",
      "location": "Jl. Cilandak Tengah",
      "distance": "2.5 km",
      "imageUrl": ImagePath.house1,
    },
    {
      "title": "Sunny Villa",
      "location": "Jl. Sunset Boulevard",
      "distance": "3.2 km",
      "imageUrl": ImagePath.house1,
    },
  ].obs;
  final RxList<TopCourse> topCourses = <TopCourse>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopCourses();
  }

  Future<void> refreshData() async {
    fetchTopCourses();
  }

  void fetchTopCourses() {
    var topCourseData = [
      {
        "title": "Orchard House",
        "location": "Rp 2.500",
        "distance": "Jane Cooper",
        "imageUrl": ImagePath.house2,
        "nobedroom": "6",
        "nobathroom": "4",
      },
      {
        "title": "Luxury Apartment",
        "location": "Rp 3.800",
        "distance": "John Smith",
        "imageUrl": ImagePath.house3,
        "nobedroom": "3",
        "nobathroom": "2",
      },
      {
        "title": "Villa Sunshine",
        "location": "Rp 5.200",
        "distance": "Alice Brown",
        "imageUrl": ImagePath.house2,
        "nobedroom": "8",
        "nobathroom": "6",
      },
      {
        "title": "Orchard House",
        "location": "Rp 2.500",
        "distance": "Jane Cooper",
        "imageUrl": ImagePath.house2,
        "nobedroom": "6",
        "nobathroom": "4",
      },
      {
        "title": "Luxury Apartment",
        "location": "Rp 3.800",
        "distance": "John Smith",
        "imageUrl": ImagePath.house3,
        "nobedroom": "3",
        "nobathroom": "2",
      },
      {
        "title": "Villa Sunshine",
        "location": "Rp 5.200",
        "distance": "Alice Brown",
        "imageUrl": ImagePath.house2,
        "nobedroom": "8",
        "nobathroom": "6",
      },
    ];

    topCourses.value =
        topCourseData.map((data) => TopCourse.fromJson(data)).toList();
  }
}

class TopCourse {
  final String title;
  final String location;
  final String distance;
  final String imageUrl;
  final String nobedroom;
  final String nobathroom;

  TopCourse({
    required this.title,
    required this.location,
    required this.distance,
    required this.imageUrl,
    required this.nobedroom,
    required this.nobathroom,
  });

  factory TopCourse.fromJson(Map<String, dynamic> json) {
    return TopCourse(
      title: json['title'],
      location: json['location'],
      distance: json['distance'] ?? '',
      imageUrl: json['imageUrl'],
      nobedroom: json['nobedroom'],
      nobathroom: json['nobathroom'],
    );
  }
}
