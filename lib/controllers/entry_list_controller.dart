import 'package:bmi_calculator/controllers/firestore_controller.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:get/get.dart';

class EntryListController extends GetxController {
  final FirestoreController firestoreController = Get.find();
  final _entries = <BmiModel>[].obs;
  final currentPage = 0.obs;
  final _itemsPerPage = 10;
  final _isLoading = true.obs;
  final _hasError = false.obs;
  final _errorMessage = ''.obs;

  List<BmiModel> get entries => _entries;
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    _fetchEntries();
  }

  void _fetchEntries() {
    _isLoading.value = true;
    _hasError.value = false;
    firestoreController.entriesStream.listen(
      (entries) {
        _entries.assignAll(entries);
        _isLoading.value = false;
      },
      onError: (error) {
        _isLoading.value = false;
        _hasError.value = true;
        _errorMessage.value = error.toString();
      },
    );
  }

  List<BmiModel> get paginatedEntries {
    if (_entries.isEmpty) return [];
    final startIndex = currentPage.value * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage > _entries.length
        ? _entries.length
        : startIndex + _itemsPerPage;
    return _entries.sublist(startIndex, endIndex);
  }

  int get totalPages => (_entries.length / _itemsPerPage).ceil();

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    }
  }
}
