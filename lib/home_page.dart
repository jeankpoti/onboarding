import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  final String? imageUrl;
  const HomePage({super.key, this.imageUrl = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List _imageList = [];

  @override
  void initState() {
    super.initState();

    _imageList = [
      'assets/images/avatar.png',
      'assets/images/monkey 5.jpg',
      'assets/images/monkey 6.jpg',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 600,
              child: PageView.builder(
                  itemCount: _imageList.length,
                  physics: const RangeMaintainingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _imageList[index],
                      fit: BoxFit.fitHeight,
                      height: 200,
                      width: 300,
                    );
                  }),
            ),
            const SizedBox(height: 60),
            const Text(
              textAlign: TextAlign.center,
              'You\'ve reached your destination',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              'Lorem ipsum dolor sit amet consectetur',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _imageList.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AnimatedContainer(
                      width: 50,
                      height: 10,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            _selectedIndex == index ? Colors.red : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
