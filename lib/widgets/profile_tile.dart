import 'package:assignment/constants/colors.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatefulWidget {
  const ProfileTile({this.prefix, required this.text, this.subText, required this.suffix, required this.redirect, super.key});

  final dynamic prefix; // Icons || String
  final String text;
  final String? subText;
  final Widget suffix;
  final Function() redirect;

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: widget.redirect,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: 60,

          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Row(
            children: [
              if(widget.prefix != null)
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (widget.prefix is String) ? Colors.transparent : AppColors.primaryColor
                    ),
                    child: widget.prefix is String ? CircleAvatar(backgroundImage: AssetImage(widget.prefix),) : Icon(widget.prefix, color: Colors.white, size: 20,)
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledBodyMedium(text: widget.text, centered: false),
                    if(widget.subText is String)
                      StyledBodySmall(widget.subText!)
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
                widget.suffix,
            ],
          ),
        ),
      ),
    );
  }
}
