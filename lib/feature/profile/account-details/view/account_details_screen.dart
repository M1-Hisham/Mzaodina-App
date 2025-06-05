import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/enter_the_phone_number.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/select_country.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/model/update_profile_body.dart';
import 'package:mzaodina_app/feature/profile/account-details/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class AccountDetailsScreen extends StatelessWidget {
  final UserData userData;
  AccountDetailsScreen({super.key, required this.userData});

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children: [
            CustomAppBarAccount(title: 'معلومات الحساب'),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اسم المستخدم',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          CustomTextForm(
                            hintText: 'اسم المستخدم',
                            initialValue: userData.username,
                            onSaved: (value) {
                              _formData['username'] = value;
                            },
                            fillColor: R.colors.whiteLight,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'الاسم الحقيقي',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          CustomTextForm(
                            hintText: 'الاسم الحقيقي',
                            initialValue: userData.name,
                            onSaved: (value) {
                              _formData['name'] = value;
                            },
                            isValidator: false,
                            fillColor: Colors.white,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'البريد الالكترونى',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          CustomTextForm(
                            hintText: 'البريد الالكترونى',
                            initialValue: userData.email,
                            onSaved: (value) {
                              _formData['email'] = value;
                            },
                            fillColor: Colors.white,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'اختر الدولة',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          SelectCountry(color: R.colors.whiteLight),
                          const SizedBox(height: 14),
                          Text(
                            'رقم الهاتف',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          EnterThePhoneNumber(
                            phoneNumberController: TextEditingController(
                              text: userData.phone,
                            ),
                            isValidator: false,
                            fillColor: R.colors.whiteLight,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'المدينة',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          CustomTextForm(
                            hintText: 'المدينة',
                            initialValue: userData.address?.city,
                            onSaved: (value) {
                              _formData['city'] = value;
                            },
                            isValidator: false,
                            fillColor: Colors.white,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'الحي',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          CustomTextForm(
                            hintText: 'الحي',
                            initialValue: userData.address?.neighborhood,
                            onSaved: (value) {
                              _formData['neighborhood'] = value;
                            },
                            fillColor: Colors.white,
                            isValidator: false,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'الشارع',
                            style: R.textStyles.font14Grey3W500Light,
                          ),
                          const SizedBox(height: 8),
                          CustomTextForm(
                            hintText: 'الشارع',
                            initialValue: userData.address?.street,
                            onSaved: (value) {
                              _formData['street'] = value;
                            },
                            isValidator: false,
                            fillColor: Colors.white,
                            hintStyle: R.textStyles.font12Grey3W500Light,
                          ),
                          SizedBox(height: 150.h),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(color: R.colors.whiteLight),
                      child: CustomElevatedButton(
                        text: 'الاستمرار',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            log('Form data: $_formData');
                            // _updateUserProfile(context);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUserProfile(BuildContext context) {
    final UpdateProfileBody updateProfileBody = UpdateProfileBody(
      name: _formData['name'],
      username: _formData['username'],
      email: _formData['email'],
      country: _formData['country'],
      phone: _formData['phone'],
      city: _formData['city'],
      neighborhood: _formData['neighborhood'],
      street: _formData['street'],
    );
    final cubit = BlocProvider.of<UpdateProfileCubit>(context);
    cubit.updateUserData(updateProfileBody);
    log('Updating user profile with data: $_formData');
  }
}
