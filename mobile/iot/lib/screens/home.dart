import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:iot/config/SettingInfo.dart';
import 'package:iot/models/product.dart';
import 'package:iot/painters/circlepainters.dart';
import 'package:iot/screens/eshop/products_list.dart';
import 'package:iot/screens/search.dart';
import 'package:iot/screens/eshop/shoppingcart.dart';
import 'package:iot/screens/eshop/usersettings.dart';
import 'package:iot/screens/vlc_video.dart';
import 'package:iot/screens/whell.dart';
import 'package:iot/utils/constant.dart';
import 'package:iot/widgets/item_product.dart';
import 'package:iot/widgets/occasions.dart';
import 'package:iot/utils/navigator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:iot/screens/iot_device/layout/left_drawer_menu.dart';
import 'eshop/checkout.dart';
import 'data_table_view.dart';
import 'iot_device/on_off_device_nomal.dart';
import 'eshop/products_list.dart';
import 'eshop/usersettings.dart';
// Json ânote
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(child: leftDrawerMenu(context)),
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Text(
                  "Xin chào "+ SettingInfo().GetUserInfor().username,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50),
                ),
              ),

            ),
            WhellFortune(),
            ShoppingCart(false),
            UserSettings(),
          ],
        ),
      ),
    );
  /*@override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(child: leftDrawerMenu(context)),
        appBar: buildAppBar(context),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.attach_money),
            ),
            Tab(
              icon: new Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: new Icon(Icons.account_circle),
            )
          ],
          labelColor: Theme
              .of(context)
              .primaryColor,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(8.0),
          indicatorColor: Colors.red,
        ),
        body: TabBarView(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CategoriesListView(
                      title: "YOUR TITLES",
                      categories: [
                        'menu.png',
                        'tshirt.png',
                        'telephone.png',
                        'armchair.png',
                        'baby.png',
                        'lipstick.png',
                        'diamond.png',
                        'book.png'
                      ],
                      categoryTitle: [
                        'All',
                        'Dress',
                        'Electronic',
                        'Home',
                        'Baby',
                        'Fashion',
                        'Jewel',
                        'Book'
                      ],
                    ),
                    buildCarouselSlider(),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Popular Trendings",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: ProductList(),
                                  ),
                                );
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Best Selling",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print("Clicked");
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                    Occasions(),
                    Occasions(),
                  ],
                ),
              ),
            ),
            WhellFortune(),
            ShoppingCart(false),
            UserSettings(),
          ],
        ),
      ),
    );*/
  }

  Column buildTrending() {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
            ],
          ),
        )
      ],
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      height: 150,
      viewportFraction: 0.9,
      aspectRatio: 16 / 9,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
            (url) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Sunny Getaways",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            "Lorem Ipsım Dolar Lorem Ipsım Dolar Lorem Ipsım Dolar",
                            style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }

  BottomNavyBar buildBottomNavyBar(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      onItemSelected: (index) =>
          setState(() {
            currentIndex = index;
          }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Theme
              .of(context)
              .primaryColor,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Categories'),
            activeColor: Theme
                .of(context)
                .primaryColor),
        BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Shopping Cart'),
            activeColor: Theme
                .of(context)
                .primaryColor),
        BottomNavyBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Orders'),
            activeColor: Theme
                .of(context)
                .primaryColor),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        SettingInfo().GetUserInfor().email,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: new IconButton(
          icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
              color: Colors.black),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      backgroundColor: Colors.white,
    );
  }

}

class CategoriesListView extends StatelessWidget {
  final String title;
  final List<String> categories;
  final List<String> categoryTitle;

  const CategoriesListView({Key key,
    @required this.title,
    @required this.categories,
    @required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: ProductList(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/" + categories[index],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categoryTitle[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
