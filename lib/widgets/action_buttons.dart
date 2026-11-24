import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portento_mobprog/constants.dart';
import 'package:portento_mobprog/widgets/custom_text.dart';

class LikeButton extends StatefulWidget {
  final int initialLikes;

  const LikeButton({super.key, required this.initialLikes});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialLikes;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleLike,
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(6)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(8),
          vertical: ScreenUtil().setHeight(6),
        ),
        child: Row(
          children: [
            Icon(
              isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
              color: isLiked ? fbPrimary : fbDarkPrimary,
              size: ScreenUtil().setSp(18),
            ),
            SizedBox(width: ScreenUtil().setWidth(5)),
            CustomText(
              text: likeCount.toString(),
              fontSize: ScreenUtil().setSp(12),
              color: isLiked ? fbPrimary : fbDarkPrimary,
              fontWeight: isLiked ? FontWeight.bold : FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}

class CommentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CommentButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(6)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(8),
          vertical: ScreenUtil().setHeight(6),
        ),
        child: Row(
          children: [
            Icon(
              Icons.comment_outlined,
              color: fbDarkPrimary,
              size: ScreenUtil().setSp(18),
            ),
            SizedBox(width: ScreenUtil().setWidth(5)),
            CustomText(
              text: 'Comment',
              fontSize: ScreenUtil().setSp(12),
              color: fbDarkPrimary,
            ),
          ],
        ),
      ),
    );
  }
}