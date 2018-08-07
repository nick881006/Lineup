import 'dart:typed_data';

class Person {
  static final db_id = 'id';
  static final db_role = 'role';
  static final db_number = 'number';
  static final db_name = 'name';
  static final db_image = 'image';
  static final db_x = 'x';
  static final db_y = 'y';

  int id;
  String role;
  int number;
  String name;
  Uint8List image;
  double x;
  double y;

  Person({
    this.id,
    this.role,
    this.number,
    this.name,
    this.image,
    this.x,
    this.y,
  });

  Person.fromMap(Map<String, dynamic> map): this(
    id: map[db_id],
    role: map[db_role],
    number: map[db_number],
    name: map[db_name],
    image: map[db_image],
    x: map[db_x],
    y: map[db_y],
  );
}