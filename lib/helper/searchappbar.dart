import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundromat_flutter/config/router/router.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String)? onSearch; // Callback for search
  final Function()? onSearchClear; // Callback when search is cleared
  final String title;
  final Duration debounceTime; // เวลาหน่วง debounce สำหรับการค้นหา

  const SearchAppBar({
    Key? key,
    this.onSearch,
    this.onSearchClear,
    this.title = 'My App',
    this.debounceTime = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  final _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _searchController.text.isEmpty) {
        _stopSearching();
      }
    });

    // Add listener for search text changes
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(widget.debounceTime, () {
      // Only trigger search if the text is not empty and callback exists
      if (_searchController.text.isNotEmpty && widget.onSearch != null) {
        widget.onSearch!(_searchController.text);
      }
    });
  }

  void _startSearching() {
    setState(() {
      _isSearching = true;
    });
    _animationController.forward();
    _focusNode.requestFocus();
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
    });
    _animationController.reverse();
    if (_searchController.text.isNotEmpty) {
      _searchController.clear();
      // Call onSearchClear callback if provided
      widget.onSearchClear?.call();
    }
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _animationController.dispose();
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Opacity(
                opacity: 1 - _animation.value,
                child: _isSearching ? const SizedBox() : Text(widget.title),
              ),
              Opacity(
                opacity: _animation.value,
                child: Container(
                  height: kToolbarHeight - 16,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _stopSearching,
                      ),
                    ),
                    onChanged:  (value) {
                      // Trigger immediate search on submit
                      if (widget.onSearch != null) {
                        widget.onSearch!(value);
                      }
                    },
                    // onSubmitted: (value) {
                    //   // Trigger immediate search on submit
                    //   if (value.isNotEmpty && widget.onSearch != null) {
                    //     widget.onSearch!(value);
                    //   }
                    // },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            context.push(AppRouter.favoritePokemonScreen);
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _startSearching,
        ),
      ],
    );
  }
}

