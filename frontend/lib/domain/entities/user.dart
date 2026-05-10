class User {
  final int id;
  final String name;
  final String email;
  final String? avatarUrl;
  final int xp;
  final int level;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.xp = 0,
    this.level = 1,
  });
}
