import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CardBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardBox({
    Key? key,
    this.title = "Default Title",
    this.subtitle = "Default Subtitle",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/1.jpg',
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded( // Expanded를 추가하여 자식이 남은 공간을 채우도록 함
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  overflow: TextOverflow.ellipsis, // 텍스트가 너무 길 경우 줄임표 사용
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white70,
                  ),
                  overflow: TextOverflow.ellipsis, // 마찬가지로 텍스트 오버플로 처리
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
