import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const MessageBubble(this.message, {this.isMe = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
            color: isMe
                ? Colors.grey[300]
                : Theme.of(context).colorScheme.secondary,
          ),
          constraints: BoxConstraints(
              minWidth: 140, maxWidth: MediaQuery.of(context).size.width - 28),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe
                  ? Colors.black
                  : Theme.of(context).colorScheme.onSecondary,
            ),
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
