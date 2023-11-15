import '../model/catagories_model.dart';

String apiKey = "563492ad6f91700001000001716aa1a397d2418ea89d32fdce137087";

List<CatagorieModel> getCatagories() {
  List<CatagorieModel> categories = [];
  CatagorieModel catagorieModel = CatagorieModel();

  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catagorieModel.catagoriesName = "Street Art";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catagorieModel.catagoriesName = "Wild Life";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  //
  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catagorieModel.catagoriesName = "Nature";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  //
  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catagorieModel.catagoriesName = "City";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  //
  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catagorieModel.catagoriesName = "Motivation";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  //
  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catagorieModel.catagoriesName = "Bikes";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  //
  catagorieModel.imageUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catagorieModel.catagoriesName = "Cars";
  categories.add(catagorieModel);
  catagorieModel = CatagorieModel();

  return categories;
}
