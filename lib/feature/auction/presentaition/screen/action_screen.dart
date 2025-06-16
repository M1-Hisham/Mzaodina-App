// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';

// class ActionScreen extends StatelessWidget {
//   const ActionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         padding: EdgeInsets.all(12),
//         child: BlocBuilder<ActionCubit, ActionState>(
//           buildWhen: (previous, current) => current is ActionSuccessStates,

//           builder: (context, state) {
//             if (state is ActionLoadingStates) {
//               return const CircularProgressIndicator();
//             } else if (state is ActionErrorStates) {
//               return const CircularProgressIndicator();
//             }
//             if (state is ActionSuccessStates) {
//               // if (state.actionStatusModel == null) {
//               //   return const CircularProgressIndicator();
//               // }

//               return ListView(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       print(state.actionStatusModel);
//                     },
//                     child: Text(
//                       state.actionStatusModel.user!.toJson().toString(),
//                       maxLines: 50,
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
