enum GoRouterPaths {
  home('/home'),
  blog('/blog'),
  services('/services'),
  connectWithUs('/connect-with-us'),
  login('/login'),
  systemHome('/system/clients');

  const GoRouterPaths(this.path);
  final String path;

  @override
  String toString() => path;
}
