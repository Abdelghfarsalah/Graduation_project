abstract class Bottomnavbarevent {}

class ChangeEvent extends Bottomnavbarevent {
  final int index;
  ChangeEvent({required this.index});
}
