import '../shared/app_style.dart';
import '../shared/export.dart';


class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this, initialIndex: widget.tabIndex);

  late Future<List<Sneakers>> male;
  late Future<List<Sneakers>> female;
  late Future<List<Sneakers>> kids;

  void getMale() {
    male = Helper().getMaleSneakers();
  }

  void getFemale() {
    female = Helper().getFeMaleSneakers();
  }

  void getkids() {
    kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    getMale();
    getFemale();
    getkids();
    _tabController.animateTo(widget.tabIndex,curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }


  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {

    var productNotifier = Provider.of<ProductNotifier>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 15, 0, 0), //45-15
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(AntIcons.close, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(AntIcons.sliders, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(text: "Men Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  GestureDetector(
                    onTap: (){},
                    child: LatestShoes(male: productNotifier.male),
                  ),
                  GestureDetector(
                    onTap: () {
                      // İkinci Tab'a tıklandığında yapılacak işlemleri buraya ekleyin.
                    },
                    child: LatestShoes(male: productNotifier.female),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Üçüncü Tab'a tıklandığında yapılacak işlemleri buraya ekleyin.
                    },
                    child: LatestShoes(male: productNotifier.kids),
                  ),                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Görüntülemek istediğiniz öğelerin sayısını belirtin
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CustomSpacer(),
                      Text(
                        "Filter",
                        style: appStyle(40, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      Text(
                        "Gender",
                        style: appStyle(20, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          CategoryBtn(buttonClr: Colors.black, label: "Men"),
                          CategoryBtn(buttonClr: Colors.grey, label: "Women"),
                          CategoryBtn(buttonClr: Colors.grey, label: "Kids"),
                        ],
                      ),
                      const CustomSpacer(),
                      Text(
                        "Category",
                        style: appStyle(20, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          CategoryBtn(buttonClr: Colors.black, label: "Shoes"),
                          CategoryBtn(
                              buttonClr: Colors.grey, label: "Apparrels"),
                          CategoryBtn(
                              buttonClr: Colors.grey, label: "Accessories"),
                        ],
                      ),
                      const CustomSpacer(),
                      Text(
                        "Price",
                        style: appStyle(20, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      Slider(
                        value: _value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        label: _value.toString(),
                        secondaryTrackValue: 200,
                        onChanged: (double value) {},
                      ),
                      const CustomSpacer(),
                      Text(
                        "Brand",
                        style: appStyle(20, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 80,
                        child: ListView.builder(
                          itemCount: brand.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Image.asset(
                                  brand[index],
                                  height: 60,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
