class DependencyManager {
  static final DependencyManager _instance = DependencyManager._internal();
  final Map<Type, dynamic Function()> _builders = {};

  DependencyManager._internal();

  factory DependencyManager() {
    return _instance;
  }

  static DependencyManager get instance => _instance;

  void registerBuilder<T>(dynamic Function() builder) {
    _builders[T] = builder;
  }

  T get<T>() {
    return _builders[T]!() as T;
  }
}
