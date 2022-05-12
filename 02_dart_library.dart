import 'dart:math';

///dart:core - 数字，集合，字符串等 https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more

//控制台打印 https://dart.cn/guides/libraries/library-tour#printing-to-the-console
void Printing_to_the_console() {
  print(Object);
  var tea = '红茶';
  print('I drink $tea');
}

//数字 https://dart.cn/guides/libraries/library-tour#numbers
void Numbers() {
  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
  String number_42 = '42';
  if (int.parse(number_42) == 42) {
    print('字符串\'$number_42\'转换为整型是：$number_42');
  } else {
    print('字符串\'$number_42\'转换为整型不是：$number_42');
  }
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //使用 num 的 parse() 方法，判断数据类型（整型或双浮点型）：
  if (num.parse('42') is int) {
    print('字符串\'$number_42\'是整型');
  } else {
    print('字符串\'$number_42\'不是整型');
  }
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //通过添加 radix 参数，指定整数的进制基数：
  var number_0x42 = int.parse('42', radix: 16);
  assert(int.parse('42', radix: 16) == 66);
  print('字符串\'$number_42\'（十六进制）转换为整数为：$number_0x42（十进制）');

  //使用 toString() 方法将整型或双精度浮点类型转换为字符串类型。使用 toStringAsFixed(). 指定小数点右边的位数，使用 toStringAsPrecision(): 指定字符串中的有效数字的位数。
  //将整型转换为字符串
  int int_number_42 = 42;
  var string_number_42 = int_number_42.toString();
  print('数字$int_number_42转换为字符串为：\'$string_number_42\'');
  assert(42.toString() == '42');
  //将双精度转换为字符串
  assert(123.456.toString() == '123.456');
  //指定小数点后的位数
  assert(123.456.toStringAsFixed(2) == '123.46');
  double double_number_123_456 = 123.456;
  var string_number_123_456 = double_number_123_456.toStringAsFixed(2);
  print(
      '数字$double_number_123_456转换为字符串为：\'$string_number_123_456\'（四舍五入保留小数点后2位）');
  //指定有效数字的数量
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}

//字符和正则表达式 https://dart.cn/guides/libraries/library-tour#strings-and-regular-expressions
void Strings() {
  ///在字符串中搜索(可以在字符串内查找特定字符串的位置，以及检查字符串是否以特定字符串作为开头或结尾)

  //检查一个字符串是否包含另一个字符串
  assert('Never odd or even'.contains('odd'));
  if ('Never odd or even'.contains('odd')) {
    print('\'Never odd or even\'中包含\'odd\'字符串');
  }

  //一个字符串是否以另一个字符串开头
  assert('Never odd or even'.startsWith('Never'));
  if ('Never odd or even'.startsWith('Never')) {
    print('\'Never odd or even\'以\'Never\'开头');
  }

  //一个字符串是否以另一个字符串结尾
  assert('Never odd or even'.endsWith('even'));
  if ('Never odd or even'.endsWith('even')) {
    print('\'Never odd or even\'以\'even\'结尾');
  }

  //在字符串中查找字符串的位置
  assert('Never odd or even'.indexOf('odd') == 6);
  int position_odd = 'Never odd or even'.indexOf('odd') + 1;
  print('\'Never odd or even\'中\'odd\'字符串在第$position_odd个');

  ///从字符串中提取数据
  print('');
  //获取一个子串
  assert('Never odd or even'.substring(6, 9) == 'odd');
  var Grab_a_substring = 'Never odd or even'.substring(6, 9);
  print(
      '\'Never odd or even\'中下标为第6至第9（不包含第9个，即[6,9)）的字符串为：\'$Grab_a_substring\'');

  //使用字符串模式拆分字符串
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
  int parts_length = parts.length;
  print('字符串\'progressive web apps\'以\' \'作为分隔标志可分为$parts，共$parts_length部分');

  //通过索引获取UTF-16代码单元（作为字符串）
  assert('Never odd or even'[0] == 'N');
  var char_0 = 'Never odd or even'[0];
  print('\'Never odd or even\'中下标为第0的字符为：\'$char_0\'');

  //使用带有空字符串参数的split（）来获取所有字符（作为字符串）的列表；很适合迭代。
  print('\'hello\'的所有字符为：');
  for (final char in 'hello'.split('')) {
    print(char);
  }

  //获取字符串中的所有UTF-16代码单元。
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  print('\'Never odd or even\'中所有字符的UTF-16编码为：$codeUnitList');

  ///首字母大小写转换
  print('');
  //转换成大写
  assert('web apps'.toUpperCase() == 'WEB APPS');
  String UpperCase = 'web apps'.toUpperCase();
  print('\'web apps\'中所有字符转换成大写为：\'$UpperCase\'');

  //转换成小写
  assert('WEB APPS'.toLowerCase() == 'web apps');
  String LowerCase = 'WEB APPS'.toLowerCase();
  print('\'WEB APPS\'中所有字符转换成小写为：\'$LowerCase\'');

  ///Trimming 和空字符串
  print('');

  //修剪字符串（去掉空格）
  assert('  hello  '.trim() == 'hello');
  String string_trim = '  hello  '.trim();
  print('字符串\'  hello  \'修剪后为：\'$string_trim\'');

  //检查字符串是否为空
  assert(''.isEmpty);
  if (''.isEmpty) {
    print('字符串\'\'为空');
  } else {
    print('字符串\'\'不为空');
  }

  //只有空格的字符串不是空的
  assert('  '.isNotEmpty);
  if ('  '.isNotEmpty) {
    print('字符串\'  \'不为空');
  } else {
    print('字符串\'  \'为空');
  }

  ///替换部分字符串
  print('');

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  //原字符串没有改变
  assert(greeting != greetingTemplate);
  print(greetingTemplate);
  print(greeting);
  if (greeting != greetingTemplate) {
    print('在使用replaceAll方法后原字符串没有改变');
  } else {
    print('在使用replaceAll方法后原字符串发生改变');
  }

  ///构建一个字符串
  print('');

  //以代码方式生成字符串，可以使用 StringBuffer 。在调用 toString() 之前， StringBuffer 不会生成新字符串对象。
  //writeAll() 的第二个参数为可选参数，用来指定分隔符，本例中使用空格作为分隔符。
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  print('使用 StringBuffer构建一个字符串：$fullString');

  ///正则表达式
  print('');

  //使用正则表达式可以对字符串进行高效搜索和模式匹配。

  //这是一个或多个数字的正则表达式
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  //contains()可以使用正则表达式
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  if (allCharacters.contains(numbers)) {
    print('\'$allCharacters\'字符串中包含了一个或多个数字');
  } else {
    print('\'$allCharacters\'字符串中不包含一个或多个数字');
  }
  if (someDigits.contains(numbers)) {
    print('\'$someDigits\'字符串中包含了一个或多个数字');
  } else {
    print('\'$someDigits\'字符串中不包含一个或多个数字');
  }

  //用另一个字符串替换每个匹配项
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  print('将\'$someDigits\'字符串中所有数字替换为\'XX\'：$exedOut');
}

//集合 https://dart.cn/guides/libraries/library-tour#collections
void Collections() {
  ///Lists

  //lists 可以通过字面量来创建和初始化。另外，也可以使用 List 的构造函数。 List 类还定义了若干方法，用于向列表添加或删除项目。

  //创建一个空字符串列表
  var grains = <String>[];
  assert(grains.isEmpty);

  //使用列表文本创建列表
  var fruits = ['apples', 'oranges'];
  print('列表fruits的初始内容为：$fruits');

  //添加到列表中
  fruits.add('kiwis');
  print('将\'kiwis\'添加到列表中后列表fruits的内容为：$fruits');

  //将多个项目添加到列表中
  fruits.addAll(['grapes', 'bananas']);
  print('将\'grapes\'、\'bananas\'添加到列表中后列表fruits的内容为：$fruits');

  //获取列表长度
  assert(fruits.length == 5);
  var list_length = fruits.length;
  print('列表fruits的长度为：$list_length');

  //删除单个项目
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  list_length = fruits.length;
  print('将\'apples\'从列表中删除后列表fruits的内容为：$fruits，列表fruits的长度为：$list_length');

  //从列表中删除所有元素
  fruits.clear();
  assert(fruits.isEmpty);
  list_length = fruits.length;
  print('将列表fruits的所有元素全部删除后fruits内容为：$fruits，列表fruits的长度为：$list_length');

  //还可以使用其中一个构造函数创建列表
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  //使用 indexOf() 方法查找一个对象在 list 中的下标值。
  print('');
  fruits = ['apples', 'oranges'];
  print('列表fruits的内容为：$fruits');

  //按索引访问列表项
  assert(fruits[0] == 'apples');
  var list_first_element = fruits[0];
  print('列表fruits的第一个元素为：$list_first_element');

  //在列表中查找项目
  assert(fruits.indexOf('apples') == 0);
  var list_position_element = fruits.indexOf('apples');
  print('列表fruits中\'apples\'元素下标为：$list_position_element');

  //使用 sort() 方法排序一个 list 。你可以提供一个排序函数用于比较两个对象。比较函数在 小于 时返回 \ <0，相等 时返回 0，bigger 时返回 > 0 。
  //下面示例中使用 compareTo() 函数，该函数在 Comparable 中定义，并被 String 类实现。
  print('');
  fruits = ['bananas', 'apples', 'oranges'];
  print('列表fruits的内容为：$fruits');
  //排序列表
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  print('排序后列表fruits的内容为：$fruits');

  //列表是参数化类型（泛型），因此可以指定 list 应该包含的元素类型：

  //此列表应仅包含字符串
  var fruits2 = <String>[];
  fruits2.add('apples');
  var fruit2 = fruits2[0];
  assert(fruit2 is String);
  //fruits2.add(5); 错误：“int”无法分配给“String”

  ///Sets
  print('');

  //在 Dart 中，set 是一个无序的，元素唯一的集合。因为一个 set 是无序的，所以无法通过下标（位置）获取 set 中的元素。

  //创建一个空字符串集
  var ingredients = <String>{};

  //添加新的项目
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  print('集合ingredients的内容为：$ingredients');

  //添加重复的项目没有效果
  ingredients.add('gold');
  assert(ingredients.length == 3);
  var set_length = ingredients.length;
  print(
      '添加重复的项目没有效果，再添加\'gold\'后集合ingredients的内容为：$ingredients，集合ingredients的长度为：$set_length');

  //从集合中移除一个项目
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  set_length = ingredients.length;
  print(
      '将\'gold\'从集合中删除后集合ingredients的内容为：$ingredients，集合ingredients的长度为：$set_length');

  //也可以使用其中一个构造函数创建集合
  var atomicNumbers = Set.from([79, 22, 54]);
  print('使用构造函数创建集合atomicNumbers，内容为：$atomicNumbers');

  //使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中：
  print('');
  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  print('集合ingredients的内容为：$ingredients');

  //检查项目是否在集合中
  assert(ingredients.contains('titanium'));
  if (ingredients.contains('titanium')) {
    print('\'titanium\'在集合ingredients中');
  } else {
    print('\'titanium\'不在集合ingredients中');
  }

  //检查是否所有项目都在集合中
  assert(ingredients.containsAll(['titanium', 'xenon']));
  if (ingredients.containsAll(['titanium', 'xenon'])) {
    print('\'titanium\'、\'xenon\'全在集合ingredients中');
  } else {
    print('\'titanium\'、\'xenon\'不全在集合ingredients中');
  }

  //交集是另外两个 set 中的公共元素组成的 set。
  print('');
  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  print('集合ingredients的内容为：$ingredients');
  var nobleGases2 = Set.from(['xenon', 'argon']);
  print('集合nobleGases2的内容为：$nobleGases2');
  //创建两个集合的交集
  var intersection = ingredients.intersection(nobleGases2);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
  print('集合ingredients与集合nobleGases2的交集为：$intersection');

  ///Map
  //map 是一个无序的 key-value （键值对）集合，就是大家熟知的 dictionary 或者 hash map 将 kay 与 value 关联，以便于检索。和 JavaScript 不同，Dart 对象不是 map。
  //声明 map 可以使用简洁的字面量语法，也可以使用传统构造函数：
  print('');

  //映射通常使用字符串作为键
  var hawaiianBeaches2 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  print('通过大括号语法创建映射hawaiianBeaches2的内容为：$hawaiianBeaches2');

  //可以从构造函数构建映射
  var searchTerms = Map();

  //映射是参数化类型；可以指定键和值的类型。
  var noble = Map<int, String>();

  //通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对。
  print('');
  var nobleGases = {54: 'xenon'};
  print('映射nobleGases，内容为：$nobleGases');

  //使用键检索值
  assert(nobleGases[54] == 'xenon');
  var nobleGases_54 = nobleGases[54];
  print('映射nobleGases中键为54对应的值为：$nobleGases_54');

  //检查映射是否包含键
  assert(nobleGases.containsKey(54));
  var nobleGases_containsKey_54 = nobleGases.containsKey(54);
  if (nobleGases_containsKey_54) {
    print('映射nobleGases中包含键为54的键');
  } else {
    print('映射nobleGases中不包含键为54的键');
  }

  //删除键及其值
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
  print('在删除键54及其值后，映射nobleGases的内容为：$nobleGases');

  //可以从一个 map 中检索出所有的 key 或所有的 value：
  print('');
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  print('映射hawaiianBeaches，内容为：$hawaiianBeaches');

  //将所有键作为无序集合(一个可迭代的集合)获取
  var keys = hawaiianBeaches.keys;
  print('将hawaiianBeaches的所有键作为无序集合keys，keys的内容为：$keys');

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  //将所有值作为无序集合(一个可迭代的列表)获取
  var values = hawaiianBeaches.values;
  print('将hawaiianBeaches的所有值作为无序集合values，values的内容为：$values');

  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  //使用 containsKey() 方法检查一个 map 中是否包含某个key 。因为 map 中的 value 可能会是 null ，所有通过 key 获取 value，并通过判断 value 是否为 null 来判断 key 是否存在是不可靠的。
  var hawaiianBeaches3 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  assert(hawaiianBeaches3.containsKey('Oahu'));
  assert(!hawaiianBeaches3.containsKey('Florida'));

  ///公共集合方法
  print('');

  //使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素：
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。
  teas = ['green', 'black', 'chamomile', 'earl grey'];
  print('使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法');
  teas.forEach((tea) => print('I drink $tea'));

  //当在 map 对象上调用 .forEach() 方法时，函数必须带两个参数（key 和 value）：
  print('\n当在 map 对象上调用 .forEach() 方法时，函数必须带两个参数（key 和 value）');
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
  });

  //Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中。
  teas = ['green', 'black', 'chamomile', 'earl grey'];
  print('\nIterable 提供 map() 方法，这个方法将所有结果返回到一个对象中');
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数。
  var loudTeas2 = teas.map((tea) => tea.toUpperCase()).toList();

  //使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件。
  teas = ['green', 'black', 'chamomile', 'earl grey'];

  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  //使用 where ()仅查找从提供的函数返回 true 的项
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  //使用任何()检查集合中至少一个项是否满足条件
  assert(teas.any(isDecaffeinated));

  //使用 every ()检查集合中的所有项是否满足条件
  assert(!teas.every(isDecaffeinated));
}

//日期和时间 https://dart.cn/guides/libraries/library-tour#dates-and-times
void Dates_and_times() {
  //DateTime 对象代表某个时刻，时区可以是 UTC 或者本地时区。

  //DateTime 对象可以通过若干构造函数创建：

  //获取当前的日期和时间。
  var now = DateTime.now();
  print('当前的日期和时间为：$now');

  //使用本地时区创建新的 DateTime。
  var y2k = DateTime(2000); // January 1, 2000
  print('本地时区创建2000年1月1日：$y2k');

  //指定月份和日期
  y2k = DateTime(2000, 1, 2); // January 2, 2000
  print('指定月份和日期，本地时区创建2000年1月2日：$y2k');

  //将日期指定为 UTC 时间
  y2k = DateTime.utc(2000); // 1/1/2000, UTC
  print('将日期指定为UTC时间，2000年：$y2k');

  //指定自 Unix 纪元以来的日期和时间，单位为 ms
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  print('指定自Unix纪元以来的日期和时间，2000年：$y2k');

  //分析 ISO 8601日期
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  print('分析ISO 8601日期，2000年：$y2k');
}

///dart:math - 数学和随机数 https://dart.cn/guides/libraries/library-tour#dartmath---math-and-random

//三角函数 https://dart.cn/guides/libraries/library-tour#trigonometry
void Trigonometry() {
  //Math 库提供基本的三角函数：

  // Cosine
  assert(cos(pi) == -1.0);
  var cos_pi = cos(pi);
  print('cos(Π)=$cos_pi');
  // Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
  //弧度是0.52359.
  var sinOf30degrees = sin(radians);
  print('sin(30°)=$sinOf30degrees');
  //sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
  if ((sinOf30degrees - 0.5).abs() < 0.01) {
    print('sin(30°)=0.5');
  }
}

//最大值和最小值 https://dart.cn/guides/libraries/library-tour#maximum-and-minimum
void Maximum_and_minimum() {
  //Math 库提供 max() 和 min() 方法：
  assert(max(1, 1000) == 1000);
  var max_number = max(1, 1000);
  print('1和1000两数中较大者为：$max_number');

  assert(min(1, -1000) == -1000);
  var min_number = min(1, 1000);
  print('1和1000两数中较小者为：$min_number');
}

//数学常数 https://dart.cn/guides/libraries/library-tour#math-constants
void Math_constants() {
  print('数学常数e为：');
  print(e); // 2.718281828459045
  print('数学常数Π为：');
  print(pi); // 3.141592653589793
  print('数学常数根号2为：');
  print(sqrt2); // 1.4142135623730951
}

//随机数 https://dart.cn/guides/libraries/library-tour#random-numbers
void Random_numbers() {
  //使用 Random 类产生随机数。可以为 Random 构造函数提供一个可选的种子参数。
  var random = Random();
  var random1 = random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  print(random1);
  var random2 = random.nextInt(10); // Between 0 and 9.
  print(random2);

  //也可以产生随机布尔值序列：
  var random3 = random.nextBool(); // true or false
  print(random3);
}

void main() {
  print('以下为<控制台打印>测试\n');
  Printing_to_the_console();
  print('———————————————————————————————————————————————————————');

  print('以下为<数字>测试\n');
  Numbers();
  print('———————————————————————————————————————————————————————');

  print('以下为<字符和正则表达式>测试\n');
  Strings();
  print('———————————————————————————————————————————————————————');

  print('以下为<集合>测试\n');
  Collections();
  print('———————————————————————————————————————————————————————');

  print('以下为<日期和时间>测试\n');
  Dates_and_times();
  print('———————————————————————————————————————————————————————');

  print('以下为<三角函数>测试\n');
  Trigonometry();
  print('———————————————————————————————————————————————————————');

  print('以下为<最大值和最小值>测试\n');
  Maximum_and_minimum();
  print('———————————————————————————————————————————————————————');

  print('以下为<数学常数>测试\n');
  Math_constants();
  print('———————————————————————————————————————————————————————');

  print('以下为<随机数>测试\n');
  Random_numbers();
  print('———————————————————————————————————————————————————————');
}
