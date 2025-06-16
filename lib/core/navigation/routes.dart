enum Routes {
  home('/home'),
  blog('/blog'),
  services('/services'),
  connectWithUs('/connect-with-us'),
  login('/login'),
  systemHome('/system/clients');

  const Routes(this.path);
  final String path;

  @override
  String toString() => path;
}
