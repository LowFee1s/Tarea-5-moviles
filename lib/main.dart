import './view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './navigation_service.dart';

void main() {
  final viewModel = CupcakeViewModel();
  final navigationService = NavigationService(viewModel1: viewModel);
  runApp(ArtistEventsApp(navigationService: navigationService));
}

class ArtistEventsApp extends StatelessWidget {
  final NavigationService navigationService;

  const ArtistEventsApp({Key? key, required this.navigationService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CupcakeViewModel(),
      builder: (BuildContext context, CupcakeViewModel viewModel, _) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: navigationService.routes.keys.first,
            routes: navigationService.routes,
            theme: ThemeData(
              colorScheme: const ColorScheme.light().copyWith(
                primary: const Color(0xFF000000), //TEXTO de opciones
                secondary: const Color(0xFF00C853),
              ),
            ),
          ),
    );
  }
}

