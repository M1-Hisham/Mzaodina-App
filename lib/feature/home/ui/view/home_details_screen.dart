import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/app_button.dart';
import 'package:mzaodina_app/core/widgets/custom_app_bar.dart';
import 'package:mzaodina_app/core/widgets/custom_row_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_card_image_details.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_indcator_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_textItem.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_mazad_details.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: R.colors.whiteLight,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(title: 'مزاد على ايفون 16 برو من ابل'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 57,
                        vertical: 8,
                      ),
                      child: CustomIndcatorItem(title: 'نسبة انطلاق المزاد'),
                    ),

                    const SizedBox(height: 8),
                    CustomCardImageDetails(),
                    const SizedBox(height: 8),
                    CustomTextMazadDetails(),
                    const SizedBox(height: 8),
                    CoustomRowItem(
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
                      title: 'رسوم تنظيم',
                      price: '30.00 ',
                      style: R.textStyles.font14Grey3W500Light,
                      priceStyle: R.textStyles.font14primaryW500Light,
                    ),
                    CoustomRowItem(
                      title: 'انطلاق المزاد',
                      price: '30.00 ',
                      style: R.textStyles.font14Grey3W500Light,
                      priceStyle: R.textStyles.font14primaryW500Light,
                    ),
                    InkWell(
                      onTap:
                          () => showDialog<String>(
                            context: context,
                            builder:
                                (BuildContext context) => Dialog(
                                  child: Container(
                                    padding: const EdgeInsets.all(18.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'تعليمات المزاد',
                                            style: R
                                                .textStyles
                                                .font18GreyW500Light
                                                .copyWith(
                                                  color: R.colors.greyColor,
                                                ),
                                          ),
                                          ...taelimatAlmazad.map(
                                            (text) => CustomTextItem(
                                              text: text,
                                              style:
                                                  R
                                                      .textStyles
                                                      .font14BlackW500Light,
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          CustomElevatedButton(
                                            text: 'اغلاق',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ),

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            SvgPicture.asset(R.images.taelimatIcon),
                            SizedBox(width: 8),
                            Text(
                              'تعليمات المزاد',
                              style: R.textStyles.font16primaryW600Light,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    CustomTextMazadDetails(),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          tafasilAlmazad
                              .map((text) => CustomTextItem(text: text))
                              .toList(),
                    ),
                    SizedBox(height: 200),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  text: 'الانضمام للمزاد',
                  onPressed: () {},
                ),
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
