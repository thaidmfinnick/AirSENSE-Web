

class SampleDatabase {
  String firstName;
  String lastName;

  SampleDatabase({this.firstName, this.lastName});

  static List<SampleDatabase> getUsers() {
    return <SampleDatabase>[
      SampleDatabase(firstName: "Aaryan", lastName: "Shah"),
      SampleDatabase(firstName: "Ben", lastName: "John"),
      SampleDatabase(firstName: "Carrie", lastName: "Brown"),
      SampleDatabase(firstName: "Deep", lastName: "Sen"),
      SampleDatabase(firstName: "Emily", lastName: "Jane"),
    ];
  }
}