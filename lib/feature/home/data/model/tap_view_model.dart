class TapViewModel {
  final String title;
  final String counter;

  TapViewModel({required this.title, required this.counter});
}

final List<TapViewModel> tapViewModel = [
  TapViewModel(title: 'قادم', counter: '0'),
  TapViewModel(title: 'سينطلق', counter: '0'),
  TapViewModel(title: 'جاري', counter: '0'),
  TapViewModel(title: 'منتهي', counter: '0'),
];
