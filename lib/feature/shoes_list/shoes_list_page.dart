import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/components/components.dart';
import 'package:shoesly/resources/resources.dart';
import 'package:shoesly/feature/shoe_detail/shoe_detail_page.dart';
import 'package:shoesly/feature/shoes_list/model/shoes_model.dart';
import 'package:shoesly/feature/shoes_list/shoes_list_bloc.dart';

class ShoesListPage extends StatelessWidget {
  const ShoesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ShoesBloc()..add(FetchShoesEvent());
      },
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoes App'),
      ),
      body: BlocBuilder<ShoesBloc, ShoesState>(
        builder: (context, state) {
          if (state is ShoesInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShoesLoaded) {
            return _HomeWidget(state.model);
            // return ListView.builder(
            //   itemCount: state.model.
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(state.shoes[index]),
            //     );
            //   },
            // );
          }
          return Container();
        },
      ),
    );
  }
}

class _HomeWidget extends StatelessWidget {
  final ShoesModel? model;

  const _HomeWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0, //
        childAspectRatio: 0.5,
        // Adjust aspect ratio to match desired design
      ),
      itemCount: model?.shoes?.length ?? 0,
      itemBuilder: (context, index) {
        // return SizedBox.shrink();
        return _ShoeItem(item: model?.shoes![index]);
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}

class _ShoeItem extends StatelessWidget {
  final Shoe? item;
  const _ShoeItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final color = context.color;
    return InkWell(
      onTap: () {
        // Navigate to the next screen and pass the data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoeDetailPage(model: item!),
          ),
        );
      },
      child: SizedBox(
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: ShoeslyImage.network(
                  url:
                      'https://res.cloudinary.com/dkqhmiqas/image/upload/v1718345839/IMG_6823_ex81ff.jpg'),
            ),
            const VerticalGap(d_margin1025),
            Text(
              'Jordan 1 Retro High tye dye ',
              style: context.textTheme.bodyText100
                  .copyWith(color: color.primary.shade500),
              maxLines: 2,
            ),
            const VerticalGap(d_margin05),
            Row(
              children: [
                Text(
                  (item!.rating ?? '').toString(),
                  style: context.textTheme.urbanistB,
                ),
                const HorizontalGap(d_margin05),
                Expanded(
                  child: Text(
                    '(${(item?.numberOfReviews ?? 0).toString()} Reviews) ',
                    style: context.textTheme.bodyText100
                        .copyWith(color: context.color.primary.shade300),
                  ),
                ),
              ],
            ),
            Text(
              '\$ ${item?.price ?? "0"}',
              style: context.textTheme.urbanist24B,
            )
          ],
        ),
      ),
    );
  }
}
