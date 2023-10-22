class FloorModel {
  int? floorNumber;
  List<ApartamentsModels>? apartaments;

  FloorModel({
    this.floorNumber,
    this.apartaments,
  });
}

class ApartamentsModels {
  int? roomNumber;
  String? people;
  String? rooms;
  bool? avaiable;

  ApartamentsModels({
    this.roomNumber,
    this.people,
    this.rooms,
    this.avaiable,
  });
}
