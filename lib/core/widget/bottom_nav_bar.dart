import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/features/activity/ui/activity_screen.dart';
import 'package:challenge/features/home/ui/home_screen.dart';
import 'package:challenge/features/medicine/ui/medicine_screen.dart';
import 'package:challenge/features/pic_products/presentation/view/pic_products.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LayoutShop extends StatefulWidget {
  const LayoutShop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LayoutShopState createState() => _LayoutShopState();
}

class _LayoutShopState extends State<LayoutShop> {
  int _bottomNavIndex = 0;

  final List<IconData> iconList = [
    Icons.home,
    Iconsax.activity,
    Icons.add,
    Icons.camera_alt,
  ];

  late final List<Widget> _pages = [
    const HomeScreen(),
    const ActivityScreen(),
    const MedicineScreen(),
    const PicProductsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex], // الصفحة الحالية بناءً على الـ index
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList, // الأيقونات
        activeIndex: _bottomNavIndex, // المؤشر الحالي
        gapLocation:
            GapLocation.center, // وجود فجوة في منتصف الـ Bottom Navigation Bar
        notchSmoothness: NotchSmoothness.verySmoothEdge, // جعل الزاوية ناعمة
        leftCornerRadius: 32, // زوايا دائرية لليسار
        rightCornerRadius: 32,
        activeColor: ColorsManager.mainColor, // زوايا دائرية لليمين
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index; // تحديث الصفحة عند تغيير المؤشر
          });
        },
      ),
    );
  }
}
