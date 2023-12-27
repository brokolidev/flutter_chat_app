import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/chat_message_entity.dart';
import 'package:flutter_chat_app/utils/spaces.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({
    super.key,
    required this.alignment,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.userName == "poojab26";

    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isAuthor ? Theme.of(context).primaryColor : Colors.black87,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            verticalSpacing(10),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(entity.imageUrl!),
                    ),
                    borderRadius: BorderRadius.circular(24.0)),
              )
          ],
        ),
      ),
    );
  }
}
