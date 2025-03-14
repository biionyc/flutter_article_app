import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/features/articlesCrud/cubit/cubit.dart';
import 'package:article_app/features/articlesCrud/cubit/cubit_state.dart';
import 'package:article_app/features/articlesCrud/widgets/filter_bottom_sheet.dart';
import 'package:article_app/features/articlesCrud/widgets/red_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: NumberConstants.value_30,
        right: NumberConstants.value_18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: NumberConstants.value_10,
            children: [
              DecoratedBox(
                decoration: ShapeDecoration(
                  color: Colors.grey[NumberConstants.value_300.toInt()],
                  shape: OvalBorder(),
                ),
                child: Padding(
                  padding: EdgeInsets.all(NumberConstants.value_10),
                  child: Icon(
                    Icons.person,
                    size: NumberConstants.value_30,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.pulkitAgrawal,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: NumberConstants.value_16,
                      fontFamily: StringConstants.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    StringConstants.welcomeBack,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: NumberConstants.value_14,
                      fontFamily: StringConstants.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              final bool hasNoFilters =
                  context.read<FilterCubit>().hasNoFilters();
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: NumberConstants.value_27,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return FilterBottomSheet();
                        },
                      );
                    },
                  ),
                  if (!hasNoFilters)
                    Positioned(
                      top: NumberConstants.value_15,
                      right: NumberConstants.value_10,
                      child: const RedDot(),
                    )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
