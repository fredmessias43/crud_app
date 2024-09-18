import 'package:crud_app/src/contracts/model.dart';

List<T> upsertArray<T extends Model>(List<T> array, T item) {
  final index = array.indexWhere((element) {
    final itemValue = item.id;
    final elementValue = element.id;
    return itemValue == elementValue;
  });

  if (index == -1) {
    return [...array, item];
  }

  return array.map((element) {
    final itemValue = item.id;
    final elementValue = element.id;
    if (itemValue == elementValue) {
      return item;
    }

    return element;
  }).toList();
}

List<T> removeArray<T extends Model>(List<T> array, String id) {
  return array.where((element) => element.id != id).toList();
}
