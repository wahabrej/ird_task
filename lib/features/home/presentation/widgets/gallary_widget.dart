import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  final List<String> imageUrls; // List of image URLs

  const GallerySection({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Height of the gallery row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          // Check if it's the last image
          final isLast = index == imageUrls.length - 1;

          return Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Stack(
              children: [
                // Image container with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    imageUrls[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),

                // Overlay for the last image
                if (isLast)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        '+${imageUrls.length - index}', // Display remaining count
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
