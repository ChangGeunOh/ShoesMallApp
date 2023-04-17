
abstract class DetailEvent {}

class OnClickColor extends DetailEvent {
  final int index;

  OnClickColor(this.index);
}

class OnClickSize extends DetailEvent {
  final int? index;

  OnClickSize(this.index);
}
