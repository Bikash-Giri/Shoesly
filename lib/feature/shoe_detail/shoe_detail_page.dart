import 'package:flutter/material.dart';
import 'package:shoesly/components/components.dart';
import 'package:shoesly/feature/widget/review_widget.dart';
import 'package:shoesly/resources/resources.dart';
import 'package:shoesly/feature/shoes_list/model/shoes_model.dart';

class ShoeDetailPage extends StatelessWidget {
  final Shoe model;
  const ShoeDetailPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: d_margin4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InfoWidget(
                          title: model.name,
                          rating: model.rating,
                          reviewers: model.numberOfReviews,
                        ),
                        const VerticalGap(d_margin4),
                        _SizeSelectionWidget(
                          listOfSize: model.size,
                        ),
                        const VerticalGap(d_margin4),
                        if ((model.description ?? '').isNotEmpty)
                          _DescriptionWidget(description: model.description!),
                        if ((model.reviews ?? []).isNotEmpty)
                          const VerticalGap(d_margin4),
                        ReviewWidget(reviews: model.reviews!),
                        ShoeslyButton.outline(
                            buttonText: sSeeAllReview, onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ),
              BottomWidget(price: model.price ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  final String? title;
  final int? reviewers;
  final double? rating;

  const _InfoWidget({
    required this.title,
    required this.rating,
    required this.reviewers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jordan 1 Retro High tye dye ',
          style: context.textTheme.headline600
              .copyWith(color: context.color.primary.shade500),
          maxLines: 2,
        ),
        const VerticalGap(d_margin1),
        Row(
          children: [
            ShoeslyRatingBar(rating: rating ?? 0),
            const HorizontalGap(d_margin05),
            Text(
              (rating ?? '').toString(),
              style: context.textTheme.urbanistB,
            ),
            const HorizontalGap(d_margin05),
            Expanded(
              child: Text(
                '(${(reviewers ?? 0).toString()} Reviews) ',
                style: context.textTheme.bodyText100
                    .copyWith(color: context.color.primary.shade300),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SizeSelectionWidget extends StatelessWidget {
  final List<int>? listOfSize;
  const _SizeSelectionWidget({this.listOfSize = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: context.textTheme.headline400,
        ),
        const VerticalGap(d_margin1025),
        SizedBox(
          height: d_margin5,
          child: ListView.builder(
            itemBuilder: (context, int) {
              return Row(
                children: [
                  _SizeItem(
                    item: int,
                  ),
                  if (listOfSize!.length != int) const HorizontalGap(d_margin2),
                ],
              );
            },
            itemCount: listOfSize!.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  final int item;
  const _SizeItem({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: d_margin5, // Width of the circle
      height: d_margin5, // Height of the circle
      decoration: BoxDecoration(
        border: Border.all(color: context.color.primary.shade200),
        color: Colors.transparent, // Background color of the circle
        shape: BoxShape.circle, // Shape of the container
      ),
      child: Center(
        child: Text(item.toString(), // Text inside the circle
            style: context.textTheme.headline300
                .copyWith(color: context.color.primary.shade400)),
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final String description;
  const _DescriptionWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Description',
          style: context.textTheme.headline400
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const VerticalGap(d_margin1025),
        Text(
          description,
          style: context.textTheme.bodyText200.copyWith(
              color: context.color.primary.shade400,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class BottomWidget extends StatelessWidget {
  final double price;
  const BottomWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: d_margin2, horizontal: d_margin4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: context.textTheme.bodyText100
                      .copyWith(color: context.color.primary.shade300),
                ),
                Text(
                  '\$${price}',
                  style: context.textTheme.headline600.copyWith(
                      color: context.color.primary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            ShoeslyButton.pill(
              buttonText: sAddToCart,
              onPressed: () {},
              buttonSize: ShoeslyButtonSize.secondary,
            )
          ],
        ),
      ),
    );
  }
}
