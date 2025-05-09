import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/join_the_auction.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';

class HomeDetailsQadimScreen extends StatelessWidget {
  const HomeDetailsQadimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteLight,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CustomAppBar(title: 'مزاد على ايفون 16 برو من ابل'),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 41,
                      vertical: 8,
                    ),
                    child: CustomIndcatorItem(
                      title: 'نسبة انطلاق المزاد',
                      showIndicator: true,
                    ),
                  ),

                  const SizedBox(height: 8),
                  CustomCardImageDetails(),
                  const SizedBox(height: 8),
                  CustomTextMazadDetails(title: 'تفاصيل المزاد'),
                  const SizedBox(height: 8),
                  CoustomRowItem(
                    containerColor: R.colors.blackColor2,
                    title: 'سعر المنتج بالأسواق',
                    price: '1000.00 ',
                    style: R.textStyles.font14Grey3W500Light,
                    priceStyle: R.textStyles.font14primaryW500Light,
                  ),
                  CoustomRowItem(
                    title: ' بداية المزاد',
                    price: '600.00 ',
                    style: R.textStyles.font14Grey3W500Light,
                    priceStyle: R.textStyles.font14primaryW500Light,
                  ),
                  CoustomRowItem(
                    containerColor: R.colors.blackColor2,

                    title: 'رسوم تنظيم',
                    price: '30.00 ',
                    style: R.textStyles.font14Grey3W500Light,
                    priceStyle: R.textStyles.font14primaryW500Light,
                  ),
                  CustomIndcatorItem(
                    title: 'انطلاق المزاد',
                    showIndicator: false,
                    style: R.textStyles.font14Grey3W500Light,
                  ),
                  Container(
                    color: R.colors.blackColor2,

                    child: Row(
                      children: [
                        Text(
                          'الحالة',
                          style: R.textStyles.font14Grey3W500Light,
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: R.colors.primaryColorLight,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            'قادم',
                            style: R.textStyles.font10whiteW500Light,
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap:
                        () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => CustomDialogItem(),
                        ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset(R.images.taelimatIcon),
                          const SizedBox(width: 8),
                          Text(
                            'تعليمات المزاد',
                            style: R.textStyles.font16primaryW600Light,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextMazadDetails(title: 'تفاصيل المنتج'),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        tafasilAlmazad
                            .map((text) => CustomTextItem(text: text))
                            .toList(),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: CustomElevatedButton(
          text: 'الانضمام للمزاد',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JoinTheAuction()),
            );
          },
        ),
      ),
    );
  }
}

class CustomDialogItem extends StatelessWidget {
  const CustomDialogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: R.colors.whiteLight,
          borderRadius: BorderRadius.circular(22),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'تعليمات المزاد',
                style: R.textStyles.font18GreyW500Light.copyWith(
                  color: R.colors.greyColor,
                ),
              ),
              ...taelimatAlmazad.map(
                (text) => CustomTextItem(
                  text: text,
                  style: R.textStyles.font12Grey3W500Light.copyWith(
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 12),
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

final List<String> tafasilAlmazad = [
  'يدعم الهاتف خاصية الـ NFC .',
  'يدعم الهاتف شريحة اتصال من نوع Nano SIM وشريحة اتصال من نوع eSIM. هذا النص طويل للتجربة وسيأخذ أكثر من سطر.',
  'يدعم شبكات الاتصال الجيل الثاني الـ 2G والجيل الثالث الـ 3G والجيل الرابع الـ 4G والجيل الخامس الـ 5G .',
  'يأتي الهاتف بأبعاد 146.7×71.5×7.8 ملم مع وزن 167 جرام .',
  'الخامات المستخدمة في الهاتف تأتي من الزجاج مع إطار من معدن الالمونيوم .',
  'يأتي الهاتف مقاومًا للماء والغبار بشهادة الـ IP68 المقاوم للماء حتى 6 متر لمدة نصف ساعة .',
  'يدعم زر Action Button لتخصيصه لفتح اي تطبيق بسهولة .',
  'الشاشة تأتي بشكل النوتش من نوع Super Retina XDR OLED بمساحة 6.1 إنش بدقة 1170×2532 بكسل مع معدل كثافة بكسلات 457 بكسل لكل إنش مع دعم الـ HDR10 مع طبقة حماية Ceramic Shield وسطوع يصل الي 1200 شمعة .',
  'يأتي بذاكرة صلبة بسعة 128 جيجا بايت مع ذاكرة عشوائية بسعة 8 جيجا بايت .',
  'منفذ الـ USB يأتي من نوع Type-C 2.0 .',
];
final List<String> taelimatAlmazad = [
  'التسجيل في الموقع.',
  'اختيار المنتج المراد المزايدة عليه.',
  'دفع الرسوم التنظيمية.',
  'انتظار نقل المنتج إلى قسم "جاري".',
  'الحرص على أن تكون المزايد الأعلى.',
  'انتظار إغلاق المزاد الجاري.',
  'إذا كنت المزايد الأعلى، ستصلك فاتورة الدفع.',
  'عليك دفع الفاتورة قبل انتهاء الوقت المتاح للدفع. ',
  'يسقط حقك في الحصول على المنتج في حال انتهاء وقت الدفع دون سداد.',
  'يتم إرسال الفاتورة للمزايد الحاصل على المركز الثاني في حال عدم سداد الفاتورة من قبل المزايد الأول.',
  'يجب عليك تعبئة بيانات الشحن بعد دفع الفاتورة.',
  'انتظار وصول المنتج من قبل شركة الشحن.',
];
