//导入 https://dart.cn/samples#imports
import 'dart:math';
import 'dart:io';
import 'dart:async';

//你好，世界！ https://dart.cn/samples#hello-world
void hello() {
  print('Hello, world!');
}

//变量 https://dart.cn/samples#variables
void Variables() {
  var name = 'Voyager';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['satyrn'],
    'url': '//path/to/saturn.jpg'
  };
  print(name);
  print(year);
  print(antennaDiameter);
  print(flybyObjects);
  print(image);
}

//流程控制语句 https://dart.cn/samples#control-flow-statements
void Control_flow_statements() {
  var year = 2002;
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}

//函数 https://dart.cn/samples#functions
int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

bool is_hit(String line, String target) {
  return line.contains(target);
}

void functions() {
  var fib = fibonacci(9);
  print('fib 9 is $fib');

  var flybyObjects = [
    'hello',
    'abc',
    '123',
    'how do you do',
    'nice to meet you'
  ];
  flybyObjects.where((name) => name.contains('you')).forEach(print);

  var hit_lines = flybyObjects.where((x) => is_hit(x, 'o'));
  for (var one in hit_lines) {
    print('one is $one');
  }
}

//注释 https://dart.cn/samples#comments
//Dart 通常使用双斜杠 // 作为注释的开始。
/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。
/* 也可以像这样使用单斜杠和星号的注释方式 */

//类 https://dart.cn/samples#classes
class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;

  //构造函数
  Spacecraft(this.name, this.launchDate) {
    //初始化代码在这里。
  }

  //转发到默认构造函数的命名构造函数。
  Spacecraft.unlaunched(String name) : this(name, null);

  //方法
  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//扩展类（继承） https://dart.cn/samples#inheritance
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  void describe() {
    super.describe();
    print('altitude is $altitude km');
  }
}

//Mixin https://dart.cn/samples#mixins
//Mixin是一种在多个类层次结构中重用代码的方法。下面的是声明一个 Mixin 的做法：
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

//现在你只需使用 Mixin 的方式继承这个类就可将该类中的功能添加给其它类。
class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime? launchDate) : super(name, launchDate);
}

//接口和抽象类 https://dart.cn/samples#interfaces-and-abstract-classes
//Dart 没有 interface 关键字。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现。
//可以创建一个被任意具体类扩展（或实现）的抽象类。抽象类可以包含抽象方法（不含方法体的方法）。
class MockSpaceship implements Spacecraft {
  DateTime? launchDate;
  String name;

  MockSpaceship(this.name, this.launchDate);

  void describe() {
    print('Mock Spacecraft: $name');
  }

  int? get launchYear => launchDate?.year;
}

//异步 https://dart.cn/samples#async
//使用 async 和 await 关键字可以让你避免回调地狱（Callback Hell）并使你的代码更具可读性。
Future<void> the_async() async {
  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['文件1', '文件2', '文件3'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

//异常 https://dart.cn/samples#exceptions
Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

Future<void> main() async {
  print('以下为<你好，世界>测试');
  hello(); //你好，世界！
  print('———————————————————————————————————————————————————————');

  print('以下为<变量>测试');
  Variables(); //变量
  print('———————————————————————————————————————————————————————');

  print('以下为<流程控制语句>测试');
  Control_flow_statements(); //流程控制语句
  print('———————————————————————————————————————————————————————');

  print('以下为<函数>测试');
  var fib20 = fibonacci(20); //函数
  var result = '第20个斐波那契数是' + fib20.toString();
  print(result + '\n');
  functions();
  print('———————————————————————————————————————————————————————');

  print('以下为<注释>测试');
  print('//');
  print('///');
  print('/*  */');
  print('———————————————————————————————————————————————————————');

  print('以下为<导入>测试');
  print('import \'dart:math\'');
  print('import \'dart:io\'');
  print('———————————————————————————————————————————————————————');

  print('以下为<类>测试');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
  print('———————————————————————————————————————————————————————');

  print('以下为<扩展类>测试');
  var obt = Orbiter('嫦娥号', DateTime(2022, 4, 12), 344.2);
  obt.describe();
  print('———————————————————————————————————————————————————————');

  print('以下为<Mixin>测试');
  var plt = PilotedCraft('嫦娥1号', DateTime(2018, 1, 1));
  plt.describe();
  plt.describeCrew();
  print('———————————————————————————————————————————————————————');

  print('以下为<接口和抽象类>测试');
  var mock = MockSpaceship('测试<接口和抽象类>', null);
  mock.describe();
  print('———————————————————————————————————————————————————————');

  print('以下为<异步>测试');
  await the_async();
  print('———————————————————————————————————————————————————————');

  print('以下为<异常>测试');
  var file = ['文件1', '文件2', '文件3', '文件4'];
  show_descriptions(file);
  print('———————————————————————————————————————————————————————');
}
