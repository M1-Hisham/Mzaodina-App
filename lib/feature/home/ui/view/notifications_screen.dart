import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'الاشعارات'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: R.colors.blackColor3,

                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'تم اختيارك للفوز – أكمل الآن واحتفل بجائزتك!',
                              style: R.textStyles.font14BlackW500Light,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.invoiceDetailsScreenRoute,
                                );
                              },
                              child: Text(
                                'اضغط',
                                style: R.textStyles.font14primaryW500Light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8),

                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: R.colors.blackColor3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'تم اختيارك للفوز – أكمل الآن واحتفل بجائزتك!',
                              style: R.textStyles.font14BlackW500Light,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'اضغط',
                                style: R.textStyles.font14primaryW500Light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
