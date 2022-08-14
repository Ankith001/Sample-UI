import 'package:flutter/material.dart';
import 'package:sample_ui/custom_list_tile.dart';

class SearchScreen extends SearchDelegate {
  final List universityName;
  SearchScreen(this.universityName);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
     final suggestionsList = universityName.where(
        (element) => element.toLowerCase().contains(query.toLowerCase()));

        if (suggestionsList.isEmpty) {
          return Center(child: Text("No data found"),);
        }

    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                CustomListTileWidget(name: suggestionsList.elementAt(index))),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: suggestionsList.length);
  }

  @override
  Widget buildSuggestions(BuildContext context) {  
    final suggestionsList = universityName.where(
        (element) => element.toLowerCase().contains(query.toLowerCase()));

        if (suggestionsList.isEmpty) {
          return const Center(child: Text("No data found !"),);
        }

    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                CustomListTileWidget(name: suggestionsList.elementAt(index))),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: suggestionsList.length);
  }
}
