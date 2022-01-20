import 'package:alpha/constants/constants.dart';
import 'package:alpha/providers/main_provider.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:alpha/components/app_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:provider/src/provider.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({Key? key}) : super(key: key);

  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {

  late final _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.pageAppBar(context, 'Create Ad'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text('Insert your ad information', style: TextStyle(fontSize: 18),).tr(),
            const SizedBox(height: 14,),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'houseName',
                      decoration: const InputDecoration(
                        labelText: 'House Name',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      onChanged: (text) {

                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return 'This field cannot be empty'.tr();
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 30,),
                    FormBuilderChoiceChip(
                      name: 'choice_chip',
                      decoration: const InputDecoration(
                        labelText: 'Rent type',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'You must select an option'.tr();
                        }
                        return null;
                      },
                      spacing: 10,
                      options: const [
                        FormBuilderFieldOption(
                            value: 'Test', child: Text('Family')),
                        FormBuilderFieldOption(
                            value: 'Test 1', child: Text('Family or Bachelor')),
                        FormBuilderFieldOption(
                            value: 'Test 2', child: Text('Sub-Let')),
                        FormBuilderFieldOption(
                            value: 'Test 3', child: Text('Mess-Male')),
                        FormBuilderFieldOption(
                            value: 'Test 4', child: Text('Mess-Female')),
                        FormBuilderFieldOption(
                            value: 'Test 5', child: Text('Commercial')),
                      ],
                    ),
                    const SizedBox(height: 30),
                    FormBuilderDropdown(
                      name: 'city',
                      decoration: const InputDecoration(
                        labelText: 'City',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      dropdownColor: Theme.of(context).secondaryHeaderColor,
                      onChanged: (text) {

                      },
                      validator: (value){
                        if(value == null) {
                          return 'You must select an option'.tr();
                        }
                      },
                      items: cityList.map((option) {
                        return DropdownMenuItem(
                          child: Text(option),
                          value: option,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    FormBuilderDropdown(
                      name: 'area',
                      decoration: const InputDecoration(
                        labelText: 'Area',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      dropdownColor: Theme.of(context).secondaryHeaderColor,
                      onChanged: (text) {

                      },
                      validator: (value){
                        if(value == null) {
                          return 'You must select an option'.tr();
                        }
                      },
                      items: dhakaAreaList.map((option) {
                        return DropdownMenuItem(
                            child: Text(option),
                            value: option,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    FormBuilderTextField(
                      name: 'address',
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      maxLines: 4,
                      onChanged: (text) {

                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return 'This field cannot be empty'.tr();
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 30,),
                    FormBuilderImagePicker(
                      name: 'images',
                      decoration: const InputDecoration(
                        labelText: 'Pick some images of your house',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14)
                      ),
                      maxImages: 5,
                      validator: (value){
                        if(value == null) {
                          return "Please provide at least one image".tr();
                        }
                      },
                    ),
                    const SizedBox(height: 20,),
                    FormBuilderTextField(
                      name: 'rent',
                      decoration: const InputDecoration(
                        labelText: 'Rent',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      //style: const TextStyle(fontSize: 20),
                      onChanged: (text) {

                      },
                      //valueTransformer: (text) => num.tryParse(text!),
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return 'This field cannot be empty'.tr();
                        }
                        if(num.tryParse(value) == null) {
                          return "Enter numbers only".tr();
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 30),
                    FormBuilderDropdown(
                      name: 'month',
                      decoration: const InputDecoration(
                        labelText: 'From which month',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      dropdownColor: Theme.of(context).secondaryHeaderColor,
                      onChanged: (text) {

                      },
                      validator: (value){
                        if(value == null) {
                          return 'You must select an option'.tr();
                        }
                      },
                      items: monthList.map((option) {
                        return DropdownMenuItem(
                          child: Text(option),
                          value: option,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    FormBuilderTextField(
                      name: 'contact',
                      decoration: const InputDecoration(
                        labelText: 'Contact No.',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(14),
                      ),
                      onChanged: (text) {

                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return 'This field cannot be empty'.tr();
                        }
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 30,),

                  ],
                )
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Submit".tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        print(_formKey.currentState.value);
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Reset".tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.reset();
                    },
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
