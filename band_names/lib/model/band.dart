class Band {
  String id;
  String name;
  int votes;

  Band({this.id = '', this.name = '', this.votes = 0});

  factory Band.fromMap(Map<String, dynamic> obj) =>
    Band(
      id   : obj.containsKey('id')    ? obj['id'] : 'no-id',
      name : obj.containsKey('name')  ? obj['name'] : 'no-name',
      votes: obj.containsKey('votes') ? obj['votes']: 0
    );
  /**
    factori constructor tiene como objetivo regresar una nueva instancia de la clase.
    Mediante Band.fromMap() tambien se puede crear recibiendo un objeto
   */
}
