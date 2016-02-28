library Todo.Services.CategoryService;

class CategoryService {
  List<String> _categories = new List<String>();
  List<String> get categories => _categories;

  CategoryService() {
    _createRandomCategories();
  }

  void _createRandomCategories() {
    _categories.add("Home");
    _categories.add("Business");
    _categories.add("Travel");
  }
}
