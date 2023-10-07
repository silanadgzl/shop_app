import 'app_style.dart';
import 'export.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {

    var productNotifier = Provider.of<ProductNotifier>(context);

    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.405,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    "Error ${snapshot.error}",
                    style: const TextStyle(color: Colors.blue, fontSize: 25),
                  );
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return GestureDetector(
                          onTap: (){
                            productNotifier.shoesSizes = shoe.sizes;
                            print(productNotifier.shoeSizes);//////////////////////
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(id: shoe.id, category: shoe.category),));
                            },
                          child: ProductCard(
                              price: "\$${shoe.price}",
                              category: shoe.category,
                              id: shoe.id,
                              name: shoe.name,
                              image: shoe.imageUrl[0]),
                        );
                      });
                }
              },
            )),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appStyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductByCat(tabIndex: tabIndex),
                          ));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appStyle(22, Colors.black, FontWeight.w500),
                        ),
                        const Icon(
                          AntIcons.caret_right,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    "Error ${snapshot.error}",
                    style: const TextStyle(color: Colors.blue, fontSize: 25),
                  );
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NewShoes(imageUrl: shoe.imageUrl[1]),
                        );
                      });
                }
              },
            ))
      ],
    );
  }
}
