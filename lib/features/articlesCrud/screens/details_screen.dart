import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/widgets/custom_snackbar.dart';
import 'package:article_app/features/articlesCrud/bloc/article_bloc.dart';
import 'package:article_app/features/articlesCrud/bloc/article_events.dart';
import 'package:article_app/features/articlesCrud/bloc/article_states.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/widgets/article_details_body.dart';
import 'package:article_app/features/articlesCrud/widgets/article_details_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Article? _articleDetails;

  @override
  void initState() {
    super.initState();
    _getDetails();
  }

  void _getDetails() {
    context.read<ArticleBloc>().add(
          GetArticleDetailsEvent(id: widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {
        if (state is GetArticleDetailsError) {
          showSnackBar(context, state.message);
        } else if (state is GetArticleDetailsSuccess) {
          _articleDetails = state.details;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: NumberConstants.value_30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: NumberConstants.value_30,
                  ),
                  ArticleDetailsScreenAppBar(
                    category: _articleDetails?.category,
                  ),
                  SizedBox(
                    height: NumberConstants.value_10,
                  ),
                  if (_articleDetails != null)
                    ArticleDetailsBody(articleDetails: _articleDetails!),
                  if (_articleDetails == null &&
                      state is GetArticleDetailsLoading)
                    Flexible(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
