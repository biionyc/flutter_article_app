import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/common/widgets/custom_snackbar.dart';
import 'package:article_app/features/articlesCrud/bloc/article_bloc.dart';
import 'package:article_app/features/articlesCrud/bloc/article_events.dart';
import 'package:article_app/features/articlesCrud/bloc/article_states.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/widgets/custom_button.dart';
import 'package:article_app/features/articlesCrud/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleForm extends StatefulWidget {
  const ArticleForm({super.key, this.article});

  final Article? article;

  @override
  State<ArticleForm> createState() => _ArticleFormState();
}

class _ArticleFormState extends State<ArticleForm> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isButtonDisabled = ValueNotifier(true);
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _authorController;
  late final TextEditingController _readTimeController;
  late final TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.article?.title ?? StringConstants.emptyString,
    );
    _descriptionController = TextEditingController(
      text: widget.article?.description ?? StringConstants.emptyString,
    );
    _authorController = TextEditingController(
      text: widget.article?.author ?? StringConstants.emptyString,
    );
    _readTimeController = TextEditingController(
      text: widget.article?.readTime.toString() ?? StringConstants.emptyString,
    );
    _categoryController = TextEditingController(
      text: widget.article?.category ?? StringConstants.emptyString,
    );
    if (widget.article == null) {
      _isButtonDisabled.value = false;
    }
  }

  void _saveArticle() {
    if (_formKey.currentState!.validate()) {
      if (widget.article != null) {
        context.read<ArticleBloc>().add(
              UpdateArticleEvent(
                id: widget.article!.id,
                title: _titleController.text == widget.article!.title
                    ? null
                    : _titleController.text,
                description:
                    _descriptionController.text == widget.article!.description
                        ? null
                        : _descriptionController.text,
                author: _authorController.text == widget.article!.author
                    ? null
                    : _authorController.text,
                category: _categoryController.text == widget.article!.category
                    ? null
                    : _categoryController.text,
              ),
            );
      } else {
        context.read<ArticleBloc>().add(
              CreateArticleEvent(
                title: _titleController.text,
                description: _descriptionController.text,
                readTime: (int.tryParse(_readTimeController.text) ??
                    NumberConstants.value_0.toInt()),
                author: _authorController.text,
                category: _categoryController.text,
              ),
            );
      }
    }
  }

  void _checkIfDisabled() {
    if (widget.article != null &&
        (_titleController.text != widget.article!.title ||
            _descriptionController.text != widget.article!.description ||
            _authorController.text != widget.article!.author ||
            _categoryController.text != widget.article!.category)) {
      _isButtonDisabled.value = false;
    } else if (widget.article == null) {
      _isButtonDisabled.value = false;
    } else {
      _isButtonDisabled.value = true;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _authorController.dispose();
    _readTimeController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {
        if (state is UpdateArticleError) {
          showSnackBar(context, state.message);
        } else if (state is UpdateArticleSuccess) {
          context.pop(state.updatedDetails);
        } else if (state is CreateArticleSuccess) {
          context.pop(state.createdDetails);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              top: NumberConstants.value_20,
              left: NumberConstants.value_30,
              right: NumberConstants.value_30,
            ),
            child: Column(
              spacing: NumberConstants.value_30,
              children: [
                CustomTextField(
                  controller: _titleController,
                  labelText: FieldLableConstants.title,
                  maxLines: NumberConstants.value_2.toInt(),
                  onChanged: (text) => _checkIfDisabled(),
                ),
                CustomTextField(
                  controller: _descriptionController,
                  labelText: FieldLableConstants.description,
                  maxLines: NumberConstants.value_8.toInt(),
                  onChanged: (text) => _checkIfDisabled(),
                ),
                CustomTextField(
                  controller: _authorController,
                  labelText: FieldLableConstants.author,
                  onChanged: (text) => _checkIfDisabled(),
                ),
                if (widget.article == null)
                  CustomTextField(
                    controller: _readTimeController,
                    labelText: FieldLableConstants.readTime,
                    keyboardType: TextInputType.number,
                    onChanged: (text) => _checkIfDisabled(),
                  ),
                CustomTextField(
                  controller: _categoryController,
                  labelText: FieldLableConstants.category,
                  onChanged: (text) => _checkIfDisabled(),
                ),
                const SizedBox(
                  height: NumberConstants.value_60,
                ),
                ValueListenableBuilder(
                  valueListenable: _isButtonDisabled,
                  builder: (context, isDisabled, child) {
                    return CustomButton(
                      onTap: _saveArticle,
                      isDisabled: isDisabled,
                      title: widget.article == null
                          ? StringConstants.create
                          : StringConstants.update,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
