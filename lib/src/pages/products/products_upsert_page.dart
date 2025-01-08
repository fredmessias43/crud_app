// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_app/src/core/router/route_config.dart';
import 'package:crud_app/src/core/router/route_data.dart';
import 'package:crud_app/src/modules/products/widget/products_upsert_form.dart';
import 'package:flutter/material.dart';

import 'package:crud_app/src/core/widgets/app_scaffold.dart';

class ProductUpsertPage extends StatelessWidget {
  const ProductUpsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    var id = RouteConfig.currentRouteModel!.pathParameters!["productId"];

    return AppScaffold(
      title: Text('${id != null ? 'Editar' : 'Criar'} Produto'),
      child: ProductUpsertForm(
        id: id,
        afterSubmit: () {
          RouteConfig.push(RoutePath.productsIndex.name);
        },
      ),
    );
  }
}
