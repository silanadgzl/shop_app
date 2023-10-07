import '../shared/export.dart';

class ProductNotifier extends  ChangeNotifier{
  int _activepage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

  int get activepage => _activepage;

  set activepage(int newIndex){
    activepage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;

  set shoesSizes(List<dynamic> newSizes){
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index){
    for(int i=0; i< _shoeSizes.length; i++){
      if(i==index){
        _shoeSizes[i]["isSelected"] = !_shoeSizes[i]["isSelected"];
      }
    }
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes){
    _sizes = newSizes;
    notifyListeners();
  }



  late Future<List<Sneakers>> male;
  late Future<List<Sneakers>> female;
  late Future<List<Sneakers>> kids;
  late Future<Sneakers> sneaker;

  void getMale(){
    male = Helper().getMaleSneakers();
  }
  void getFemale(){
    female = Helper().getFeMaleSneakers();
  }
  void getkids(){
    kids = Helper().getKidsSneakers();
  }


  void getShoes(String category, String id) {
    if (category == "Men's Running") {
      sneaker = Helper().getMaleSneakers().then((maleList) {
        return maleList.firstWhere((sneaker) => sneaker.id == id);
      });
    } else if (category == "Women's Running") {
      sneaker = Helper().getFeMaleSneakers().then((femaleList) {
        return femaleList.firstWhere((sneaker) => sneaker.id == id);
      });
    } else {
      sneaker = Helper().getKidsSneakers().then((kidsList) {
        return kidsList.firstWhere((sneaker) => sneaker.id == id);
      });
    }
  }

}