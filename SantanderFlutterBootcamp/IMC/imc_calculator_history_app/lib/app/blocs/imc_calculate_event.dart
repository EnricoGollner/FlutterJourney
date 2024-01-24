abstract class IMCCalculateEvent{}

class IMCCalculateLoadEvent extends IMCCalculateEvent {}

class IMCCalculateAddIMCEvent extends IMCCalculateEvent {
  final double height;
  final double weight;

  IMCCalculateAddIMCEvent(this.height, this.weight);
}

class IMCCalculateDeleteEvent extends IMCCalculateEvent {
  final int id;

  IMCCalculateDeleteEvent({required this.id});
}