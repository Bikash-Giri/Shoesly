import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/components/gaps.dart';
import 'package:shoesly/resources/dimens.dart';
import 'package:shoesly/resources/image.dart';
import 'package:shoesly/resources/theme.dart';
import 'package:shoesly/resources/theme_bloc.dart';
import 'package:shoesly/shoes_list/model/shoes_model.dart';
import 'package:shoesly/shoes_list/shoes_list_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            print(state.model);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                // childAspectRatio:
                //     0.5, // Adjust aspect ratio to match desired design
              ),
              itemCount: state.model?.shoes?.length ?? 0,
              itemBuilder: (context, index) {
                // return SizedBox.shrink();
                return ShoeItem(item: state.model?.shoes![index]);
              },
              padding: EdgeInsets.all(10.0),
            );
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

class ShoeItem extends StatelessWidget {
  final Shoe? item;
  const ShoeItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final color = context.color;
    return ColoredBox(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: ShoeslyImage.network(
                url:
                    'https://res.cloudinary.com/dkqhmiqas/image/upload/v1718345839/IMG_6823_ex81ff.jpg'),
          ),
          const VerticalGap(d_margin1025),
          Text(
            'Jordan 1 Retro High tye dye',
            style: context.textTheme.bodyText100
                .copyWith(color: color.primary.shade500),
          ),
          const VerticalGap(d_margin05),
          Row(
            children: [
              Text(
                (item?.rating ?? '').toString(),
                style: context.textTheme.urbanistB,
              ),
              const HorizontalGap(d_margin05),
              Text(
                '(${(item?.numberOfReviews ?? 0).toString()} Reviews) ',
                style: context.textTheme.bodyText100
                    .copyWith(color: context.color.primary.shade300),
              ),
            ],
          ),
          Text(
            '\$ ${item?.price ?? "0"}',
            style: context.textTheme.urbanist24B,
          )
        ],
      ),
    );
  }
}
