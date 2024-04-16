import 'package:cupcake_orders/view_model.dart';

import './ui/ui.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final CupcakeViewModel viewModel1;

  NavigationService({required this.viewModel1});
  Map<String, Widget Function(BuildContext)> get routes => {
        QuantityView.route: (_) => QuantityView(viewModel1: viewModel1),
        FlavorView.route: (_) => const FlavorView(),
        TipoMateriaView.route: (_) => const TipoMateriaView(),
        TipoMateriaView1.route: (_) => const TipoMateriaView1(),
        TimeAsesoria.route: (_) => const TimeAsesoria(),
        DateView.route: (_) => const DateView(),
        SummaryView.route: (_) => const SummaryView(),
      };
}
