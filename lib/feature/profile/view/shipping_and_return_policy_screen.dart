import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/profile/view/widget/custom_appbar_accounet.dart';

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'الشحن',
                        style: R.textStyles.font18primaryW500Light,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'وسائل الدفع: باستخدام المدفوعات الإلكترونية',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[0],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'رسوم الشحن',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[1],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'مدة الشحن',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[2],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'ملاحظات',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[3],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 34),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'الاسترجاع',
                        style: R.textStyles.font18primaryW500Light,
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'سياسة الاستبدال والاسترجاع',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[4],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'شروط الاستبدال و الاسترجاع',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[5],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'أحكام عامة',
                        style: R.textStyles.font18blackW500Light,
                      ),
                    ),
                    Text(
                      shippingAndReturnPolicyList[6],
                      style: R.textStyles.font14Grey3W500Light.copyWith(
                        height: 1.5,
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

List<String> shippingAndReturnPolicyList = [
  'عدة وسائل لدفع الإلكترونية تلبية لرغبة العميل وحيث مكان يستطيع الدفع بكل أمان وموثوقية وبكل يسر وسهولة مع افضل مزودين خدمات الدفع الإلكترونية .',
  'الشحن مجاني لدينا وعلية نحن نتحمل جميع رسوم شحن المنتج للعميل داخل وخارج المملكة العربية السعودية .',
  'يتم شحن المنتج بعد ترسيه المزاد بمدة تقريبية 25 يوم وهذه المدة تقريبية ، وقد تزيد أو تنقص حسب الظروف وشركة الشحن المختارة، وخصوصا في فترات التخفيضات، وتحتسب مدة الشحن من وقت استلام شركة الشحن للطلب . سواء كان العميل داخل أو خارج المملكة العربية السعودية',
  'يعد العميل مسؤولاً مسؤولية كاملة عن صحة العنوان، ويتحمل كافة الرسوم المفروضة على المتجر بسبب إدخاله للعنوان بشكل خاطئ. لا تتوفر خدمة الحضور والاستلام المنتج حاليا، جميع الطلبات يتم شحنها فقط .',
  'إذا كنت غير راض عن المنتج لوجود عيب حدث للمنتج خلال عملية الشحن أو وصلكم منتج مختلف عن طلبكم فكل ما تقوم به هو التواصل مع خدمة العملاء عن طريق الواتس أب 00966533576110',
  'يجب أن يكون المنتج جديد ولم يستعمل .\nيجب أن يكون التغليف بحالته الأصلية وغير تالف.\nوجود الفاتورة الأصلية',
  'يتحمل العميل تكاليف الشحن./nفي حال وجود عيب مصنعي في المنتج فإننا نتحمل تكاليف الشحن\nتستغرق عملية الاستبدال أو الاسترجاع خلال 7 أيام عمل من استلام السلعة',
];
