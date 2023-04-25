import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/utils/form_validators.dart';
import 'package:invoiceapp/constants/utils/formatters.dart';
import 'package:invoiceapp/constants/utils/random_nums.dart';
import 'package:invoiceapp/src/features/shared/widgets/custom_text_form_field.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/bill_to_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/item_list_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/drop_down_menu.dart';
import 'package:invoiceapp/src/features/shared/widgets/invoice_form_screen/presentation/list_item.dart';
import 'package:invoiceapp/theme/source_of_truth.dart';
import 'package:invoiceapp/theme/theme.dart';

// final _formKey = GlobalKey<FormState>();

class BillTo extends StatelessWidget {
  // TODO: Remove Keys, either get rid of them or abstract away

  final BillToModel model;
  final ItemListModel itemsModel;
  final GlobalKey<FormState> formState;

  const BillTo(
      {required this.model,
      required this.formState,
      required this.itemsModel,
      super.key});

  @override
  Widget build(BuildContext context) {
    final purple = CustomTheme.otherColors['purple0'] as Color;
    final gaph = Gaps.heigth(18);
    final textStyle = TextStyle(
      fontSize: 18,
      color: purple,
    );
    const double textInputWidth = 170;

    return Form(
      key: formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bill To',
            style: textStyle,
          ),
          gaph,
          CustomTextFormField(
            title: "Client's Name",
            controller: model.clientNameController,
            validator: FormValidators.textField,
          ),
          gaph,
          CustomTextFormField(
            title: "Client's Email",
            controller: model.clientEmailController,
          ),
          gaph,
          CustomTextFormField(
            title: 'Street Address',
            controller: model.streetAddController,
            validator: FormValidators.textNumField,
          ),
          gaph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: textInputWidth,
                child: CustomTextFormField(
                  title: 'City',
                  controller: model.cityController,
                  validator: FormValidators.textField,
                ),
              ),
              SizedBox(
                width: textInputWidth,
                child: CustomTextFormField(
                  title: 'Post Code',
                  controller: model.postCodeController,
                  validator: FormValidators.numberField,
                ),
              ),
            ],
          ),
          gaph,
          CustomTextFormField(
            title: 'Country',
            controller: model.countryController,
            validator: FormValidators.textField,
          ),
          gaph,
          CustomTextFormField(
            title: 'Invoice Date',
            controller: model.dateController,
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _initDateTime(),
                firstDate: _initDateTime(),
                lastDate: DateTime(3000),
              );
              if (newDate != null) {
                model.dateController.text =
                    DateFormatter.dateTimeToString(newDate);
              }
            },
          ),
          gaph,
          CustomDropDownMenu(
            controller: model.dropDownMenuController,
          ),
          gaph,
          CustomTextFormField(
            title: 'Project Description',
            controller: model.projectDescController,
            validator: FormValidators.textField,
          ),
          gaph,
          Text(
            'Item List',
            style: textStyle,
          ),
          Column(
            children: [...itemsModel.items.values],
          ),
          gaph,
          Row(
            children: [
              Expanded(child: _AddButton(
                onPressed: () {
                  final model = CustomListItemModel();
                  final String index =
                      RandomRange.integer(1001, 999999).toString();
                  final listItem = CustomListItem(
                    listItemModel: model,
                    index: index,
                    onPress: itemsModel.removeItem,
                  );

                  final Map<String, CustomListItem> entry = {index: listItem};
                  final Map<String, CustomListItemModel> itemModelEntry = {
                    index: model
                  };

                  itemsModel.addItem(entry);
                  itemsModel.addItemModel(itemModelEntry);

                  itemsModel.itemModels.forEach((key, value) {
                    print(
                        'FROM invoice_from_modal itemNameController text: ${value.itemNameController.text}');
                  });
                },
              )),
            ],
          )
        ],
      ),
    );
  }
}

typedef VoidCallback = Function();

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AddButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: onPressed,
        child: const Text(
          'Add Item',
        ),
      );
}

DateTime _initDateTime() => DateTime.now();
