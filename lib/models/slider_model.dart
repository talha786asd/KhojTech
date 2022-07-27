import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
    SliderModel({
        this.acf,
    });

    Acf? acf;

    factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        acf: Acf.fromJson(json["acf"]),
    );

    Map<String, dynamic> toJson() => {
        "acf": acf!.toJson(),
    };
}

class Acf {
    Acf({
        this.image,
    });

    List<Imag>? image;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        image: List<Imag>.from(json["image"].map((x) => Imag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image!.map((x) => x.toJson())),
    };
}

class Imag {
    Imag({
        this.slide,
    });

    String? slide;

    factory Imag.fromJson(Map<String, dynamic> json) => Imag(
        slide: json["slide"],
    );

    Map<String, dynamic> toJson() => {
        "slide": slide,
    };
}
