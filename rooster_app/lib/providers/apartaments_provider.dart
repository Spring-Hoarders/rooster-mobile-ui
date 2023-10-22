import 'package:flutter/material.dart';
import 'package:rooster_app/models/apartaments_models.dart';

class ApartamentsProvider extends ChangeNotifier {
  List<FloorModel> floors = [
    FloorModel(floorNumber: 1, apartaments: [
      ApartamentsModels(
          roomNumber: 101, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 102, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 103, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 104, people: '2/3', rooms: '2+1', avaiable: true),
    ]),
    FloorModel(floorNumber: 2, apartaments: [
      ApartamentsModels(
          roomNumber: 201, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 202, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 203, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 204, people: '2/3', rooms: '2+1', avaiable: true),
    ]),
    FloorModel(floorNumber: 3, apartaments: [
      ApartamentsModels(
          roomNumber: 301, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 302, people: '2/3', rooms: '2+1', avaiable: false),
      ApartamentsModels(
          roomNumber: 303, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 304, people: '2/3', rooms: '2+1', avaiable: false),
    ]),
    FloorModel(floorNumber: 4, apartaments: [
      ApartamentsModels(
          roomNumber: 401, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 402, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 403, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 404, people: '2/3', rooms: '2+1', avaiable: true),
    ]),
    FloorModel(floorNumber: 5, apartaments: [
      ApartamentsModels(
          roomNumber: 501, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 502, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 503, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 504, people: '2/3', rooms: '2+1', avaiable: true),
    ]),
    FloorModel(floorNumber: 6, apartaments: [
      ApartamentsModels(
          roomNumber: 601, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 602, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 603, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 604, people: '2/3', rooms: '2+1', avaiable: true),
    ]),
    FloorModel(floorNumber: 7, apartaments: [
      ApartamentsModels(
          roomNumber: 701, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 702, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 703, people: '2/3', rooms: '2+1', avaiable: true),
      ApartamentsModels(
          roomNumber: 704, people: '2/3', rooms: '2+1', avaiable: true),
    ]),
  ];

  int selectedFloor = 1;
  int floorIndex = 0;
  bool swipeProcessed = false;

  swipeToIncrementSelectFloorNumber() {
    if (floorIndex < floors.length - 1) {
      selectedFloor++;
      floorIndex++;
      swipeProcessed = true;
    }
    notifyListeners();
  }

  swipeToDecrementSelectFloorNumber() {
    if (floorIndex > 0) {
      selectedFloor--;
      floorIndex--;
      swipeProcessed = true;
    }
    notifyListeners();
  }

  stopDecInc() {
    swipeProcessed = false;
    notifyListeners();
  }

  tapToSelectFloorNumber(value, index) {
    selectedFloor = value;
    floorIndex = index;
    notifyListeners();
  }
}
