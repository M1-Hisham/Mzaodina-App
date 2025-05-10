import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:uni_country_city_picker/uni_country_city_picker.dart';

/// [UniCountryServices] is a class that provides services for countries and cities.
final _uniCountryServices = UniCountryServices.instance;

class CountriesAndCitiesView extends StatefulWidget {
  final bool? country;
  final Function(Country) onCountrySelected;
  const CountriesAndCitiesView({
    super.key,
    required this.onCountrySelected,
    this.country,
  });

  @override
  State<CountriesAndCitiesView> createState() => _CountriesAndCitiesViewState();
}

class _CountriesAndCitiesViewState extends State<CountriesAndCitiesView> {
  /// List of countries and cities
  List<Country> countriesAndCities = [];

  @override
  void initState() {
    super.initState();
    // Get the countries and cities on init of the view
    _getCountriesAndCities();
  }

  /// Get the countries and cities from the package
  Future _getCountriesAndCities() async {
    countriesAndCities = await _uniCountryServices.getCountriesAndCities();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: countriesAndCities.length,
        itemBuilder: (_, i) {
          Country country = countriesAndCities[i];
          return ListTile(
            onTap: () {
              widget.onCountrySelected(country);
            },
            title: Text(
              widget.country == true
                  ? "${country.flag} ${country.name}"
                  : "${country.dialCode} ${country.name} ${country.flag}",
              style: R.textStyles.font16BlackW400Light,
            ),
          );
        },
      ),
    );
  }
}
