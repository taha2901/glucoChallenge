import 'dart:io';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PicProductsView extends StatefulWidget {
  const PicProductsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PicProductsViewState createState() => _PicProductsViewState();
}

class _PicProductsViewState extends State<PicProductsView> {
  late GenerativeModel _model;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String _generatedText = 'Press the button to generate text using AI';
  bool _isSuitable = false;

  @override
  void initState() {
    super.initState();
    _initializeAIModel();
  }

  Future<void> _initializeAIModel() async {
    const apiKey = 'AIzaSyBROYhpNf5cdeHVCnAjEy-4PXfSWEiQjmI';
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 300),
    );
  }

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return; // Check if widget is still mounted before updating state

    setState(() {
      _image = image;
      _generatedText = 'Generating text using AI...';
      _isSuitable = false;
    });

    // Automatically generate text after picking the image
    if (_image != null) {
      await _generateText();
    }
  }

  Future<void> _generateText() async {
    if (_image == null) {
      setState(() {
        _generatedText = 'Please pick an image first';
        _isSuitable = false;
      });
      return;
    }

    final imageBytes = await _image!.readAsBytes();

    final prompt = TextPart(
      "بصفتك خبيرًا متخصصًا في تقييم ملاءمة الفواكه والأطعمة للأفراد المصابين بمرض السكري، "
      "مهمتك تتضمن تحليل الصور الواردة المتعلقة بأصناف مختلفة من الأطعمة. "
      "الهدف الأول هو تحديد نوع الفاكهة أو الطعام المتواجد في الصورة. "
      "بعد ذلك، يجب عليك تحديد مؤشر السكر الذيمي للعنصر المحدد. "
      "بناءً على هذا المؤشر، قدم توصيات حول ما إذا كان بإمكان الأفراد المصابين بالسكري أن يدخلوا الطعام المكتشف في نظامهم الغذائي. "
      "إذا كان الطعام مناسبًا، فحدد الكمية الموصى بها للاستهلاك. "
      "إذا لم يكن مناسبًا، فأوصي ببديل."
    );

    final imagePart = DataPart('image/jpeg', imageBytes);

    try {
      final response = await _model.generateContent([
        Content.multi([prompt, imagePart])
      ]);

      if (!mounted) return; // Check if widget is still mounted before updating state

      setState(() {
        _generatedText = response.text.toString();
        _isSuitable = _checkIfSuitable(response.text.toString()); // Replace with your logic
      });
    } catch (e) {
      print('Error generating text: $e');
      setState(() {
        _generatedText = 'Error generating text';
        _isSuitable = false;
      });
    }
  }

  bool _checkIfSuitable(String generatedText) {
    // Replace with your logic to determine if the generated text is suitable for diabetics
    return generatedText.contains('suitable');
  }

  @override
  void dispose() {
    // Clean up resources here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _image != null
                  ? Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorsManager.mainColor,
                              ),
                              clipBehavior:  Clip.antiAlias,
                              child: Image.file(File(_image!.path))),
                          ),
                          verticalSpace(20),
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _generatedText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              _isSuitable
                  ? const Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'This food item is suitable for diabetics',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
               Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.kPrimaryLightColor,
                    radius: 50.r,
                    child: Icon(Iconsax.camera, size: 50.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
