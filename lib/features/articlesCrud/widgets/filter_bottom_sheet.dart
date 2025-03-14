import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/features/articlesCrud/bloc/article_bloc.dart';
import 'package:article_app/features/articlesCrud/bloc/article_events.dart';
import 'package:article_app/features/articlesCrud/cubit/cubit.dart';
import 'package:article_app/features/articlesCrud/utils/view_articles_utils.dart';
import 'package:article_app/features/articlesCrud/widgets/custom_button.dart';
import 'package:article_app/features/articlesCrud/widgets/custom_text_field.dart';
import 'package:article_app/features/articlesCrud/widgets/filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late final TextEditingController _filterController;
  final _formKey = GlobalKey<FormState>();
  FilterType? _filterType;

  @override
  void initState() {
    super.initState();
    _filterController = TextEditingController(
      text: StringConstants.emptyString,
    );
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(NumberConstants.value_30),
      child: Column(
        spacing: NumberConstants.value_20,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_filterType == null) ...[
            ...FilterType.values.map(
              (type) {
                return FilterItem(
                  title: type.label,
                  showRedDot:
                      context.read<FilterCubit>().getFilter(type) != null,
                  onTap: () {
                    setState(() {
                      _filterType = type;
                    });
                    String? filterValue =
                        context.read<FilterCubit>().getFilter(type);
                    if (filterValue != null) {
                      _filterController.text = filterValue;
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: NumberConstants.value_20,
            ),
            if (!context.read<FilterCubit>().hasNoFilters())
              CustomButton(
                onTap: () {
                  final filterCubit = context.read<FilterCubit>();
                  filterCubit.resetFilters();
                  context.pop();
                  context.read<ArticleBloc>().add(
                        GetArticlesEvent(
                          page: NumberConstants.value_1.toInt(),
                        ),
                      );
                },
                isDisabled: false,
                title: StringConstants.resetFilter,
              )
          ],
          if (_filterType != null) ...[
            Form(
              key: _formKey,
              child: CustomTextField(
                controller: _filterController,
                labelText: _filterType!.label,
              ),
            ),
            CustomButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final filterCubit = context.read<FilterCubit>();
                  filterCubit.setFilter(
                    _filterType!,
                    _filterController.text,
                  );
                  context.pop();
                  context.read<ArticleBloc>().add(
                        GetArticlesEvent(
                          page: NumberConstants.value_1.toInt(),
                          title: filterCubit.getFilter(FilterType.title) ??
                              StringConstants.emptyString,
                          categories:
                              filterCubit.getFilter(FilterType.category) ??
                                  StringConstants.emptyString,
                          authors: filterCubit.getFilter(FilterType.author) ??
                              StringConstants.emptyString,
                        ),
                      );
                }
              },
              isDisabled: false,
              title: StringConstants.filter,
            )
          ],
          const SizedBox(
            height: NumberConstants.value_70,
          ),
        ],
      ),
    );
  }
}
