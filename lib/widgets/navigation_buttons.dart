part of cupcake.widgets;

class NavigationButtons extends StatelessWidget {

  const NavigationButtons({
    Key? key,
    this.onCancel,
    this.onNext,
    required this.viewModel
  }) : super(key: key);

  final VoidCallback? onCancel;
  final VoidCallback? onNext;

  final int? viewModel;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: onNext,
              style: ButtonStyle(
                backgroundColor: viewModel == null ? null : MaterialStatePropertyAll(Theme.of(context).colorScheme.primary) ,
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      );
}
