class Usuario {
  int? id, score;
  String? name, genre;
  Usuario({this.id,this.name,this.genre,this.score});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'genre': genre, 'score': score};
  }
}