import 'package:flutter/material.dart';
import 'package:shoesly/components/components.dart';
import 'package:shoesly/feature/shoes_list/model/shoes_model.dart';
import 'package:shoesly/resources/resources.dart';

class ReviewWidget extends StatelessWidget {
  final List<Review> reviews;
  const ReviewWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final reviewItem = reviews.take(3);
    print(reviews.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review',
          style: context.textTheme.headline400
              .copyWith(fontWeight: FontWeight.bold),
        ),
        for (final item in reviewItem) ReviewItem(review: item)
      ],
    );
    // for (final item in firstThreeItem) {
    //   return ReviewItem(review: item);
    // }
    // return const SizedBox.shrink();
  }
}

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalGap(d_margin1025),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: ShoeslyImage.network(
                // color: Colors.black,
                url:
                    'https://res.cloudinary.com/dkqhmiqas/image/upload/v1718345839/IMG_6823_ex81ff.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const HorizontalGap(d_margin2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nolan Carder',
                    style: context.textTheme.headline300.copyWith(
                        color: context.color.primary.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalGap(d_margin05),
                  ShoeslyRatingBar(rating: review.rating ?? 0),
                  const VerticalGap(d_margin1),
                  Text(
                    review.description ?? '',
                    style: context.textTheme.bodyText100,
                  ),
                  const VerticalGap(d_margin5),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
