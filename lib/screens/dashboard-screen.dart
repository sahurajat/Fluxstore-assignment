// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, String>> imageList = [
    {"id": "1", "image_path": 'image/men1.jpg'},
    {"id": "2", "image_path": 'image/men2.jpg'},
    {"id": "3", "image_path": 'image/men3.jpg'}
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int mybottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160.0),
          child: AppBar(
            title: Text(
              "Fluxstore",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
            centerTitle: true,
            elevation: 20,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 29, 104, 165),
                    const Color.fromARGB(255, 88, 75, 75),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 66, 56, 56),
              indicatorWeight: 3,
              tabs: [
                _buildTab('image/polo.png', 'Men'),
                _buildTab('image/frock.png', 'Women'),
                _buildTab('image/man.png', 'Clothing'),
                _buildTab('image/bag.png', 'Posters'),
                _buildTab('image/cap.png', 'Cap'),
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return TabBarView(
              children: [
                _buildTabPage(context, constraints),
                _buildTabPage(context, constraints),
                _buildTabPage(context, constraints),
                _buildTabPage(context, constraints),
                _buildTabPage(context, constraints),
              ],
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              mybottomIndex = index;
            });
          },
          currentIndex: mybottomIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.amber),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.indigo),
          ],
        ),
      ),
    );
  }

  Tab _buildTab(String imagePath, String text) {
    return Tab(
      icon: CircleAvatar(
        radius: 20,
        backgroundColor: const Color.fromARGB(255, 166, 153, 153),
        child: Image.asset(
          imagePath,
          width: 38,
          height: 30,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  Widget _buildTabPage(BuildContext context, BoxConstraints constraints) {
    return ListView(
      children: [
        _buildCarousel(context, constraints),
        SizedBox(height: 10),
        _buildItemsCarousel(context, constraints),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context, BoxConstraints constraints) {
    return Stack(
      children: [
        CarouselSlider(
          items: imageList
              .map(
                (item) => Image.asset(
                  item['image_path']!,
                  fit: BoxFit.cover,
                  width: constraints.maxWidth,
                ),
              )
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        currentIndex == entry.key ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildItemsCarousel(BuildContext context, BoxConstraints constraints) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 0.5 * constraints.maxHeight,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
      ),
      items: [
        _buildCarouselItem('image/a.jpg'),
        _buildCarouselItem('image/b.jpg'),
        _buildCarouselItem('image/c.jpg'),
      ],
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
