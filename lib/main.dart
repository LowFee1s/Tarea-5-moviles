import './view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './navigation_service.dart';

void main() {
  runApp(const ArtistEventsApp());
}

class ArtistEventsApp extends StatelessWidget {
  const ArtistEventsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CupcakeViewModel(),
      builder: (BuildContext context, CupcakeViewModel viewModel, _) =>
          MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: NavigationService.routes.keys.first,
        routes: NavigationService.routes,
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xFFd6125e),
            secondary: const Color(0xFFAB47BC),
          ),
        ),
      ),
    );
  }
}
