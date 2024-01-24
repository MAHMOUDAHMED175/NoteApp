import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:todo/karton/constansts/strings.dart';

import '../../bloc_layer/cubit.dart';
import '../../bloc_layer/state.dart';
import '../../constansts/colors.dart';
import '../../data_layer/repository.dart';
import '../../data_layer/webservies.dart';
import '../reusable_components.dart';

bool isSearched = false;

CharactersRepoSitory charactersRepoSitory =
    CharactersRepoSitory(CharactersWebservices());

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    CharactersCubit.get(context).getAllCharacters();
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget buildAppTitle() {
      return Text('Characters',
          style: TextStyle(fontSize: 20, color: MyColors.mygrey));
    }

    Widget buildNoIntenetWidget() {
      return Center(
        child: Container(
          color: MyColors.mywhite,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Can\'t Connect the Internet ......Check it ',
                style: TextStyle(fontSize: 22, color: MyColors.mygrey),
              ),
              Image.asset('assets/images/no_internet.png')
            ],
          ),
        ),
      );
    }

    return BlocBuilder<CharactersCubit, MyState>(
      bloc: BlocProvider.of<CharactersCubit>(context),
      builder: (context, state) {
        if (state is LoadedGetAllCharactersState) {
          //    allCharactersList = state as List<Results>;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: MyColors.myyello,
                title: isSearched ? buildSerachField() : buildAppTitle(),
                leading: isSearched
                    ? BackButton(
                        color: MyColors.mygrey,
                      )
                    : Container(),
                actions: buildAppBarActions(),
                centerTitle: true,
              ),
              body: OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  if (connected) {
                    return CharacterWidget();
                  } else {
                    return buildNoIntenetWidget();
                  }
                },
                child: showloadingCharacter(),
              ));
        } else {
          return showloadingCharacter();
        }
      },
    );
  }

  Widget buildSerachField() {
    return TextField(
      controller: textSearchController,
      cursorColor: MyColors.mygrey,
      decoration: InputDecoration(
          hintText: 'Find a Characater .......',
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 18, color: MyColors.mygrey)),
      style: TextStyle(fontSize: 18, color: MyColors.mygrey),
      onChanged: (searchedCharacter) {
        addSearchItemForSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchItemForSearchedList(String searchedCharacter) {
    CharactersCubit.get(context).serchedCharactersList = CharactersWebservices
        .chararctersModel!.results!
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearched) {
      return [
        IconButton(
          onPressed: startSearch,
          icon: Icon(Icons.close),
          color: MyColors.mygrey,
        )
      ];
    } else {
      return [
        IconButton(
            icon: Icon(Icons.close),
            color: MyColors.mygrey,
            onPressed: () {
              clearDataSearch();
              Navigator.of(context).pop();
            })
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearched = true;
    });
  }

  void stopSearch() {
    clearDataSearch();
    setState(() {
      isSearched = false;
    });
  }

  void clearDataSearch() {
    setState(() {
      textSearchController.clear();
    });
  }
}

class CharacterWidget extends StatefulWidget {
  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.mygrey,
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              // itemCount: textSearchController.text.isEmpty
              itemCount: CharactersWebservices
                      .chararctersModel!.results!.isNotEmpty
                  ? CharactersWebservices.chararctersModel!.results!.length
                  : CharactersCubit.get(context).serchedCharactersList!.length,
              itemBuilder: (context, index) {
                return CharacterItem(CharactersWebservices
                        .chararctersModel!.results!.isNotEmpty
                    ? CharactersWebservices.chararctersModel!.results![index]
                    : CharactersCubit.get(context)
                        .serchedCharactersList![index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget showloadingCharacter() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
      SizedBox(height: 10),
      Text(
        'Loading.......',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ],
  );
}
