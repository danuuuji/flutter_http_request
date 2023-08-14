import 'package:flutter/material.dart';

import '../../models/trainer.dart';
import '../../widgets/image_trainer_widget.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.trainer});

  // Declare a field that holds the Todo.
  final Trainer trainer;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(trainer.name ?? ''),
      ),
      body: Center(
        child: Column(children: [
          ImageTrainerWidget(
            urlImage: trainer.photo ?? '',
            height: 210,
            width: 140,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(trainer.position?.title ?? ''),
          ),
          Text(trainer.department?.title ?? '')
        ],
        )
      )
    );
  }
}