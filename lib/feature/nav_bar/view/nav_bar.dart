import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/ui/view/home_screen.dart';
import 'package:mzaodina_app/feature/nav_bar/view_model/nav_bar_cubit.dart';
import 'package:mzaodina_app/feature/profile/view/profile_screen.dart';
import 'package:mzaodina_app/feature/search/view/search_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: const [HomeScreen(), SearchScreen(), ProfileScreen()],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: R.colors.greyColor.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedLabelStyle: R.textStyles.font12primaryW600Light,
              unselectedLabelStyle: R.textStyles.font12GreyW500Light,
              currentIndex: state,
              onTap: (value) {
                BlocProvider.of<NavBarCubit>(context).changeTab(value);
              },
              items: [
                BottomNavigationBarItem(
                  
                  activeIcon: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.only(bottom: 5.h),

                    decoration: BoxDecoration(
                      color: R.colors.primaryColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(R.images.homeIconSelected),
                  ),
                  icon: Container(
                    padding: EdgeInsets.only(bottom: 5.h),

                    child: SvgPicture.asset(R.images.homeIcon),
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: R.colors.primaryColorLight,

                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(R.images.searchIconSelected),
                  ),
                  icon: Container(
                    padding: EdgeInsets.only(bottom: 5.h),

                    child: SvgPicture.asset(R.images.searchIcon),
                  ),
                  label: 'البحث',
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: EdgeInsets.only(bottom: 5.h),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: R.colors.primaryColorLight,

                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(R.images.personIconSelected),
                  ),
                  icon: Container(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: SvgPicture.asset(R.images.personIcon),
                  ),
                  label: 'الحساب',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
