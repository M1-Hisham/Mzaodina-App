import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_app_bar_profile.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_app_information_section.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_botton_not_login.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_logout_botton.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_row_social_media.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_user_data_details_section.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _version = '';
  final String _year = DateTime.now().year.toString();

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              if (state is UserDataLoading) {
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        color: R.colors.primaryColorLight,
                      ),
                    ],
                  ),
                );
              } else if (state is UserDataNotLoggedIn) {
                return Column(
                  children: [
                    _buildHeader('كزائر'),
                    CustomBottonNotLogin(),
                    SizedBox(height: 30.h),
                    CustomAppInformationSection(),
                    SizedBox(height: 24.h),
                    _buildSocialMediaSection(),
                    _buildFooter(),
                  ],
                );
              } else if (state is UserDataSuccess) {
                final UserData userData = state.userModel.data!;
                return Column(
                  children: [
                    _buildHeader(userData.username),
                    CustomUserDataDetailsSection(userData: userData),
                    SizedBox(height: 30.h),
                    CustomAppInformationSection(),
                    SizedBox(height: 24.h),
                    CustomLogoutBotton(),
                    _buildSocialMediaSection(),
                    _buildFooter(),
                  ],
                );
              } else if (state is UserDataError) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<UserDataCubit>().fetchUserData();
                  },
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 200.h),
                          Center(child: Text('حدث خطأ: ${state.errMessage}')),
                          SizedBox(height: 20.h),
                          CustomLogoutBotton(),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String name) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      child: SafeArea(child: CustomAppBarProfile(title: name)),
    );
  }

  Widget _buildSocialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('التواصل الاجتماعى', style: R.textStyles.font14Grey3W500Light),
        CustomRowSocialMedia(),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        SizedBox(height: 24),
        Text('الاصدار : $_version', style: R.textStyles.font12Grey3W500Light),
        Text(
          'جميع الحقوق محفوظة لمنصة مزاود اين©$_year',
          style: R.textStyles.font12Grey3W500Light,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
