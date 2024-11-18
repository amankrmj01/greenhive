import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controllers/add_green_house.controller.dart';

class AddGreenHouseScreen extends GetView<AddGreenHouseController> {
  const AddGreenHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Greenhouse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextFormField(
                  controller: controller.nameController,
                  labelText: 'Greenhouse Name',
                  validator: (value) =>
                      _validateNonEmpty(value, 'Greenhouse Name'),
                ),
                _buildTextFormField(
                  controller: controller.descriptionController,
                  labelText: 'Description',
                  validator: (value) => _validateNonEmpty(value, 'Description'),
                ),
                _buildTextFormField(
                  controller: controller.microcontrollerIdController,
                  labelText: 'Microcontroller ID',
                  validator: (value) =>
                      _validateNonEmpty(value, 'Microcontroller ID'),
                ),
                _buildTextFormField(
                    controller: controller.pubController,
                    labelText: 'pub topic'),
                _buildTextFormField(
                    controller: controller.subController,
                    labelText: 'sub topic'),
                _buildTextFormField(
                  controller: controller.cropNameController,
                  labelText: 'Crop Type',
                  validator: (value) => _validateNonEmpty(value, 'Crop Type'),
                ),
                _buildTextFormField(
                  controller: controller.cropTimePeriodController,
                  labelText: 'Crop Time Period (days)',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter crop time period';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Invalid number format';
                    }
                    return null;
                  },
                ),
                16.heightBox,
                _FilePickerWidget(
                  label: 'Pick Certificate File',
                  path: controller.certPath,
                ),
                _FilePickerWidget(
                  label: 'Pick Private Key File',
                  path: controller.privateKeyPath,
                ),
                _FilePickerWidget(
                  label: 'Pick Root CA File',
                  path: controller.rootCaPath,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.readCertificateFiles();
                    await controller.saveGreenhouse();
                  },
                  child: const Text('Save Greenhouse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  String? _validateNonEmpty(String? value, String field) {
    if (value == null || value.isEmpty) {
      return 'Please enter $field';
    }
    return null;
  }
}

class _FilePickerWidget extends StatefulWidget {
  final String label;
  final RxString path;

  const _FilePickerWidget({
    required this.label,
    required this.path,
    super.key,
  });

  @override
  State<_FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<_FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () async {
            String? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['txt'],
            ).then((result) => result?.files.single.path);

            if (result != null) {
              widget.path.value = result;

              // Simulate verification if needed
              await Future.delayed(const Duration(milliseconds: 500));
            }
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Obx(
              () => Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(Icons.attach_file, size: 24, color: Colors.grey),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.path.value.isEmpty
                          ? widget.label
                          : 'Picked: ${widget.path.value.split('/').last}',
                      style: TextStyle(
                        fontSize: 16,
                        color: widget.path.value.isEmpty
                            ? Colors.grey
                            : Colors.black,
                        fontWeight: widget.path.value.isEmpty
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.path.value.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.check_circle, color: Colors.green),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
