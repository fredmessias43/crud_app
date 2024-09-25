import 'package:crud_app/app/core/widgets/crud_app_scaffold.dart';
import 'package:flutter/widgets.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CrudAppScaffold(
      child: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
