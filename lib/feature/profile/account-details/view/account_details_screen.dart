import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/error/failure.dart';
import 'package:mzaodina_app/core/helper/country_helper.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_text_form.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/enter_the_phone_number.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view/widgets/select_country.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/country_cubit/country_cubit.dart';
import 'package:mzaodina_app/feature/auth/register/ui/view_model/phone_code_cubit/phone_code_cubit.dart';
import 'package:mzaodina_app/feature/profile/account-details/data/model/update_profile_body.dart';
import 'package:mzaodina_app/feature/profile/account-details/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzaodina_app/feature/profile/data/model/user_model.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';
import 'package:mzaodina_app/feature/profile/view_model/user_data_cubit/user_data_cubit.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  late TextEditingController _phoneController;

  // Add state variables for API errors
  String? _usernameError;
  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _cityError;
  String? _neighborhoodError;
  String? _streetError;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserDataCubit>(context).fetchUserData();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _clearErrors() {
    setState(() {
      _usernameError = null;
      _nameError = null;
      _emailError = null;
      _phoneError = null;
      _cityError = null;
      _neighborhoodError = null;
      _streetError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) async {
        if (state is UpdateProfileSuccess) {
          await BlocProvider.of<UserDataCubit>(context).fetchUserData();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('✅ تم تحديث البيانات بنجاح')),
            );
          }
        } else if (state is UpdateProfileError) {
          if (mounted) {
            if (state.failure is ServerFailure &&
                (state.failure as ServerFailure).validationErrors != null) {
              final validationErrors =
                  (state.failure as ServerFailure).validationErrors!;
              setState(() {
                _usernameError = validationErrors['username']?.first;
                _nameError = validationErrors['name']?.first;
                _emailError = validationErrors['email']?.first;
                _phoneError = validationErrors['phone']?.first;
                _cityError = validationErrors['city']?.first;
                _neighborhoodError = validationErrors['neighborhood']?.first;
                _streetError = validationErrors['street']?.first;
              });
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errMessage)));
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: R.colors.whiteLight,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomAppBarAccount(title: 'معلومات الحساب'),
              Expanded(
                child: BlocBuilder<UserDataCubit, UserDataState>(
                  builder: (context, state) {
                    if (state is UserDataLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UserDataSuccess) {
                      final user = state.userModel;
                      _phoneController.text = user.data?.phone ?? '';

                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('اسم المستخدم'),
                                  CustomTextForm(
                                    hintText: 'اسم المستخدم',
                                    initialValue: user.data?.username,
                                    onSaved:
                                        (value) =>
                                            _formData['username'] = value,
                                    fillColor: R.colors.whiteLight,
                                    hintStyle:
                                        R.textStyles.font12Grey3W500Light,
                                    apiError: _usernameError,
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('الاسم الحقيقي'),
                                  CustomTextForm(
                                    hintText: 'الاسم الحقيقي',
                                    initialValue: user.data?.name,
                                    onSaved:
                                        (value) => _formData['name'] = value,

                                    fillColor: Colors.white,
                                    hintStyle:
                                        R.textStyles.font12Grey3W500Light,
                                    apiError: _nameError,
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('البريد الالكترونى'),
                                  CustomTextForm(
                                    hintText: 'البريد الالكترونى',
                                    initialValue: user.data?.email,
                                    onSaved:
                                        (value) => _formData['email'] = value,
                                    fillColor: Colors.white,
                                    hintStyle:
                                        R.textStyles.font12Grey3W500Light,
                                    apiError: _emailError,
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('اختر الدولة'),
                                  SelectCountry(
                                    color: R.colors.whiteLight,
                                    initialCountryCode: user.data?.country,
                                    initialPhoneCode: user.data?.phoneCode,
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('رقم الهاتف'),
                                  FutureBuilder<String>(
                                    future: CountryHelper.getDialCodeFromIso(
                                      user.data?.phoneCode ?? 'SA',
                                    ),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData)
                                        return CircularProgressIndicator();

                                      return EnterThePhoneNumber(
                                        initialPhoneCode: snapshot.data,
                                        initialPhoneFlag:
                                            CountryHelper.getFlagFromIsoCode(
                                              user.data?.phoneCode ?? 'SA',
                                            ),
                                        phoneNumberController: _phoneController,

                                        fillColor: R.colors.whiteLight,
                                        hintStyle:
                                            R.textStyles.font12Grey3W500Light,
                                        apiError: _phoneError,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('المدينة'),
                                  CustomTextForm(
                                    hintText: 'المدينة',
                                    initialValue:
                                        user.data?.address?.city ?? '',
                                    onSaved:
                                        (value) => _formData['city'] = value,

                                    fillColor: Colors.white,
                                    hintStyle:
                                        R.textStyles.font12Grey3W500Light,
                                    apiError: _cityError,
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('الحي'),
                                  CustomTextForm(
                                    hintText: 'الحي',
                                    initialValue:
                                        user.data?.address?.neighborhood ?? '',
                                    onSaved:
                                        (value) =>
                                            _formData['neighborhood'] = value,
                                    fillColor: Colors.white,
                                    hintStyle:
                                        R.textStyles.font12Grey3W500Light,
                                    apiError: _neighborhoodError,
                                  ),
                                  const SizedBox(height: 14),
                                  _buildLabel('الشارع'),
                                  CustomTextForm(
                                    hintText: 'الشارع',
                                    initialValue:
                                        user.data?.address?.street ?? '',
                                    onSaved:
                                        (value) => _formData['street'] = value,

                                    fillColor: Colors.white,
                                    hintStyle:
                                        R.textStyles.font12Grey3W500Light,
                                    apiError: _streetError,
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
                              decoration: BoxDecoration(
                                color: R.colors.whiteLight,
                              ),
                              child: BlocBuilder<
                                UpdateProfileCubit,
                                UpdateProfileState
                              >(
                                builder: (context, state) {
                                  final isLoading =
                                      state is UpdateProfileLoading;

                                  return CustomElevatedButton(
                                    text:
                                        isLoading ? 'جاري التحديث...' : 'تحديث',
                                    onPressed:
                                        isLoading
                                            ? () {}
                                            : () async {
                                              _clearErrors();
                                              if (_formKey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                _formKey.currentState?.save();
                                                await _updateUserProfile(
                                                  context,
                                                  user,
                                                );
                                              }
                                            },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return const Center(
                      child: Text('فشل تحميل بيانات المستخدم'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: R.textStyles.font14Grey3W500Light),
        const SizedBox(height: 8),
      ],
    );
  }

  Future<void> _updateUserProfile(BuildContext context, UserModel user) async {
    final countryState = context.read<CountryCubit>().state;
    String? countryCode;

    final phoneCodeState = context.read<PhoneCodeCubit>().state;
    String phoneIso = user.data?.phoneCode ?? 'EG';

    if (countryState is CountrySelected) {
      countryCode = countryState.code;
    } else {
      countryCode = user.data?.country;
    }

    if (phoneCodeState is PhoneCodeSelected) {
      phoneIso = await CountryHelper.getIsoFromDialCode(
        phoneCodeState.dialCode,
      );
    }

    final oldProfile = UpdateProfileBody(
      name: user.data?.name,
      username: user.data?.username,
      email: user.data?.email,
      phone: user.data?.phone,
      phoneCountryCode: user.data?.phoneCode,
      country: user.data?.country,
      city: user.data?.address?.city,
      street: user.data?.address?.street,
      neighborhood: user.data?.address?.neighborhood,
    );

    final updatedProfile = oldProfile.copyWith(
      name: _formData['name']?.trim(),
      username: _formData['username']?.trim(),
      email: _formData['email']?.trim(),
      phone: _phoneController.text.trim(),
      phoneCountryCode: phoneIso,
      country: countryCode ?? user.data?.country ?? 'EG',
      city: _formData['city']?.trim(),
      street: _formData['street']?.trim(),
      neighborhood: _formData['neighborhood']?.trim(),
    );

    final cubit = BlocProvider.of<UpdateProfileCubit>(context);
    cubit.updateUserData(updatedProfile);
    log('Updating user profile with data==: ${updatedProfile.toJson()}');

    final userDataCubit = BlocProvider.of<UserDataCubit>(context);
    await userDataCubit.fetchUserData();
    log('Fetched updated user data');
  }
}
