// class ConfirmPage extends StatefulWidget {
//   const ConfirmPage({super.key});

//   @override
//   State<ConfirmPage> createState() => _ConfirmPageState();
// }

// class _ConfirmPageState extends State<ConfirmPage> {
//   String FirstName = "";
//   String SecondName = "";
//   String PhoneNumber = "";
//   String City = "";
//   String Country = "";
//   String Code = "";
//   String Address = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 150,
//                   child: FastTextField(
//                     onChanged: (value) {
//                       setState(() {
//                         FirstName = value!;
//                       });
//                     },
//                     name: "field_destination",
//                     decoration: InputDecoration(
//                         labelText: "First Name",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18))),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   width: 150,
//                   child: FastTextField(
//                     onChanged: (value) {
//                       setState(() {
//                         SecondName = value!;
//                       });
//                     },
//                     name: "field_destination",
//                     decoration: InputDecoration(
//                         labelText: "Second Name",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18))),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: 150,
//                   child: FastDropdown(
//                     onChanged: (value) {
//                       setState(() {
//                         Country = value!;
//                       });
//                     },
//                     name: "field_destination",
//                     items: ["EGYPT", "MORROCCO"],
//                     initialValue: "EGYPT",
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   width: 150,
//                   child: FastDropdown(
//                     onChanged: (value) {
//                       setState(() {
//                         City = value!;
//                       });
//                     },
//                     name: "field_destination",
//                     items: ["Cairo", "Damietta"],
//                     initialValue: "Cairo",
//                   ),
//                 ),
//               ],
//             ),

//             Container(
//               width: 320,
//               child: FastTextField(
//                 onChanged: (value) {
//                   setState(() {
//                     Address = value!;
//                   });
//                 },
//                 name: "field_destination",
//                 decoration: InputDecoration(
//                     labelText: "Address Details",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//             ),

//             Row(
//               children: [
//                 Container(
//                   width: 250,
//                   child: FastTextField(
//                     onChanged: (value) {
//                       setState(() {
//                         PhoneNumber = value!;
//                       });
//                     },
//                     name: "field_destination",
//                     decoration: InputDecoration(
//                         labelText: "Phone Number",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18))),
//                   ),
//                 ),
//                 Container(
//                   width: 80,
//                   child: FastTextField(
//                     onChanged: (value) {
//                       setState(() {
//                         Code = value!;
//                       });
//                     },
//                     name: "field_destination",
//                     decoration: InputDecoration(
//                         labelText: "Code",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18))),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

