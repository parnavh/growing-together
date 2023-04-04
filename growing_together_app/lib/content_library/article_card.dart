import 'package:flutter/material.dart';
import 'article.dart';
import 'tag_chip.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/services.dart';

class ArticleCard extends StatefulWidget {
  final Article article;
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      // width: 150,
      // color: Colors.red,
      child: Card(
        child: InkWell(
          onTap: () async {
            if(await canLaunchUrlString(widget.article.link)) {
              await launchUrlString(widget.article.link);
            }
            else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Could not launch url")));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    // height: 70,
                    child: Text(widget.article.title, style: const TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 3,)
                  ),
                ),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: ,
                  children: widget.article.tags.map((t) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2.0, 8.0, 2.0),
                    child: TagChip(tag: t),
                  )).toList(),
                ),
                // Container(
                //   width: 150,
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: widget.article.tags.length,
                //     itemBuilder: (_, i) {
                //       return TagChip(tag: widget.article.tags[i]);
                //     },
                //     scrollDirection: Axis.horizontal,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 100,
                        child: Text("${widget.article.time} mins", style: const TextStyle(fontSize: 14))
                    ),
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(text: widget.article.link));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Link Copied to Clipbaord"),behavior: SnackBarBehavior.floating,));
                      },
                        child: const Icon(Icons.share)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
// // height: 200,
// width: 200,
// child: Card(
// clipBehavior: Clip.antiAlias,
// child: Column(
// children: [
// //     ListTile(
// //     // leading: Icon(Icons.arrow_drop_down_circle),
// //     title: Text(widget.article.title),
// //     subtitle: Text(widget.article.time.toString() + ' mins',
// //       style: TextStyle(color: Colors.black.withOpacity(0.6)),
// //     ),
// // ),
// // Padding(
// // padding: const EdgeInsets.all(16.0),
// // child: Text(
// // 'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
// // style: TextStyle(color: Colors.black.withOpacity(0.6)),
// // ),
// // ),
// Image.asset('assets/images/child.jpg', fit: BoxFit.fitHeight,)
// ],
// ),
// ),
// );
