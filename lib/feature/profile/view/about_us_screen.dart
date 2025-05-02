import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomAppBarAccount(title: 'من نحن'),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 18),
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  style: R.textStyles.font14Grey3W500Light.copyWith(
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'هذه المنصة مملوكة لمؤسسة مزاود اين للتجارة\n',
                    ),
                    TextSpan(text: '. سجل تجاري رقم '),
                    TextSpan(
                      text: '1010984690\n',
                      style: R.textStyles.font16primaryW600Light.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(text: '. شهادة توثيق التجارة الإلكترونية رقم '),
                    TextSpan(
                      text: '0000104231\n',
                      style: R.textStyles.font16primaryW600Light.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(text: 'المملكة العربية السعودية. مدينة الرياض\n'),
                    TextSpan(
                      text:
                          'كل المواد المتوفرة في هذه المنصة بما في ذلك على سبيل المثال لا الحصر النصوص والرسومات التصويرية للمعلومات والبرمجيات (المحتويات) محمية بموجب حقوق النشر والعلامات التجارية وأشكال حقوق الملكية الأخرى. وعلى الجانب الآخر فلا يجوز بأي شكل من الأشكال بيع أو ترخيص أو تأجير أو تعديل أو نسخ أو استنساخ أو إعادة طبع أو تحميل أو إعلان أو نقل أو توزيع أو العرض بصورة علنية أو تحرير أو إنشاء أعمال مشتقة من أي مواد أو محتويات من هذه المنصة للجمهور أو لأغراض تجارية دون الحصول على الموافقة الخطية المسبقة من منصة مزاودين للمزادات بالمملكة العربية السعودية.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  style: R.textStyles.font14Grey3W500Light.copyWith(height: 2),
                  children: [
                    TextSpan(text: 'الرئيس التنفيذي : '),
                    TextSpan(
                      text: ' فهد القحطاني \n',
                      style: R.textStyles.font16primaryW600Light.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(text: '  CEO@mzaodin.com \n'),
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
