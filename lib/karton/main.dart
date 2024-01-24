import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/karton/presenation_layer/screens/characters.dart';

import 'bloc_layer/cubit.dart';
import 'data_layer/repository.dart';
import 'data_layer/webservies.dart';

void main1() {
  runApp(BreakingBadApp());
}

class BreakingBadApp extends StatelessWidget {
  BreakingBadApp({Key? key}) : super(key: key);

  //final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    // AppRouter generateRoute = AppRouter();
    CharactersCubit chactersCubit =
        CharactersCubit(CharactersRepoSitory(CharactersWebservices()));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => chactersCubit..getAllCharacters())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharactersScreen(),
        // onGenerateRoute: generateRoute.appRoute,
        // home: Home(),
      ),
    );
  }
}
//
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ERROR'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: const [
//           Icon(
//             Icons.no_adult_content,
//             size: 20,
//           ),
//           Text('This Page is Not Found'),
//         ],
//       ),
//     );
//   }
// }
