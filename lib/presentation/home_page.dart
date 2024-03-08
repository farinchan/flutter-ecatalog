import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/product_create/product_create_bloc.dart';
import 'package:flutter_ecatalog/bloc/products/products_bloc.dart';
import 'package:flutter_ecatalog/data/models/request/product_create_request_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? titleController;
  TextEditingController? priceController;
  TextEditingController? descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductsBloc>().add(GetProductsAll());
    titleController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController!.dispose();
    priceController!.dispose();
    descriptionController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: const Text('Add Product'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: titleController,
                            decoration: const InputDecoration(labelText: 'Title'),
                          ),
                          TextFormField(
                            controller: priceController,
                            decoration: const InputDecoration(labelText: 'Price'),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        BlocConsumer<ProductCreateBloc, ProductCreateState>(
                          listener: (context, state) {
                            // TODO: implement listener
                            if (state is ProductCreateError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                            if (state is ProductCreateLoaded) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Product Created'),
                                ),
                              );
                               context
                                    .read<ProductsBloc>()
                                    .add(GetProductsAll());
                              Navigator.pop(context);
                            }
                          },
                          builder: (context, state) {
                            if (state is ProductCreateLoading) {
                              return const CircularProgressIndicator();
                            }
                            return TextButton(
                              onPressed: () {
                                final requestModel = ProductCreateRequestModel(
                                    title: titleController!.text,
                                    price: priceController!.text.isNotEmpty
                                        ? int.parse(priceController!.text)
                                        : 0,
                                    description: descriptionController!.text);

                                context
                                    .read<ProductCreateBloc>()
                                    .add(DoCreateProduct(requestModel));
                               
                              },
                              child: const Text('Save'),
                            );
                          },
                        ),
                      ]);
                });
          },
          child: const Icon(Icons.add),
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ProductsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(state.products.reversed.toList()[index].title),
                        subtitle: Text(state.products.reversed.toList()[index].price.toString()),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
