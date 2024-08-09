import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_admin_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';

class GalleryWidget extends StatefulWidget {
  final bool isAuthenticated;
  final String userName;

  const GalleryWidget({
    Key? key,
    required this.isAuthenticated,
    required this.userName,
  }) : super(key: key);

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<String> imagePaths = [
    'assets/images/slider1.webp',
    'assets/images/slider2.jpg',
    'assets/images/slider3.webp',
  ];
  final List<String> captions = [
    'Macka - Capitán',
    'Llinas - Kaiser',
    'Falcao - Historia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerAdminWidget(
        isAuthenticated: widget.isAuthenticated,
        userName: widget.userName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Visualización de la Galería",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0), 
            Container(
              height: 750,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Text(
                          captions[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imagePaths.length,
                (index) => GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
