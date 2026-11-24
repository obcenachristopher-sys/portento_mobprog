import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portento_mobprog/constants.dart';
import 'package:portento_mobprog/widgets/action_buttons.dart';
import 'package:portento_mobprog/widgets/custom_text.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? postImage;
  final String? profileImage;
  final String? commentAvatar;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.postImage,
    this.profileImage,
    this.commentAvatar,
  });

  Widget _buildUserAvatar({String? imagePath, double radius = 20}) {
    final hasAvatar = imagePath != null && imagePath.isNotEmpty;
    return CircleAvatar(
      radius: ScreenUtil().setSp(radius),
      backgroundColor: fbLightPrimary,
      backgroundImage: hasAvatar ? AssetImage(imagePath) : null,
      onBackgroundImageError: hasAvatar
          ? (exception, stackTrace) {
              debugPrint('Failed to load avatar ($imagePath): $exception');
            }
          : null,
      child: !hasAvatar
          ? Icon(
              Icons.person,
              color: Colors.white,
              size: ScreenUtil().setSp(radius),
            )
          : null,
    );
  }

  Widget _buildPostImage() {
    if (postImage == null || postImage!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
        child: Image.asset(
          postImage!,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);

    return Card(
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildUserAvatar(imagePath: profileImage, radius: 20),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(14),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            _buildPostImage(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LikeButton(initialLikes: numOfLikes),
                CommentButton(onPressed: () {}),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.redo,
                    color: fbDarkPrimary,
                    size: ScreenUtil().setSp(18),
                  ),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              children: [
                _buildUserAvatar(
                  imagePath: commentAvatar,
                  radius: 14,
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(28),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(ScreenUtil().setSp(14)),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}