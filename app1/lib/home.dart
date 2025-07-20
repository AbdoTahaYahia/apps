import 'package:app1/colors.dart';
import 'package:app1/model.dart';
import 'package:app1/product_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "assets/banners/Slider1.png",
    "assets/banners/Slider2.png",
    "assets/banners/Slider3.png",
  ];
  List<Categorymodel> category = [
    Categorymodel(name: 'Fruits', image: "assets/category/vegatdels.png"),
    Categorymodel(name: 'Milk & Egg', image: "assets/category/egg.png"),
    Categorymodel(name: 'Beverages', image: "assets/category/bavergas.png"),
    Categorymodel(name: 'Laundry', image: "assets/category/luandry.png"),
    Categorymodel(name: 'Vegetables', image: "assets/category/free.png"),
    Categorymodel(name: 'Free', image: "assets/category/free.png"),
  ];
  List<Productmodel> products = [
    Productmodel(
      name: 'Banana',
      image: "assets/fruits/banana.png",
      price: "2.99",
      rate: "5",
      ratecount: "287",
    ),
    Productmodel(
      name: 'Papper',
      image: "assets/fruits/papper.png",
      price: "2.99",
      rate: "4",
      ratecount: "287",
    ),
    Productmodel(
      name: 'Orange',
      image: "assets/fruits/orange.png",
      price: "1.99",
      rate: "4",
      ratecount: "287",
    ),
    Productmodel(
      name: 'Lemon',
      image: "assets/fruits/lemon.png",
      price: "4.99",
      rate: "3.5",
      ratecount: "287",
    ),
    Productmodel(
      name: 'Cleaner',
      image: "assets/fruits/cleaner.png",
      price: "2.99",
      rate: "4",
      ratecount: "287",
    ),
  ];
  List basketlist = [];
  void togglSelection(Productmodel product) {
    setState(() {
      if (basketlist.contains(product)) {
        basketlist.remove(product);
      } else {
        basketlist.add(product);
      }
    });
  }

  bool isSelected(Productmodel product) => basketlist.contains(product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/mottor.svg'),
            SizedBox(width: 10),
            Text('61 hopper street'),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_rounded, size: 35),
            Spacer(),

            SvgPicture.asset('assets/icons/basket.svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          //banner
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(items[itemIndex]),
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
          ),
          //category
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            category[index].image,
                            height: 55,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        category[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          //product items
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: List.generate(products.length, (index) {
                  final item = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductItem(
                      image: item.image,
                      name: item.name,
                      price: item.price,
                      rate: item.rate,
                      ratecount: item.ratecount,
                      onTap: () => togglSelection(item),
                      icon: isSelected(item)
                          ? Icon(Icons.remove)
                          : Icon(Icons.add),
                    ),
                  );
                }),
              ),
            ),
          ),
          Spacer(),

          //cart widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 210,
                      child: ListView.builder(
                        itemCount: basketlist.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 10,
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Image.asset(basketlist[index].image),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Container(width: 2, height: 40, color: Colors.white),
                    SizedBox(width: 10),

                    Text(
                      'View Cart',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Badge(
                      backgroundColor: Colors.red,
                      label: Text(basketlist.length.toString()),
                      isLabelVisible: basketlist.isNotEmpty, // مش showBadge
                      child: SvgPicture.asset(
                        'assets/icons/basket.svg',
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
