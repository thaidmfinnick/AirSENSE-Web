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

import 'package:iot/screens/eshop/checkout.dart';
import 'package:iot/screens/data_table_view.dart';
import 'package:iot/screens/iot_device/on_off_device_nomal.dart';
import 'package:iot/screens/iot_device/device/control_rc_model.dart';
import 'package:iot/screens/home.dart';
import 'package:iot/screens/eshop/usersettings.dart';


leftDrawerMenu(context) {
  Color blackColor = Colors.black.withOpacity(0.6);
  return Container(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          height: 150,
          child: DrawerHeader(
            child: ListTile(
              trailing: Icon(
                Icons.chevron_right,
                size: 28,
              ),
              subtitle: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: UserSettings(),
                    ),
                  );
                },
                child: Text(
                  "Chi tiết thông tin",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
              ),
              title: Text(
                SettingInfo().GetUserInfor().email,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://miro.medium.com/fit/c/256/256/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFB),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Feather.getIconData('list'), color: blackColor),
          title: Text('Điều Khiển Mô hình',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () { //OnOffDeviceScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ControlRCModel()),
            );
            // Nav.route(context, OnOffDeviceScreen());
          },
        ),
        ListTile(
          leading: Icon(Feather.getIconData('list'), color: blackColor),
          title: Text('Bật Tắt Thiết Bị',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () { //OnOffDeviceScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnOffDeviceScreen()),
            );
            // Nav.route(context, OnOffDeviceScreen());
          },
        ),
      ],
    ),
  );
}

/*
leftDrawerMenu(context) {
  Color blackColor = Colors.black.withOpacity(0.6);
  return Container(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          height: 150,
          child: DrawerHeader(
            child: ListTile(
              trailing: Icon(
                Icons.chevron_right,
                size: 28,
              ),
              subtitle: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: UserSettings(),
                    ),
                  );
                },
                child: Text(
                  "Chi tiết thông tin",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
              ),
              title: Text(
                SettingInfo().GetUserInfor().email,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://miro.medium.com/fit/c/256/256/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFB),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Feather.getIconData('home'),
            color: blackColor,
          ),
          title: Text(
            'Trang chủ',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
          ),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Home(),
              ),
            );
          },
        ),
        ListTile(
          trailing: Icon(
            Ionicons.getIconData('ios-radio-button-on'),
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading: Icon(Feather.getIconData('gift'), color: blackColor),
          title: Text('Khuyến mại',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: VLCVideoPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Feather.getIconData('search'), color: blackColor),
          title: Text('Tài khoản',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Future.delayed(Duration(milliseconds: 500), () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: DataTableView(),
                ),
              );
            });

          },
        ),
        ListTile(
          trailing: Icon(
            Ionicons.getIconData('ios-radio-button-on'),
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading: Icon(Feather.getIconData('bell'), color: blackColor),
          title: Text('Danh sách Zalo OA',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Nav.route(context,Checkout());
          },
        ),
        ListTile(
          trailing: Icon(
            Icons.looks_two,
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading:
          Icon(Feather.getIconData('shopping-cart'), color: blackColor),
          title: Text('Chiến dịch',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ShoppingCart(true),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Feather.getIconData('list'), color: blackColor),
          title: Text('Thiết bị',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () { //OnOffDeviceScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnOffDeviceScreen()),
            );

            // Nav.route(context, OnOffDeviceScreen());
          },
        ),
        ListTile(
          leading:
          Icon(Feather.getIconData('message-circle'), color: blackColor),
          title: Text('Support',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Nav.route(context, ProductList());
          },
        ),
        ListTile(
          leading:
          Icon(Feather.getIconData('help-circle'), color: blackColor),
          title: Text('Help',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Nav.route(context, UserSettings());
          },
        ),
        ListTile(
          leading: Icon(Feather.getIconData('settings'), color: blackColor),
          title: Text('Settings',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: UserSettings(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Feather.getIconData('x-circle'), color: blackColor),
          title: Text('Quit',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
        ),
      ],
    ),
  );
}
*/