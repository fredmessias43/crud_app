// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_app/app/modules/products/widget/products_upsert_form.dart';
import 'package:crud_app/routes.g.dart';
import 'package:flutter/material.dart';

import 'package:crud_app/app/core/widgets/crud_app_scaffold.dart';
import 'package:routefly/routefly.dart';

class ProductNewPage extends StatelessWidget {
  const ProductNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Routefly.query['id'] as String?;

    return CrudAppScaffold(
      title: Text('${id != null ? 'Editar' : 'Criar'} Produto'),
      child: ProductUpsertForm(
        id: id,
        afterSubmit: () {
          Routefly.navigate(routePaths.products as String);
        },
      ),
    );
  }
}
