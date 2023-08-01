import 'package:get_it/get_it.dart';
import 'package:state_management/data/dummy_service.dart';
import 'package:state_management/data/services/item_service.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize() {
    _getIt.registerLazySingleton<ItemService>(() => DummyService());
  }
}
