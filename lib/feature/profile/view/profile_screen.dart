import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/helper/user_session.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_app_bar_profile.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_app_information_section.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_botton_not_login.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_logout_botton.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_row_social_media.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_user_data_details_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: FutureBuilder<bool>(
            future: UserSession.isLoggedIn(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: R.colors.primaryColorLight,
                  ),
                );
              }
              final loggedIn = snapshot.data ?? false;
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 16.w,
                    ),

                    child: SafeArea(
                      child: CustomAppBarProfile(
                        title: loggedIn ? 'فهد القحطانى' : 'كزائر',
                      ),
                    ),
                  ),

                  //check if user is logged in or not
                  loggedIn
                      ? // C1
                      CustomUserDataDetailsSection()
                      : CustomBottonNotLogin(),

                  SizedBox(height: 30.h),
                  //C2
                  CustomAppInformationSection(),

                  SizedBox(height: 24.h),
                  loggedIn ? CustomLogoutBotton() : SizedBox.shrink(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'التواصل الاجتماعى',
                        style: R.textStyles.font14Grey3W500Light,
                      ),

                      CustomRowSocialMedia(),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    children: [
                      Text(
                        'الاصدار : 1.0.0',
                        style: R.textStyles.font12Grey3W500Light,
                      ),
                      Text(
                        'جميع الحقوق محفوظة لمنصة مزاود اين©2024',
                        style: R.textStyles.font12Grey3W500Light,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: R.colors.whiteLight,
//       body: BlocBuilder<UserDataCubit, UserDataState>(
//         builder: (context, state) {
//           if (state is UserDataLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is UserDataNotLoggedIn) {
//             return const CustomBottonNotLogin();
//           } else if (state is UserDataSuccess) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Column(
//                   children: [
//                     _buildHeader(state.userModel.data?.name ?? '22'),
//                     _buildAccountSection(context),
//                     SizedBox(height: 30.h),
//                     _buildInformationSection(context),
//                     SizedBox(height: 24.h),
//                     _buildLogoutButton(context),
//                     SizedBox(height: 24.h),
//                   ],
//                 ),
//               ),
//             );
//           } else if (state is UserDataError) {
//             return Center(child: Text('Error: ${state.errMessage}'));
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildHeader(String name) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
//       child: SafeArea(child: CustomAppBarTitle(title: name)),
//     );
//   }

//   Widget _buildAccountSection(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: R.colors.blackColor3,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: R.colors.blackColor3),
//       ),
//       child: Column(
//         children: [
//           InkWell(
//             onTap:
//                 () => Navigator.pushNamed(
//                   context,
//                   AppRoutes.accountDetailsScreenRoute,
//                 ),
//             child: CustomAccountListTile(
//               title: 'معلومات الحساب',
//               leading: SvgPicture.asset(
//                 R.images.accountIcon,
//                 width: 17.5.w,
//                 height: 17.5.w,
//               ),
//             ),
//           ),
//           Divider(
//             color: R.colors.colorUnSelected,
//             height: 1.h,
//             endIndent: 14.w,
//             indent: 14.w,
//           ),
//           InkWell(
//             onTap:
//                 () => Navigator.pushNamed(
//                   context,
//                   AppRoutes.changePasswordScreenRoute,
//                 ),
//             child: CustomAccountListTile(
//               title: 'تغير كلمة المرور',
//               leading: SvgPicture.asset(
//                 R.images.passwordAccountIcon,
//                 width: 17.5.w,
//                 height: 17.5.w,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.pushNamed(context, AppRoutes.settingScreenRoute);
//             },
//             child: CustomAccountListTile(
//               title: 'الاعدادات',
//               leading: SvgPicture.asset(
//                 R.images.settingIcon,
//                 width: 17.5.w,
//                 height: 17.5.w,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInformationSection(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: R.colors.blackColor3,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: R.colors.blackColor3),
//       ),
//       child: Column(
//         children: [
//           CustomAccountListTile(title: 'من نحن'),
//           Divider(
//             color: R.colors.colorUnSelected,
//             height: 1.h,
//             endIndent: 14.w,
//             indent: 14.w,
//           ),
//           CustomAccountListTile(title: 'من نحن'),

//           Divider(
//             color: R.colors.colorUnSelected,
//             height: 1.h,
//             endIndent: 14.w,
//             indent: 14.w,
//           ),
//           CustomAccountListTile(title: 'من نحن'),

//           Divider(
//             color: R.colors.colorUnSelected,
//             height: 1.h,
//             endIndent: 14.w,
//             indent: 14.w,
//           ),
//           CustomAccountListTile(title: 'من نحن'),
//         ],
//       ),
//     );
//   }

//   Widget _buildLogoutButton(BuildContext context) {
//     return CustomElevatedButton(
//       text: 'تسجيل الخروج',
//       textStyle: R.textStyles.font14Grey3W500Light.copyWith(
//         color: R.colors.redColor2,
//       ),
//       backgroundColor: R.colors.redColor3,
//       icon: SvgPicture.asset(R.images.logoutImage),
//       onPressed: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return _buildLogoutConfirmation(context);
//           },
//         );
//       },
//     );
//   }

//   Widget _buildLogoutConfirmation(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 130.w,
//             height: 5.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100.r),
//               color: R.colors.greyColor3,
//             ),
//           ),
//           SizedBox(height: 24.h),
//           GestureDetector(
//             onTap: () async {
//               await UserSession.logout();
//               Navigator.pushReplacementNamed(context, AppRoutes.authRouter);
//             },
//             child: Text(
//               'تسجيل الخروج',
//               style: R.textStyles.font14BlackW500Light.copyWith(
//                 color: R.colors.redColor,
//               ),
//             ),
//           ),
//           SizedBox(height: 24.h),
//           CustomElevatedButton(
//             text: 'الغاء',
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
