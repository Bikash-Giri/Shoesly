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
