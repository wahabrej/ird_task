import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ird_task/core/utils/constants/image_path.dart';
import 'package:ird_task/features/home/presentation/widgets/gallary_widget.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic>? cardDetails;

  DetailScreen({super.key, this.cardDetails});
  final List<String> sampleImages = [
    ImagePath.house4,
    ImagePath.house5,
    ImagePath.house6,
    ImagePath.house7,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cardDetails == null
          ? const Center(child: Text('No details available'))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Apply border radius
                        child: Image.network(
                          cardDetails?['imageUrl'] ?? 'none',
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 304,
                          fit: BoxFit
                              .fill, // Ensures the image fills the entire space
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 30,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff6D8FA8),
                          child: Transform.translate(
                            offset: const Offset(6, 0),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 30,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff6D8FA8),
                          child: IconButton(
                            icon: const Icon(Icons.bookmark_border,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardDetails!['title'] ?? 'No Title',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cardDetails!['location'] ?? 'Unknown Location',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff3D423C),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Image.asset(
                                    ImagePath.bed,
                                    height: 16,
                                    width: 15,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${cardDetails!['bedrooms'] ?? '6'} Bedroom',
                                  style: const TextStyle(
                                      color: Color(0xffD4D4D4),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff3D423C),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Icon(
                                    Icons.bathtub,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${cardDetails!['bathrooms'] ?? '7'} Bathroom',
                                  style: const TextStyle(
                                      color: Color(0xffD4D4D4),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: const TextSpan(
                            text:
                                'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: 'Show More.',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            ImagePath.man,
                          ),
                          radius: 24,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardDetails!['ownerName'] ?? 'Garry Allen',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              'Owner',
                              style: TextStyle(
                                  color: Color(0xff858585),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Color(0xff0A8ED9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset(
                            ImagePath.call,
                            height: 12,
                            width: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Color(0xff0A8ED9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset(
                            ImagePath.message,
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GallerySection(imageUrls: sampleImages),
                  ),
                  const SizedBox(height: 16),

                  if (cardDetails!['mapImageUrl'] != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          cardDetails!['mapImageUrl']!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  //Image.asset(ImagePath.map),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          ImagePath.map,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Transform.translate(
                      offset: const Offset(1, -10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff858585)),
                              ),
                              Text(
                                'Rp ${cardDetails!['price'] ?? '2500.000'} / Year',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 43,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFA0DAFB),
                                    Color(0xFF0A8ED9),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Text(
                                'Rent Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }
}
