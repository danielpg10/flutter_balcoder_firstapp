import 'package:balcoder_flutter_second/ui/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:balcoder_flutter_second/utils/mixins/drawer_widget.dart';
import 'package:balcoder_flutter_second/utils/widgets/appbar_widget.dart';

class GalleryWidget extends StatefulWidget {
  final bool isAuthenticated;

  const GalleryWidget({Key? key, required this.isAuthenticated}) : super(key: key);

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final List<String> imageUrls = [
    'https://files.antena2.com/antena2/public/styles/imagen_despliegue/public/2021-08/macalister_silva_4_0.jpeg.webp?VersionId=oWbDckkyus9jZtjrNIlTEr8nbVe60tdF&itok=YutHO-uS',
    'https://files.antena2.com/antena2/public/styles/data_estructurada_1260x740_/public/2022-06/Andr%C3%A9s%20Llin%C3%A1s%20-%20Millonarios.jpg?VersionId=Pm1.yXc1FXJgNa2_ya.rlC4SzD0HNmCK&h=a9ae5a94&itok=2fULkQK-',
    'https://files.antena2.com/antena2/public/styles/imagen_despliegue/public/2024-07/WhatsApp%20Image%202024-07-24%20at%2021.42.22_0.jpeg.webp?VersionId=kk7uKDaMZ7lq4q.Xl6pEmQ5XDf2m484U&itok=chrBA2aY',
  ];

  final List<String> imageTexts = [
    'Historia - Capitán',
    'Orgullo - Kaiser',
    'Goleador - Tigre',
  ];

  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: widget.isAuthenticated 
        ? Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return Center(child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Center(child: Text('Error al cargar la imagen'));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            imageTexts[index],
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageUrls.length,
                  (index) => _buildDot(index, context),
                ),
              ),
            ],
          ) 
        : _buildLoginPrompt(context),
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
        width: _currentPage == index ? 16.0 : 12.0,
        height: _currentPage == index ? 16.0 : 12.0,
        decoration: BoxDecoration(
          color: _currentPage == index ? Colors.blue : Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
