import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_http_test/src/models/trainer.dart';
import 'package:flutter_http_test/src/pages/trainers_list/cubit/trainers_cubit.dart';
import 'package:flutter_http_test/src/service/http_request.dart';

import '../../widgets/image_trainer_widget.dart';
import '../trainer_detail_page/trainer_detail_page.dart';

class LastNewsPage extends StatelessWidget {
  const LastNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: const _LastNewsPage(),
    );
  }
}

class _LastNewsPage extends StatelessWidget {
  const _LastNewsPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state){
      if (state is TrainersInitial){
        context.read<NewsCubit>().loadNews();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(state is TrainersErrorState){
        return Center(
            child: Text(state.errorMessage)
        );
      }
      if(state is TrainersLoadedState){
        return RefreshIndicator(
            onRefresh: () => context.read<NewsCubit>().reloadNews(),
            child: listBuilder(context, state)
        );
      }

      return Container();
    });
  }


  Widget listBuilder(BuildContext context, TrainersLoadedState state){
    List<Trainer>? listTrainers = state.trainers;
    return ListView.builder(
        itemCount: listTrainers.length,
        itemBuilder: (BuildContext context, int index){
          final trainer = listTrainers[index];
          //final photo = HttpRequest.getPhoto(trainer.photo ?? '');
          return Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.pinkAccent,
                ],
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            //height: ,
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: ListTile(
                  title: Column(
                    children: [
                      Text(
                        trainer.name ?? '',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        trainer.position?.title ?? '',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        trainer.department?.title ?? '',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  contentPadding: const EdgeInsets.all(15),
                  //onTap: () => launchUniversalLink(Uri.parse(item.link!)),
                  //leading: ImageTrainerWidget(urlImage: trainer.photo ?? '',) ,\
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(trainer: trainer),
                      ),
                    );
                  },
                  leading: ImageTrainerWidget(
                      urlImage: trainer.photo ?? '',
                      height: 90,
                      width: 60,
                  ) ,
                )
                ),
              ),
            );


        }
    );
  }
}
/**margin: const EdgeInsets.all(3),
    //color: Colors.indigoAccent,
    decoration: BoxDecoration(
    //color: Colors.blue[200],
    borderRadius: BorderRadius.circular(25),
    border: Border.all(
    color: Colors.blue,
    width: 1,
    style: BorderStyle.solid
    ),
    //gradient: const LinearGradient(colors: [Colors.deepPurpleAccent, Colors.blue])
    /** boxShadow: const [
    BoxShadow(
    color: Colors.blue,
    blurRadius: 2,
    offset: Offset(2, 2), // Shadow position
    ),
    ],
    */ //,

    ),
    child: Expanded(
    child: ListTile(
    title: Column(
    children: [
    Text(
    trainer.name ?? '',
    textAlign: TextAlign.left,
    style: const TextStyle(fontSize: 20, color: Colors.black),
    ),
    Text(
    trainer.position?.title ?? '',
    textAlign: TextAlign.left,
    style: const TextStyle(fontSize: 18, color: Colors.black),
    ),
    Text(
    trainer.department?.title ?? '',
    textAlign: TextAlign.left,
    style: const TextStyle(fontSize: 16, color: Colors.black),
    ),
    ],
    ),
    trailing: const Icon(Icons.keyboard_arrow_right),
    contentPadding: const EdgeInsets.all(15),
    //onTap: () => launchUniversalLink(Uri.parse(item.link!)),
    leading: ImageTrainerWidget(urlImage: trainer.photo ?? '',) ,
    )
    )
    );*/