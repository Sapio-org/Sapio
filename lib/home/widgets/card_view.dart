import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:scapio/home/data/dummy_cards.dart';
import 'package:scapio/home/widgets/profile_card.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final CardSwiperController controller = CardSwiperController();
  final profile_cards = dummyProfiles;

  // State variables for animations
  bool showCheckAnimation = false;
  bool showCloseAnimation = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _triggerAnimation(CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.right) {
      setState(() {
        showCheckAnimation = true;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          showCheckAnimation = false;
        });
      });
    } else if (direction == CardSwiperDirection.left) {
      setState(() {
        showCloseAnimation = true;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          showCloseAnimation = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CardSwiper(
          padding: EdgeInsets.all(7),
          controller: controller,
          backCardOffset: const Offset(40, -10),
          allowedSwipeDirection:
              AllowedSwipeDirection.symmetric(horizontal: true),
          onSwipeDirectionChange: (horizontalDirection, verticalDirection) =>
              {_triggerAnimation(horizontalDirection)},
          // onSwipe: (previousIndex, currentIndex, direction) {
          //   _triggerAnimation(direction);
          //   return Future.value(true); // Allow the swipe to proceed
          // },
          cardsCount: profile_cards.length,
          cardBuilder: (
            context,
            index,
            horizontalThresholdPercentage,
            verticalThresholdPercentage,
          ) =>
              ProfileCard(profile: profile_cards[index]),
        ),
        // Check animation
        if (showCheckAnimation)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            right: 10,
            child: _buildCheckMarkAnimation(),
          ),
        // Close animation
        if (showCloseAnimation)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 10,
            child: _buildCloseMarkAnimation(),
          ),
      ],
    );
  }

  // Widget for Check Mark Animation
  Widget _buildCheckMarkAnimation() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow.withOpacity(0.7),
      ),
      child: const Icon(
        LucideIcons.check,
        size: 60,
        color: Colors.black,
      ),
    );
  }

  Widget _buildCloseMarkAnimation() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.7),
      ),
      child: const Icon(
        LucideIcons.x,
        size: 60,
        color: Colors.black,
      ),
    );
  }
}
