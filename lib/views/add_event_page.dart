import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/data/models/media_model.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;
import '../resources/assets/colour_pallete.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  List<File> imageList = [];
  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  bool playedOnce = false;
  String? recordingPath;
  String? title;
  String? description;
  List<CreateMedia> mediaList = [];

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    File f = File(returnedImage.path);
    setState(() {
      imageList.add(f);
    });
    mediaList.add(CreateMedia(f, f.path.split('.').last));
  }

  Future takePhoto() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    File f = File(returnedImage.path);
    setState(() {
      imageList.add(f);
    });
    mediaList.add(CreateMedia(f, f.path.split('.').last));
  }

  recordAudio() async {
    if (isRecording) {
      String? filePath = await audioRecorder.stop();
      if (filePath != null) {
        setState(() {
          isRecording = false;
          recordingPath = filePath;
        });
      }
    } else {
      if (await audioRecorder.hasPermission()) {
        final Directory appDocumentsDir =
            await getApplicationDocumentsDirectory();
        final String filePath =
            p.join(appDocumentsDir.path, 'recorded_audio.wav');
        await audioRecorder.start(const RecordConfig(), path: filePath);
        mediaList.add(CreateMedia(File(filePath), 'mp3'));
        setState(() {
          isRecording = true;
          recordingPath = null;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          audioPlayer.stop();
          playedOnce = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController =
        Provider.of<ProjectController>(context);
    final EventController eventController =
        Provider.of<EventController>(context);

    return Scaffold(
      appBar: addAppBar(context, 'Criar um relato', onPressed: () async {
        await eventController.createEvent(
            title!, description!, projectController.project!.id!, mediaList);
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(projectController),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 30),
              child: addEventForm(projectController),
            ),
            imageCarousel(imageList),
          ],
        ),
      ),
    );
  }

  Widget audioPlayerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        audioPlayer.playing
            ? buttonText(Icons.pause, 'Pausar áudio', () async {
                await audioPlayer.pause();
                setState(() {});
              })
            : buttonText(Icons.play_arrow, 'Escutar áudio', () async {
                if (!playedOnce) {
                  audioPlayer.setFilePath(recordingPath!);
                  playedOnce = true;
                }
                await audioPlayer.play();
                setState(() {});
              }),
        IconButton(
            onPressed: () {
              setState(() {
                recordingPath = null;
              });
            },
            icon: Icon(Icons.delete,
                color: Colors.red,
                size: MediaQuery.of(context).size.height / 30)),
      ],
    );
  }

  Widget leadingImage(ProjectController projectController) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/resources/assets/images/stock-image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 50,
                left: MediaQuery.of(context).size.width / 20),
            child: Text(projectController.project!.name ?? "Projeto sem nome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 25,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }

  Widget addEventForm(ProjectController projectController) {
    return Column(
      children: [
        titleFormField(),
        descriptionFormField(),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
          child: recordingPath == null
              ? buttonText(isRecording ? Icons.stop : Icons.mic,
                  isRecording ? 'Parar gravação' : 'Gravar áudio', recordAudio)
              : audioPlayerWidget(),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
          child: buttonText(
              Icons.attach_file, 'Adicionar imagem', pickImageFromGallery),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
          child: buttonText(Icons.camera_alt_outlined, 'Tirar foto', takePhoto),
        ),
      ],
    );
  }

  Padding descriptionFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 50),
      child: TextFormField(
        onChanged: (value) {
          description = value;
        },
        cursorColor: AppColors.darkGreen,
        maxLines: 5,
        style: TextStyle(
          color: AppColors.darkGreen,
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
        decoration: InputDecoration(
          labelText: 'Descrição',
          labelStyle: TextStyle(
            color: AppColors.darkGreen,
            fontSize: MediaQuery.of(context).size.height / 40,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkGreen,
              width: 1.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkGreen,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  TextFormField titleFormField() {
    return TextFormField(
      onChanged: (value) {
        // projectController.project!.name = value;
        title = value;
      },
      cursorColor: AppColors.darkGreen,
      style: TextStyle(
        color: AppColors.darkGreen,
        fontSize: MediaQuery.of(context).size.height / 30,
      ),
      decoration: InputDecoration(
        labelText: 'Título',
        labelStyle: TextStyle(
          color: AppColors.darkGreen,
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGreen,
            width: 1.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGreen,
            width: 1,
          ),
        ),
      ),
    );
  }

  Text actionsText(String text) {
    return Text(text,
        style: TextStyle(
          color: AppColors.darkGreen,
          fontSize: MediaQuery.of(context).size.height / 60,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget buttonText(IconData icon, String text, void Function() onPressed) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width / 2,
            MediaQuery.of(context).size.height / 15),
        backgroundColor: AppColors.white,
        side: const BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      icon: Icon(
        icon,
        color: icon == Icons.stop ? Colors.red : AppColors.darkGreen,
      ),
      onPressed: () {
        onPressed();
      },
      label: actionsText(text),
    );
  }

  Widget imageCarousel(List<File> imageFiles) {
    return imageFiles.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 15),
            child: SizedBox(
              height: 250, // Altura do carrossel
              child: PageView.builder(
                itemCount: imageFiles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.file(
                        imageFiles[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 15),
            child: const Center(
              child: Text(
                "Adicione uma imagem",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
  }
}
