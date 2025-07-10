enum Routes {
  home('/home'),
  blog('/blog'),
  services('/services'),
  connectWithUs('/connect-with-us'),
  login('/login'),
  systemHome('/system/clients'),
  addClient('/system/clients/add'),
  editClient('/system/clients/edit');

  const Routes(this.path);

  final String path;

  @override
  String toString() => path;

  static final List<Routes> publicTabRoutes = [
    home,
    blog,
    services,
    connectWithUs,
  ];

  // Get tab index (or null if not a tab)
  int? get tabIndex =>
      publicTabRoutes.contains(this) ? publicTabRoutes.indexOf(this) : null;

  // Convert a path string to a Routes enum value
  static Routes fromPath(String path) {
    // Handle exact matches first
    for (final route in Routes.values) {
      if (route.path == path) {
        return route;
      }
    }
    // Default to home if no match found
    return Routes.home;
  }
}
