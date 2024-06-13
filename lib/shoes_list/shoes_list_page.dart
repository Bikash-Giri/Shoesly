import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/shoes_list/shoes_list_bloc.dart';

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
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShoesLoaded) {
            print(state.model);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio:
                    0.5, // Adjust aspect ratio to match desired design
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ShoeItem(index: index);
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
  final int index;
  const ShoeItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
