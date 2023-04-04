import 'package:flutter/cupertino.dart';
import 'tags.dart';

class TagChip extends StatefulWidget {
  final Tags tag;
  const TagChip({Key? key, required this.tag}) : super(key: key);

  @override
  State<TagChip> createState() => _TagChipState();
}

class _TagChipState extends State<TagChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: TagColorMap[widget.tag],
      ),
      child: Text(show(widget.tag), style: TextStyle(fontSize: 12),),
    );
  }
}
