class UserInfo {
  const UserInfo({required this.id, required this.userId, required this.firstName, required this.lastName, required this.datePasswordUpdate, required this.image, required this.notification});

  final String id;
  final String userId;
  final String? firstName;
  final String? lastName;
  final DateTime datePasswordUpdate;
  final String? image;
  final bool notification;
}