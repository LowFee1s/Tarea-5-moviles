import './ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class CupcakeViewModel extends BaseViewModel {
  String? _materia;
  String? _tipomateria;
  String? _timeasesoria11;
  int? _flavorIdx;
  int? _dateIdx;
  int? _timeasesoria;

  String get materia => _materia ?? "";
  String get timeasesoria11 => _timeasesoria11 ?? "";
  String get tipomateria => _tipomateria ?? "";
  String get flavor => _flavorIdx != null ? flavors[_flavorIdx!] : '';
  String get matematicas => _flavorIdx != null ? MateriasMatematicas[_flavorIdx!] : '';
  String get fisica => _flavorIdx != null ? MateriasFisica[_flavorIdx!] : '';
  String get date => _dateIdx != null ? dates[_dateIdx!] : '';
  String get timeasesoria15 => _timeasesoria != null ? timeasesoria1[_timeasesoria!] : '';

  int? get flavorIdx => _flavorIdx;
  int? get dateIdx => _dateIdx;
  int? get timeasesoria => _timeasesoria;

  num get _basePrice => 0;
  num get subtotal => (1) * _basePrice;
  String get formattedSubtotal => '\$${subtotal.toStringAsFixed(2)}';

  List<String> get flavors => [
        'Unidad Tematica #1',
        'Unidad Tematica #2',
        'Unidad Tematica #3',
        'Unidad Tematica #4',
        'Unidad Tematica #5',
      ];

  List<String> get MateriasMatematicas => [
        'Matematicas 1',
        'Matematicas 2',
        'Matematicas 3',
        'Matematicas 4',
      ];

 List<String> get MateriasFisica => [
        'Fisica 1',
        'Fisica 2',
        'Fisica 3',
        'Fisica 4',
      ];

  List<String> get dates => [
        'Lun Abril 15',
        'Mar Abril 16',
        'Mie Abril 17',
        'Jue Abril 18',
      ];

  List<String> get timeasesoria1 => [
          '9:40 AM',
          '12:00 PM',
          '2:30 PM',
          '5:00 PM',
      ];

  String get summary => '''
Asesoria agendada

Materia: $_materia 
UT: $flavor
Dia: $date
Hora: $_timeasesoria11

Elaboro: Equipo 4
Practica 5

Gracias!
''';

  Future<bool> sendOrder() async {
    Uri uri = Uri.parse('mailto:?subject=Asesoria Academica FIME&body=$summary');
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    return true;
  }

  void reset() {
    _materia = null;
    _tipomateria = null;
    _flavorIdx = null;
    _timeasesoria = null;
    _dateIdx = null;
  }

  void cancel(BuildContext context) {
    reset();
    Navigator.of(context).popUntil(ModalRoute.withName(QuantityView.route));
  }

  void setMateria(String value) {
    _materia = value;
  }

  void setTipoMateria(String value) {
    _tipomateria = value;
  }

  void setTimeAsesoria(String value) {
    _timeasesoria11 = value;
  }

  void setFlavorIdx(int? value) {
    _flavorIdx = value;
    notifyListeners();
  }

  void setTimeasesoriaIdx(int? value) {
    _timeasesoria = value;
    notifyListeners();
  }

  void setDateIdx(int? value) {
    _dateIdx = value;
    notifyListeners();
  }

}
