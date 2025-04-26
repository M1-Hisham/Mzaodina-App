import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/view/home_screen.dart';
import 'package:mzaodina_app/feature/home/view/profile_screen.dart';
import 'package:mzaodina_app/feature/home/view/search_screen.dart';

class NavBarSreen extends StatefulWidget {
  const NavBarSreen({super.key});

  @override
  State<NavBarSreen> createState() => _NavBarSreenState();
}

class _NavBarSreenState extends State<NavBarSreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _navItems = [
    {
      'unselectedIcon': R.images.homeIcon,
      'selectedIcon': R.images.homeIconSelected,
      'label': 'الرئيسية',
    },
    {
      'unselectedIcon': R.images.searchIcon,
      'selectedIcon': R.images.searchIcon,
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
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
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
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        isSelected
                            ? _navItems[index]['selectedIcon']!
                            : _navItems[index]['unselectedIcon']!,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      _navItems[index]['label']!,
                      style:
                          isSelected
                              ? R.textStyles.font12primaryW600Light
                              : R.textStyles.font12GreyW600Light,
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
