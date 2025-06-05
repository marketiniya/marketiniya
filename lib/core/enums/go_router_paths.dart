enum GoRouterPaths {
  home('/home'),
  blog('/blog'),
  services('/services'),
  connectWithUs('/connect-with-us');

  const GoRouterPaths(this.path);
  final String path;

  @override
  String toString() => path;
}
