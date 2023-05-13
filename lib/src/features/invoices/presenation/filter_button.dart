import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) => const DropdownButtonExample();
}

const List<String> list = <String>['all', 'pending', 'paid'];

class DropdownButtonExample extends StatelessWidget {
  const DropdownButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, model, _) {
      return DropdownButton<String>(
        //  TODO: Implement
        value: '',
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          //  TODO: Implement
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: FittedBox(
              child: Text(value),
            ),
          );
        }).toList(),
      );
    });
  }
}




// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: FittedBox(
//             child: Text(value),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
