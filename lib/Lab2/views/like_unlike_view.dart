import 'package:adv_flutter_lab/Lab2/controller/like_unlike_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeUnlike extends StatefulWidget {
  LikeUnlike({super.key});

  @override
  State<LikeUnlike> createState() => _LikeUnlikeState();
}

class _LikeUnlikeState extends State<LikeUnlike> {
  LikeUnlikeController controller = LikeUnlikeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.users[index]["name"]),
                    trailing: IconButton(
                      onPressed: (){
                        setState(() {
                          controller.favouriteUser(!controller.users[index]["isFav"], controller.users[index]["name"]);
                        });
                      },
                      icon: Icon(
                        controller.users[index]["isFav"]
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.users.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
