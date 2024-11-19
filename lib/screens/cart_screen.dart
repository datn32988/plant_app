import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/cart_bloc/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    int quality = 1;
    return Scaffold(
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return ListView.builder(
        itemCount: state.plants.length,
        itemBuilder: (context, index) {
          final plant = state.plants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 120,
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(plant.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plant.name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [const Text("Size: "), Text(plant.size)],
                          ),
                          Row(
                            children: [
                              const Text("Price: "),
                              Text(plant.price.toString())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            cartBloc.add(RemovePlant(plants: plant));
                          },
                          icon: const Icon(Icons.delete)),
                      SizedBox(
                        height: 19,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_circle)),
                          Text(quality.toString()),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle)),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      );
    }));
  }
}
