import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_task/core/common/styles/global_text_style.dart';
import 'package:ird_task/core/utils/constants/image_path.dart';
import 'package:ird_task/features/home/controller/home_controller.dart';
import 'package:ird_task/features/home/model/home_model.dart';
import 'package:ird_task/features/home/presentation/screen/card_detail_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildSearchBar(),
                const SizedBox(height: 16),
                _buildCategories(),
                const SizedBox(height: 27),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Near from you",
                        style: getTextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "See More",
                        style: getTextStyle(
                            color: Color(0xff858585),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: SizedBox(
                    height: 220, 
                    child: Obx(
                      () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller
                            .cardData.length, 
                        itemBuilder: (context, index) {
                          final card = controller.cardData[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    cardDetails:
                                        card, 
                                  ),
                                ),
                              );
                            },
                            child: _buildCard(card),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best for you",
                        style: getTextStyle(
                            color: const Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "See More",
                        style: getTextStyle(
                            color: const Color(0xff858585),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.topCourses.length,
                      itemBuilder: (context, index) {
                        final course = controller.topCourses[index];
                        return _buildCourseCard(course);
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue, // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, "Home", isSelected: true),
            _buildDrawerItem(Icons.person, "Profile"),
            _buildDrawerItem(Icons.location_on, "Nearby"),
            const SizedBox(width: 200, child: Divider()),
            _buildDrawerItem(Icons.bookmark, "Bookmark"),
            _buildDrawerItem(Icons.notifications, "Notification"),
            _buildDrawerItem(Icons.message, "Message"),
            const SizedBox(width: 200, child: Divider()),
            _buildDrawerItem(Icons.settings, "Setting"),
            _buildDrawerItem(Icons.help, "Help"),
            _buildDrawerItem(Icons.logout, "Logout"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title,
      {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.blue,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue[300] : Colors.white70,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blue[300] : Colors.white70,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                    color: Color(0xff838383),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  const Text(
                    'Jakarta',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const Icon(Icons.keyboard_arrow_down,
                      color: Color(0xff838383)),
                  Transform.translate(
                    offset: const Offset(338, -14),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.notifications_outlined, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: const Color(0xffF7F7F7),
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 20,
                ),
                hintText: "Search address, or near you",
                hintStyle: const TextStyle(
                    color: Color(0xff858585),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffA0DAFB),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            ImagePath.electron,
            height: 16,
            width: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.topics.map((category) {
            final isSelected = category == controller.selectedCategory.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  controller.selectedCategory.value = category;
                },
                child: Chip(
                  label: Text(category),
                  backgroundColor: isSelected
                      ? const Color(0xffA0DAFB)
                      : const Color(0xffF7F7F7),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xff858585),
                  ),
                  side: BorderSide.none, 
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCourseCard(Topdata course) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            course.imageUrl,
            width: 70,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          course.title,
          style: getTextStyle(
              color: const Color(0xff000000),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Text(
              '${course.location} / year',
              style: getTextStyle(
                  color: const Color(0xff0A8ED9),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.bed,
                      size: 16,
                      color: Color(0xff858585),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${course.nobedroom} Bedroom',
                      style: getTextStyle(
                          color: const Color(0xff858585),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    const Icon(Icons.bathtub,
                        size: 16, color: Color(0xff858585)),
                    const SizedBox(width: 8),
                    Text(
                      '${course.nobathroom} Bathroom',
                      style: getTextStyle(
                          color: const Color(0xff858585),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> card) {
    return Container(
      margin:const EdgeInsets.only(right: 20, left: 10),
      width: 200,
      height: 250, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            SizedBox(
              width: 200, 
              height: 250, 
              child: Image.network(
                card["imageUrl"]!,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              top: 12,
              right: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color:const Color(0xff719AB7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      card["distance"]!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card["title"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    card["location"]!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See more',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
