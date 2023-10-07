import 'export.dart';

class BottoNavBar extends StatelessWidget {
  const BottoNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(builder: (context, mainScreenNotifier, child) {
      return SafeArea(child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotomNavWidget(
                  onTap: () {mainScreenNotifier.pageIndex = 0;},
                  icon: mainScreenNotifier==0 ?CommunityMaterialIcons.home_outline:Icons.home,
                ),
                BotomNavWidget(
                  onTap: () {mainScreenNotifier.pageIndex = 1;},
                  icon: Ionicons.search,
                ),
                BotomNavWidget(
                  onTap: () {mainScreenNotifier.pageIndex = 2;},
                  icon: mainScreenNotifier.pageIndex == 2?Ionicons.heart:Ionicons.heart_circle_outline,
                ),
                BotomNavWidget(
                  onTap: () {mainScreenNotifier.pageIndex = 3;},
                  icon: mainScreenNotifier.pageIndex==3 ? Ionicons.cart: Ionicons.cart_outline,
                ),
                BotomNavWidget(
                  onTap: () {mainScreenNotifier.pageIndex = 4;},
                  icon: mainScreenNotifier.pageIndex==4 ? Ionicons.person: Ionicons.person_outline,
                ),
              ]),
        ),
      ));
    },);
  }
}
