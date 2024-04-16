part of cupcake.ui;

class QuantityView extends ViewModelWidget<CupcakeViewModel> {
  const QuantityView({Key? key, required this.viewModel1}) : super(key: key);
  static const String route = '/quantity';
  final CupcakeViewModel viewModel1;

  void navigateToFlavor(BuildContext context, String materia) {
    if (materia == "Matematicas") {
      viewModel1.setTipoMateria("Matematicas");
      Navigator.of(context).pushNamed(TipoMateriaView.route);
    }

    if (materia == "Fisica") {
      viewModel1.setTipoMateria("Fisica");
      Navigator.of(context).pushNamed(TipoMateriaView1.route);
    }

    if (materia == "Quimica") {
        viewModel1.setTipoMateria("Quimica");
        Navigator.of(context).pushNamed(FlavorView.route);
    }
  }

  @override
  Widget build(BuildContext context, CupcakeViewModel viewModel) {
    return Scaffold(
      appBar: CupcakeAppBar(title: 'FIME'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                'assets/fimeoso.svg',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                'ASESORIAS ACADEMICAS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  navigateToFlavor(context, "Matematicas");
                },
                child: const Text('MATEMATICAS'),
              ),
              ElevatedButton(
                onPressed: () {
                  navigateToFlavor(context, "Fisica");
                },
                child: const Text('FISICA'),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.setMateria("Quimica");
                  navigateToFlavor(context, "Quimica");
                },
                child: const Text('QUIMICA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
