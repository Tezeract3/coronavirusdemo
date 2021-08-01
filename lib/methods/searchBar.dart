import 'package:flutter/material.dart';

class CountrySearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final countryList = ['Sri Lanka', 'USA', 'Canada'];

    final selectList = query.isEmpty
        ? countryList
        : countryList.where((country) {
            final countryLower = country.toLowerCase();
            final countryQueryUpper = query.toLowerCase();

             return countryLower.startsWith(countryQueryUpper);
          }).toList();

    return selectList.isEmpty
        ? Center(
            child: Text(
              'No country found!!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )
        : ListView.builder(
            itemCount: selectList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  close(context, selectList[index]);
                },
                title: Text(selectList[index]),
              );
            });
  }
}
