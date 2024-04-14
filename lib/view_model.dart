import './ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class CupcakeViewModel extends BaseViewModel {
  int? _quantity;
  int? _flavorIdx;
  int? _dateIdx;

  int get quantity => _quantity ?? 0;
  String get flavor => _flavorIdx != null ? flavors[_flavorIdx!] : '';
  String get date => _dateIdx != null ? dates[_dateIdx!] : '';

  int? get flavorIdx => _flavorIdx;
  int? get dateIdx => _dateIdx;

  num get _basePrice => 2.5;
  num get subtotal => (_quantity ?? 0) * _basePrice;
  String get formattedSubtotal => '\$${subtotal.toStringAsFixed(2)}';

  List<String> get flavors => [
        'Vanilla',
        'Chocolate',
        'Red Velvet',
        'Salted Caramel',
        'Coffee',
      ];

  List<String> get dates => [
        'Fri Dec 11',
        'Sat Dec 12',
        'Sun Dec 13',
        'Mon Dec 14',
      ];

  String get summary => '''
New Cupcake Order

Quantity: $_quantity cupcakes
Flavor: $flavor
Pickup date: $date
Total: $formattedSubtotal

Thank You!
''';

  Future<bool> sendOrder() async {
    Uri uri = Uri.parse('mailto:?subject=New Cupcake Order&body=$summary');
    return await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  void reset() {
    _quantity = null;
    _flavorIdx = null;
    _dateIdx = null;
  }

  void cancel(BuildContext context) {
    reset();
    Navigator.of(context).popUntil(ModalRoute.withName(QuantityView.route));
  }

  void setQuantity(int value) {
    _quantity = value;
  }

  void setFlavorIdx(int? value) {
    _flavorIdx = value;
    notifyListeners();
  }

  void setDateIdx(int? value) {
    _dateIdx = value;
    notifyListeners();
  }
}
