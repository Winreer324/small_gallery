import 'package:elementary/elementary.dart';
import 'package:small_gallery/app/ui/base/base_pagination_wm.dart';
import 'package:small_gallery/app/ui/elementary/infinity_list/infinity_list_screen.dart';

import 'infinity_list_model.dart';

class InfinityListScreenWM extends WidgetModel<InfinityListScreen, InfinityListModel> implements IInfinityListWm {
  final EntityStateNotifier<List<int>?> _currentInfinityList = EntityStateNotifier(null);

  final ScrollController _scrollController = ScrollController();

  InfinityListScreenWM(InfinityListModel model) : super(model);

  int _pagePagination = 1;

  @override
  ValueNotifier<bool> get loadingPagination => model.loadingPagination;

  @override
  ListenableState<EntityState<List<int>?>> get currentInfinityList => _currentInfinityList;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initData();
  }

  Future<void> _initData() async {
    _currentInfinityList.loading();
    final response = await model.fetchData(page: _pagePagination);
    _currentInfinityList.content(response.items);
  }

  @override
  Future<void> fetchDataByPagination() async {
    if (model.loadingPagination.value) {
      return;
    }
    _pagePagination++;
    final response = await model.fetchData(page: _pagePagination);
    _currentInfinityList.content(response.items);
  }

  @override
  void dispose() {
    if (_scrollController.hasClients) {
      _scrollController.dispose();
    }
    super.dispose();
  }
}

InfinityListScreenWM createInfinityListScreenWM(BuildContext _) => InfinityListScreenWM(
      InfinityListModel(),
    );

abstract class IInfinityListWm extends IWidgetModel implements BasePaginationWm {
  ListenableState<EntityState<List<int>?>> get currentInfinityList;
}
