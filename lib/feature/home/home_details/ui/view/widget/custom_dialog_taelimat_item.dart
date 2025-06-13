import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';

import 'package:mzaodina_app/feature/profile/view_model/auction_terms_cubit/auction_terms_cubit.dart';

class CustomDialogTaelimatItem extends StatelessWidget {
  const CustomDialogTaelimatItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.7,
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: R.colors.whiteLight,
          borderRadius: BorderRadius.circular(22),
        ),
        child: BlocProvider(
          create: (context) => getIt<AuctionTermsCubit>()..getAuctionTerms(),

          child: Column(
            children: [
              BlocBuilder<AuctionTermsCubit, AuctionTermsState>(
                builder: (context, state) {
                  if (state is AuctionTermsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AuctionTermsError) {
                    return Center(child: Text(state.message));
                  } else if (state is AuctionTermsSuccess) {
                    final data = state.data.data;
                    return Expanded(
                      child: ListView.builder(
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
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              CustomElevatedButton(
                text: 'اغلاق',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
