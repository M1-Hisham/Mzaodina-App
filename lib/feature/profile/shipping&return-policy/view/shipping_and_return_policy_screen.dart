import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';
import 'package:mzaodina_app/feature/profile/view_model/shipping_cubit/shipping_cubit.dart';

class ShippingAndReturnPolicyScreen extends StatelessWidget {
  const ShippingAndReturnPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,

      body: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 21),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'سياسة الشحن والإرجاع'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 18),
                child: BlocBuilder<ShippingCubit, ShippingState>(
                  builder: (context, state) {
                    if (state is ShippingLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ShippingError) {
                      return Center(child: Text(state.message));
                    } else if (state is ShippingSuccess) {
                      final data = state.data.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final htmlContent = data[index];
                          return HtmlWidget(
                            htmlContent,
                            textStyle: R.textStyles.font14Grey3W500Light
                                .copyWith(height: 1.8),
                          );
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
