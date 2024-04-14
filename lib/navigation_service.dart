import './ui/ui.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static Map<String, Widget Function(BuildContext)> get routes => {
        QuantityView.route: (_) => const QuantityView(),
        FlavorView.route: (_) => const FlavorView(),
        DateView.route: (_) => const DateView(),
        SummaryView.route: (_) => const SummaryView(),
      };
}
