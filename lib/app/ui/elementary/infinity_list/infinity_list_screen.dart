import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:small_gallery/app/ui/widgets/animation_loader.dart';
import 'package:small_gallery/app/ui/widgets/pagination_widget.dart';

import 'infinity_list_wm.dart';

class InfinityListScreen extends ElementaryWidget<IInfinityListWm> {
  const InfinityListScreen({
    Key? key,
    WidgetModelFactory<InfinityListScreenWM> wmFactory = createInfinityListScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfinityListWm wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity list'),
        elevation: 0,
      ),
      body: EntityStateNotifierBuilder<List<int>?>(
        listenableEntityState: wm.currentInfinityList,
        errorBuilder: (_, __, ___) {
          return const SizedBox();
        },
        loadingBuilder: (_, __) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        builder: (_, data) {
          if (data?.isEmpty == true) {
            return const SizedBox();
          }

          return PaginationWidget(
            scrollController: wm.scrollController,
            callbackPagination: wm.fetchDataByPagination,
            child: LoaderPaginationWidgetWM(
              valueNotifier: wm.loadingPagination,
              child: ListView(
                shrinkWrap: true,
                controller: wm.scrollController,
                children: List.generate(
                    data!.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(data[index].toString()),
                        )),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoaderPaginationWidgetWM extends StatelessWidget {
  final Widget child;
  final ValueNotifier<bool> valueNotifier;

  const LoaderPaginationWidgetWM({Key? key, required this.child, required this.valueNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Align(
          alignment: Alignment.bottomCenter,
          child: ValueListenableBuilder<bool>(
            valueListenable: valueNotifier,
            builder: (_, value, ___) {
              if (!value) {
                return const SizedBox();
              }
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: AnimationLoader(),
              );
            },
          ),
        ),
      ],
    );
  }
}
