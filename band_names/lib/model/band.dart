class Band {
  String id;
  String name;
  int votes;

  Band({this.id = '', this.name = '', this.votes = 0});

  factory Band.fromMap(Map<String, dynamic> obj) =>
      Band(id: obj['id'], name: obj['name'], votes: obj['votos']);
  /**
    factori constructor tiene como objetivo regresar una nueva instancia de la clase.
    Mediante Band.fromMap() tambien se puede crear recibiendo un objeto
   */
}
