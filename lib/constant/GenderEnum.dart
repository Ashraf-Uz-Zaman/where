class GenderEnum {
  int id;
  String name;

  GenderEnum(this.id, this.name);

  static List<GenderEnum> getGenders() {
  return <GenderEnum>[
    GenderEnum(1, 'Male'),
    GenderEnum(2, 'Female'),
    GenderEnum(3, 'Other'),
  ];
  }

}
