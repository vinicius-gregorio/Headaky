import 'package:flutter/material.dart';
import 'package:headaky/pages/home_page.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Olá ! Bem vindo ao Headaky",
        maxLineTitle: 2,
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
        description:
            "Headaky é um Aplicativo simples com o intuito de fazê-lo poder salvar seus sentimentos, o que vem comendo e o que vem sentido. A fim de você poder estabelecer uma relação entre suas atividades e seus sentimentos.",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Container(child: Image.asset('assets/bem.png')),
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        // backgroundImage: 'images/photo_eraser.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "Nesta tela você...",
        centerWidget: Container(child: Image.asset('assets/headaky-home.jpg')),
        styleTitle: TextStyle(
            color: Color(0xffD02090), fontSize: 30.0, fontFamily: 'RobotoMono'),
        description:
            "Na tela principal você escolhe o seu sentimento, o que vem fazendo e comendo. Após clicar no botão confirmar, sua ação será salva =)",
        styleDescription: TextStyle(
          color: Color(0xffD02090),
          fontSize: 20.0,
        ),
        // pathImage: "images/photo_museum.png",
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Nesta tela você...",
        centerWidget:
            Container(child: Image.asset('assets/headaky-delete-slide.jpg')),
        styleTitle: TextStyle(
          color: Color(0xffD02090),
          fontSize: 30.0,
        ),
        description:
            "Na tela principal você pode ver todos seus sentimentos salvos. Ao arrastar para um lado surgirá a opção de apagar o sentimento, e ao arrastar para o outro lado aparecerão mais informações",
        styleDescription: TextStyle(
          color: Color(0xffD02090),
          fontSize: 20.0,
        ),
        // pathImage: "images/photo_museum.png",
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color(0xffD02090),
      sizeDot: 13.0,

      // Show or hide status bar
      shouldHideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
    );
  }
}
