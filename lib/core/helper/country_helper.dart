import 'package:uni_country_city_picker/uni_country_city_picker.dart';

class CountryHelper {
  /// بيرجع الـ ISO Code من Dial Code زي '+966' → 'SA'
  static Future<String> getIsoFromDialCode(
    String dialCode, {
    String fallbackIso = 'EG',
  }) async {
    final countries = await UniCountryServices.instance.getCountriesAndCities();

    final matched = countries.firstWhere(
      (c) => c.dialCode == dialCode,
      orElse: () => Country(
        name: 'Unknown',
        nameEn: 'Unknown',
        dialCode: dialCode,
        flag: '',
        isoCode: fallbackIso,
        cities: [],
        phoneDigitsLength: 0,
        phoneDigitsLengthMax: 0,
      ),
    );

    return matched.isoCode;
  }

  /// بيرجع Dial Code من ISO Code زي 'SA' → '+966'
  static Future<String> getDialCodeFromIso(
    String isoCode, {
    String fallbackDialCode = '+000',
  }) async {
    final countries = await UniCountryServices.instance.getCountriesAndCities();

    final matched = countries.firstWhere(
      (c) => c.isoCode.toUpperCase() == isoCode.toUpperCase(),
      orElse: () => Country(
        name: 'Unknown',
        nameEn: 'Unknown',
        dialCode: fallbackDialCode,
        flag: '',
        isoCode: isoCode,
        cities: [],
        phoneDigitsLength: 0,
        phoneDigitsLengthMax: 0,
      ),
    );

    return matched.dialCode;
  }

  /// بيرجع الـ Emoji Flag من ISO Code
  static String getFlagFromIsoCode(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 127397),
    );
  }
}
