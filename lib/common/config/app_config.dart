class AppConfig{
  static final bool isDebug = bool.fromEnvironment("dart.vm.product") == false;
}