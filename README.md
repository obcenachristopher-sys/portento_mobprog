# portento_mobprog

## Lab Activity 1: Discussion

### How I Integrated the Image in `newsfeed_card.dart` and Made It Dynamic

To make the image dynamic in `newsfeed_card.dart` so it works whether a post has a picture or not, I changed the old `hasImage` boolean into a nullable `String? postImage` variable. That way, I can pass the image path directly from `newsfeed_screen.dart` for posts that have an image, or just leave it null for text-only posts.

Inside `newsfeed_card.dart`, I created a `_buildPostImage()` widget method that checks if `postImage` is null or empty. If there is no image, it returns `SizedBox.shrink()` so it doesn't take up any extra space on the card. If there is an image path, it displays the picture using `Image.asset` wrapped in `ClipRRect` for rounded corners, and I also added an `errorBuilder` so the layout won't break if an image fails to load.