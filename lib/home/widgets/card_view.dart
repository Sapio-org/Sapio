import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:scapio/home/data/dummy_cards.dart';
import 'package:scapio/home/widgets/profile_card.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final CardSwiperController controller = CardSwiperController();
  final cards = dummyProfiles;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      controller: controller,
      backCardOffset: const Offset(40, -10),
      allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true),
      cardsCount: cards.length,
      cardBuilder: (
        context,
        index,
        horizontalThresholdPercentage,
        verticalThresholdPercentage,
      ) =>
          ProfileCard(profile: cards[index]),
    );
  }
}
