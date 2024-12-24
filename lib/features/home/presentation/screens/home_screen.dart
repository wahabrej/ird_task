import 'package:flutter/material.dart';

class PropertyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://via.placeholder.com/600x400', // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Details card
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dreamsville House',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'JL Sultan Iskandar Muda, Jakarta Selatan',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.bed, size: 18, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('6 Bedroom'),
                        SizedBox(width: 16),
                        Icon(Icons.bathtub, size: 18, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('4 Bathroom'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/50', // Replace with owner image URL
                          ),
                          radius: 25,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Garry Allen',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Owner'),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.phone, color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chat, color: Colors.blue),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          galleryImage('https://via.placeholder.com/100'),
                          galleryImage('https://via.placeholder.com/100'),
                          galleryImage('https://via.placeholder.com/100'),
                          galleryImage('https://via.placeholder.com/100'),
                          galleryImage('https://via.placeholder.com/100'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Rp. 2,500,000,000 / Year',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Rent Now'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget galleryImage(String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
