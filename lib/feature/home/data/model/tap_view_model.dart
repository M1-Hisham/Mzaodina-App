class TapViewModel {
  final String title;
  final String counter;

  TapViewModel({required this.title, required this.counter});
}

 List<TapViewModel> tapViewModel = [
  TapViewModel(title: 'قادم', counter: '1'),
  TapViewModel(title: 'سينطلق', counter: '1'),
  TapViewModel(title: 'جاري', counter: '1'),
  TapViewModel(title: 'منتهي', counter: '1'),
];
