import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:upday_assignment/model/shutterstock_model.dart';
import 'shutterstock_item.dart';
import 'shutterstock_viewmodel.dart';
import 'package:upday_assignment/store/actions/shutterstock_action.dart';
import 'package:upday_assignment/store/state/app.state.dart';

import 'package:rxdart/rxdart.dart';

class ShutterStockHome extends StatefulWidget {
  const ShutterStockHome({Key key}) : super(key: key);

  @override
  _ShutterStockHomeState createState() => _ShutterStockHomeState();
}

class _ShutterStockHomeState extends State<ShutterStockHome> {
  final ScrollController _scrollController = new ScrollController();
  final PublishSubject<String> _onTextChanged = new PublishSubject();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //Scroll at last
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        var store = StoreProvider.of<AppState>(context);
        var state = store.state.shutterStockState;

        store.dispatch(new LoadImagesAction(paginate: true));
      }
    });

    _onTextChanged
        // If the text has not changed, do not perform a new search
        .distinct()
        // Wait for the user to stop typing for 250ms before running a search
        .debounceTime(const Duration(milliseconds: 250))
        .listen((String text) {
      // get the store
      var store = StoreProvider.of<AppState>(context);
      store.dispatch(new SearchByAction(searchText: text));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _onTextChanged.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff3f6),
      appBar: AppBar(
        title: Theme(
          data: Theme.of(context).copyWith(cursorColor: Colors.white),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: _onTextChanged.add,
          ),
        ),
      ),
      body: StoreConnector<AppState, ShutterStockViewModel>(
        distinct: true,
        converter: (store) => ShutterStockViewModel.fromStore(store),
        onInit: (store) =>
            store.dispatch(new LoadImagesAction(paginate: false)),
        builder: (_, vm) {
          // global and first loading indicator
          if (vm.state.loading) {
            return Center(
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.blue),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              vm.onLoad();
              await Future.delayed(Duration(seconds: 2));
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: vm.images.length,
              itemBuilder: (_, int index) {
                if (vm.state.paginate && vm.images.length - 1 == index) {
                  return Container(
                    height: 50,
                    child: Center(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(accentColor: Colors.blue),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }

                ShutterStockModel model = vm.images[index];
                return ShutterStockItem(
                  key: Key(model.id),
                  model: model,
                  onView: vm.onView,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
