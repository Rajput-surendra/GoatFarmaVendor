
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
  static const String animalCatList = baseUrl+'animal_subcategory';
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
  static const String  punchIn = baseUrl+'punch_in';
  static const String  punchOut = baseUrl+'punch_out';
  static const String  checkStatus = baseUrl+'check_attendance';
  static const String  matingAnimalDate = baseUrl+'meating_animal_data';
  static const String  addMating = baseUrl+'add_meating';
  static const String  checkBreedMating = baseUrl+'check_breed';
  static const String  getMatingList = baseUrl+'meating_list';
  static const String  getSupplementList = baseUrl+'suplimet_list';
  static const String  getMedicine = baseUrl+'add_medicine';
  static const String  aadMedicineSchedule = baseUrl+'medicine_schedule';
  static const String  getMedicineList = baseUrl+'medicine_list';
  static const String  getMedicineDuaList = baseUrl+'medicine_due_records';
  static const String  getBreedingSingle = baseUrl+'get_breeding_data';
  static const String  getBreedingList = baseUrl+'get_breed_animal';
  static const String  getDateList = baseUrl+'age_calculate';
}



