import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_screen.dart';
import 'package:mzaodina_app/feature/profile/view/profile_screen.dart';
import 'package:mzaodina_app/feature/search/view/search_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _navItems = [
    {
      'unselectedIcon': R.images.homeIcon,
      'selectedIcon': R.images.homeIconSelected,
      'label': 'الرئيسية',
    },
    {
      'unselectedIcon': R.images.searchIcon,
      'selectedIcon': R.images.searchIconSelected,
      'label': 'البحث',
    },
    {
      'unselectedIcon': R.images.personIcon,
      'selectedIcon': R.images.personIconSelected,
      'label': 'الحساب',
    },
  ];
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: R.colors.whiteLight,
          boxShadow: [
            BoxShadow(
              color: R.colors.greyColor.withOpacity(0.4),

              offset: Offset(0, -1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              bool isSelected = _currentIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = index),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? R.colors.primaryColorLight
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: SvgPicture.asset(
                        isSelected
                            ? _navItems[index]['selectedIcon']!
                            : _navItems[index]['unselectedIcon']!,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      _navItems[index]['label']!,
                      style:
                          isSelected
                              ? R.textStyles.font12primaryW600Light
                              : R.textStyles.font12GreyW500Light,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
