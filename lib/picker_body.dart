import 'package:flutter/material.dart';
import 'package:flutter_chat_app/repo/image_repository.dart';

import 'models/image_model.dart';

class NetworkImagePickerBody extends StatelessWidget {
  NetworkImagePickerBody({super.key});

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder<List<UnsplashImage>>(
          future: _imageRepo.getNetworkImages(),
          builder: (BuildContext context,
              AsyncSnapshot<List<UnsplashImage>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                ),
                itemBuilder: (context, index) {
                  return Image.network(snapshot.data![index].urls.small);
                },
              );
            }

            return const CircularProgressIndicator();
          }),
    );
  }
}
