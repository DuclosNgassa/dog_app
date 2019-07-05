import 'package:flutter/material.dart';
import '../model/dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {

  final double dogAvatarSize = 150.0;

  Widget get dogImage {
    // Containers define the size of its children
    return Container(
      height: dogAvatarSize,
      width: dogAvatarSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                offset: const Offset(1.0, 2.0,),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: const Color(0x33000000)
            ),
            const BoxShadow(
                offset: const Offset(1.0, 2.0,),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: const Color(0x24000000)
            ),
            const BoxShadow(
                offset: const Offset(3.0, 1.0,),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: const Color(0x1F000000)
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.dog.imageUrl),
          ),
      ),
    );
  }
}