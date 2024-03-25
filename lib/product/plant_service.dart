import 'package:flutter/material.dart';

class PlantService extends ChangeNotifier {
  List<Plant> plants = [];

  PlantService() {
    initializePlants(); // 생성자 이름을 PlantService로 수정
  }

  void initializePlants() {
    plants = [
      Plant(
        imagePath: 'assets/plant/plant1.png',
        title: '아레카야자',
        subtitle: '1위 공기정화식물',
        price: 29000,
        category: 1,
        detail_1:
            '미국 항국우주국(NASA)에서 밀폐된 우주선 안의 공기를 정화시키기 위한 공기정화식물 50가지 중에서 최종 1위를 차지한 식물입니다.',
        detail_2:
            ' 열대식물인 아레카야자는 줄기가 길게 자라면서 늘어지는게 멋스러운 식물로, 밝은 실내에서 키우면 좋습니다. 다만 강한 햇볕은 피해주세요. 물주기는 겉흙이 말랐을 때 화분 빝으로 물이 빠져나올 때까지 흠뻑 물을 주세요.',
        detail_3:
            '이국적인 느낌으로 북유럽 인테리어 소품, 북유럽 감성이 담긴 화분, 시원한 휴양지 느낌이 나는 카페 화분으로 좋습니다. 또한 여러가지 화분소재를 이용하여 빈티지, 모던, 내추럴한 인테리어가 가능합니다. 특히 여름에 활용도가 높습니다.',
      ),
      Plant(
        imagePath: 'assets/plant/plant2.png',
        title: '관음죽',
        subtitle: '2위 공기정화식물',
        price: 39000,
        category: 2,
        detail_1:
            '관음죽속에 딸린 종려의 일종으로, 잎이 독특한 분위기를 만들어주며, 잎모양은 난초처럼 길쭉해 동양적인 느낌을 주는데, 수형은 야자나무의 길쭉함을 가지고있습니다. 관음죽은 암모니아와 이산화탄소 흡수에 뛰어나고, NASA에서 발표한 공기정화 식물 2위이기도 해요.',
        detail_2:
            '그늘과 추위에도 잘 견디고, 병해충에도 강하기 때문에 초보 가드너에게 추천하는 식물이에요. 수경재배로 키울 수도 있어서 집안에 흙을 두고 싶지 않는 사람들에게도 좋아요. ',
        detail_3: ' 빛이 좀 부족한 반지층, 원룸, 화장실, 부엌에 그린 빛으로 인테리어를 하고싶다면 해결 해 줄 거예요.',
      ),
    ];
  }

  List<Plant> getPlants() {
    return plants;
  }
}

class Plant {
  final String imagePath;
  final String title;
  final String subtitle;
  final int price;
  final int category;
  final String detail_1;
  final String detail_2;
  final String detail_3;

  Plant({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.category,
    required this.detail_1,
    required this.detail_2,
    required this.detail_3,
  });
}
