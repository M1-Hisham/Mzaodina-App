import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_text_item.dart';

class CustomDialogTaelimatItem extends StatelessWidget {
  const CustomDialogTaelimatItem({super.key});

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
