
import 'apiBasehelper.dart';
ApiBaseHelper apiBaseHelper = ApiBaseHelper();
class ApiService {
 static const String baseUrl = "https://developmentalphawizz.com/goat_farm/app/v1/api/";
  static const String imageUrl = "https://developmentalphawizz.com/goat_farm/";
  static const String userTypeApi = baseUrl+'user_type';
  static const String register = baseUrl+'register';
  static const String login = baseUrl+'login';
  static const String userPermission = baseUrl+'users_permission';
  static const String animalCategory = baseUrl+'animal_category';
  static const String purchaseCategory = baseUrl+'purchase_categories';
  static const String animalCount = baseUrl+'animal_counts';
  static const String addPurchase = baseUrl+'add_purchase';
  static const String purchaseList = baseUrl+'purchase_list';
  static const String addBreed = baseUrl+'add_breed';
  static const String breedList = baseUrl+'breed_list';
  static const String addAnimal = baseUrl+'add_animal';
  static const String animalList = baseUrl+'animal_list';
  static const String  addWeight = baseUrl+'add_weight';
  static const String  getWeight = baseUrl+'get_weight';
  static const String  getLatWeight = baseUrl+'get_last_weight';
  static const String  addMilk = baseUrl+'add_milk';
  static const String  getMilk = baseUrl+'milk_record';
  static const String  getSingleMilk = baseUrl+'single_milk_record';
  static const String  getDeathSingle = baseUrl+'animal_data_deth';
  static const String  addDeath = baseUrl+'add_deth';
  static const String  getDeathList = baseUrl+'deth_reports';
}



