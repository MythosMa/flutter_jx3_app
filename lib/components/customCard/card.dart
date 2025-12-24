import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final Widget? footer;

  const CustomInfoCard({super.key, this.title, this.content, this.footer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color.fromARGB(
          255,
          235,
          230,
          218,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((255 * 0.8) as int),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Padding(padding: EdgeInsets.all(2), child: title!),
            Divider(height: 2, color: Colors.grey),
          ],
          if (content != null)
            Padding(padding: EdgeInsets.all(2), child: content!),
          if (footer != null) ...[
            Divider(height: 1),
            Padding(padding: EdgeInsets.all(2), child: footer!),
          ],
        ],
      ),
    );
  }
}
