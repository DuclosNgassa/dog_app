import 'package:flutter/material.dart';
import 'package:dog_app/component/dog_card.dart';
import 'package:dog_app/model/dog_model.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;

  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, int) {
        return DogCard(doggos[int]);
      },
    );
  }
}
