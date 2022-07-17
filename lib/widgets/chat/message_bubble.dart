import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String userImage;
  final String userName;
  final double _messageHorMargin = 8;
  final double _messageVerMargin = 16;
  final double _messageHorPadding = 16;
  final double _messageVerPadding = 10;
  final double _containerMinWidth = 140;

  const MessageBubble(this.message, this.userName, this.userImage,
      {this.isMe = false, Key? key})
      : super(key: key);

  Size _textSize(String text, TextStyle style, BuildContext context) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 10,
        textDirection: TextDirection.ltr)
      ..layout(
          minWidth: _containerMinWidth - _messageHorPadding * 2,
          maxWidth:
              MediaQuery.of(context).size.width * 0.9 - _messageHorPadding * 2);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: isMe ? Colors.black : Theme.of(context).colorScheme.onSecondary,
    );
    final Size txtSize = _textSize(message, textStyle, context);
    final double imagePosition = txtSize.width + _messageHorPadding * 2 - 20;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: isMe
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
                color: isMe
                    ? Colors.grey[300]
                    : Theme.of(context).colorScheme.secondary,
              ),
              constraints: BoxConstraints(
                  minWidth: _containerMinWidth,
                  maxWidth: MediaQuery.of(context).size.width * 0.9),
              padding: EdgeInsets.symmetric(
                vertical: _messageVerPadding,
                horizontal: _messageHorPadding,
              ),
              margin: EdgeInsets.symmetric(
                vertical: _messageVerMargin,
                horizontal: _messageHorMargin,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    message,
                    style: textStyle,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: isMe ? imagePosition : null,
          left: isMe ? null : imagePosition,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
    );
  }
}
