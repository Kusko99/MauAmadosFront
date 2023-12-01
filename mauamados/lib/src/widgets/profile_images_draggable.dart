import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/profile_images.dart';

class ProfileDraggable extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onRemove;
  final List urlFotos;
  final Function(String) onAccept;

  const ProfileDraggable({
    super.key, 
    required this.imageUrl, 
    required this.onRemove,
    required this.urlFotos,
    required this.onAccept
  });

  @override
  State <ProfileDraggable> createState() =>  ProfileDraggableState();
}

class  ProfileDraggableState extends State<ProfileDraggable> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widget.imageUrl,
      feedback: ProfileImage(
        imageUrl: widget.imageUrl,
        onRemove: widget.onRemove,
      ),
      child: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          return ProfileImage(
            imageUrl: widget.imageUrl,
            onRemove: widget.onRemove);
        },
        onAccept: widget.onAccept
      ),
    );
  }
}