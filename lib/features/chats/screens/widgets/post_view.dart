import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/features/chats/data/dummy_posts.dart';
import 'package:scapio/features/chats/models/post_model.dart';
import 'package:scapio/features/chats/screens/widgets/post_card.dart';
import 'package:scapio/home/data/dummy_cards.dart';
import 'package:scapio/home/models/profile_card_model.dart';
import 'package:scapio/home/widgets/profile_card.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  List<dynamic> cards = [...dummyPosts];

  void addProfileCard(ProfileCardModel profile) {
    setState(() {
      cards.add(profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      numberOfCardsDisplayed: 3,
      padding: EdgeInsets.all(7),
      backCardOffset: const Offset(40, -10),
      allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true),
      cardsCount: cards.length,
      cardBuilder: (context, index, horizontalThreshold, verticalThreshold) {
        final card = cards[index];
        if (card is Post) {
          // Render PostCard
          return PostCard(
            post: card,
            onAuthorTap: (profile) => addProfileCard(profile),
          );
        } else if (card is ProfileCardModel) {
          // Render ProfileCard
          return ProfileCard(profile: card);
        }
        return const SizedBox(); // Fallback if card type is unrecognized
      },
    );
  }
}
