import 'package:balcoder_flutter/ui/home/models/testimoal_model.dart';
import 'package:balcoder_flutter/utils/theme/app_constats.dart';
import 'package:flutter/material.dart';

class TestimonialWidget extends StatefulWidget {
  const TestimonialWidget({super.key});

  @override
  State<TestimonialWidget> createState() => _TestimonialWidgetState();
}

class _TestimonialWidgetState extends State<TestimonialWidget> {
  late Size _size;
  late PageController _pageController;
  int _currentPage = 0;

  final List<TestimonialModel> _pageItems = [
    TestimonialModel(imagePath: 'assets/images/test.png', text: 'Page 1'),
    TestimonialModel(imagePath: 'assets/images/test.png', text: 'Page 2'),
    TestimonialModel(imagePath: 'assets/images/test.png', text: 'Page 3'),
    TestimonialModel(imagePath: 'assets/images/test.png', text: 'Page 4'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    setState(() {
      if(_currentPage < _pageItems.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      } else {
        _currentPage = _pageItems.length - 1;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: 300,
          width: _size.width,
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: _pageItems.map((item) {
              return Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      width: _size.width,
                      height: 200,
                    ),
                    Text(
                      item.text,
                      style: AppConstants.titulos,
                    ),
                  ],
                )
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}