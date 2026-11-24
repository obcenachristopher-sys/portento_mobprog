import 'package:material_ui/material_ui.dart';
import 'package:portento_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Steve Rogers',
          profileImage: 'assets/images/captain.jpg',
          commentAvatar: 'assets/images/captain.jpg',
          postContent: 'I can do this all day! #AvengersAssemble',
          date: '2 hours ago',
          numOfLikes: 10,
        ),
        NewsfeedCard(
          userName: 'Tony Stark',
          profileImage: 'assets/images/champion-iron-man-infinity-war.webp',
          commentAvatar: 'assets/images/champion-iron-man-infinity-war.webp',
          postContent: 'I am Iron Man. #GeniusBillionairePlayboyPhilanthropist',
          date: 'December 1, 2023',
          numOfLikes: 3000,
          postImage: 'assets/images/champion-iron-man-infinity-war.webp',
        ),
      ],
    );
  }
}