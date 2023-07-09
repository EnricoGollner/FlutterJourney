class User {
  final String name;
  final String email;
  final String image;

  User({
    required this.name,
    required this.email,
    required this.image,
  });
}

final List<User> allUsers = [
  User(
    name: 'Robert Myers',
    email: 'robbert_myers@gmail.com',
    image:
        'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
  ),
  User(
    name: 'Glenda Myers',
    email: 'glenda_tech@gmail.com',
    image:
        'https://images.unsplash.com/photo-1578774296842-c45e472b3028?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=673&q=80',
  ),
];
