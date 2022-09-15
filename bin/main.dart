import 'dart:async';

class Human {
  String name;
  int age;
  bool sex;     // true - male

  Human(this.name, this.age, this.sex);
}

void aped(StreamController belt, int i) {
  belt.add(Human("te" * (i + 1), i * 3, (i % 2) == 0 ? false : true));
}

void main() {

  StreamController<Human> belt = StreamController();
  belt.stream.listen((event) {
    if (event.sex) { print(event.name); print(event.age); }
  });

  Stream<int> cout = Stream.periodic(Duration(seconds: 1), (tick) => tick);
  StreamSubscription<int> subs = cout.listen((event) {
    aped(belt, event);
  });

  Future.delayed(Duration(seconds: 10)).then((value) { subs.cancel(); }) ;
}