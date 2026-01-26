// void main() {
//   int? a;
//   int b = a ?? 5;
//   print(a);
//   print(b);
//   int? c = a;
//   print(c);


//   a ??= 3;
  
//   print(a.isEven);
// }

//########################################//
// void main() {
//   method(0);
//   method(0, 1);
//   method(0, null);
//   method(0, 1, 4);
// }

// void method(int a,[int?b,int?c]) {}

//########################################//

// String foo({String?name, int?number, bool toUpperCase = true}) =>
//    '${(toUpperCase ? name?.toUpperCase() : name)} $number';

// void useFoo() {
//  foo(name: 'a');
//  foo(name: 'b', number: 1);
//  foo(name: 'c', toUpperCase: true);
//  foo(name: 'd', number: 2, toUpperCase: true);
// }

//########################################//

// void main() {
//   final list1 = [1, 2, 3];
//   final list2 = [...list1];

//   list2.add(4);

//   print(list1);
// }

//########################################//


 void main() {
  final list1 = [25, 42, 79, 12];
  list1.sort((a,b)=> b.compareTo(a));

  final multiplied = list1.map((e) => e * 2);

  final evenNumbers = multiplied.where((e) => e.isEven); 
  print(evenNumbers.toList());

  print(list1);
}