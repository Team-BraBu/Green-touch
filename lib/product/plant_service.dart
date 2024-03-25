import 'package:flutter/material.dart';

class PlantService extends ChangeNotifier {
  List<Plant> plants = []; //식물 목록 저장 리스트

  PlantService() {
    initializePlants(); // 식물 초기화 함수 호출
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
            ' 열대식물인 아레카야자는 줄기가 길게 자라면서 늘어지는게 멋스러운 식물로, 밝은 실내에서 키우면 좋습니다. 다만 강한 햇볕은 피해주세요. '
            '물주기는 겉흙이 말랐을 때 화분 빝으로 물이 빠져나올 때까지 흠뻑 물을 주세요.',
        detail_3:
            '이국적인 느낌으로 북유럽 인테리어 소품, 북유럽 감성이 담긴 화분, 시원한 휴양지 느낌이 나는 카페 화분으로 좋습니다. '
            '또한 여러가지 화분소재를 이용하여 빈티지, 모던, 내추럴한 인테리어가 가능합니다. 특히 여름에 활용도가 높습니다.',
      ),
      Plant(
        imagePath: 'assets/plant/plant2.png',
        title: '관음죽',
        subtitle: '2위 공기정화식물',
        price: 39000,
        category: 2,
        detail_1:
            '관음죽속에 딸린 종려의 일종으로, 잎이 독특한 분위기를 만들어주며, 잎모양은 난초처럼 길쭉해 동양적인 느낌을 주는데, '
            '수형은 야자나무의 길쭉함을 가지고있습니다. 관음죽은 암모니아와 이산화탄소 흡수에 뛰어나고, NASA에서 발표한 공기정화 식물 2위이기도 해요.',
        detail_2: '그늘과 추위에도 잘 견디고, 병해충에도 강하기 때문에 초보 가드너에게 추천하는 식물이에요. '
            '수경재배로 키울 수도 있어서 집안에 흙을 두고 싶지 않는 사람들에게도 좋아요. ',
        detail_3: ' 빛이 좀 부족한 반지층, 원룸, 화장실, 부엌에 그린 빛으로 인테리어를 하고싶다면 해결 해 줄 거예요.',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 1,
        detail_1:
            '세이프리지라고도 하며, 대나무야자는 성숙하면 최대 2m 정도 까지 자라며 모양이 가늘고 호리호리한 줄기들이 모여 하나의 다발을 이루는 형태를 갖는다.'
            ' 각 줄기마다 약 10~15개 가량의 우상엽(잎이 깃 모양으로 나누어지는 형태)이 나며 색은 어두운 녹색이다. ',
        detail_2:
            '물을 줄땐 겉 흙이 마르면 충분히 주세요 단, 주의 직사광선을 피하여 커튼이나 창문을 거친 부드러운 햇빛을 받도록 해주세요',
        detail_3:
            '365일 싱그러운 그린 인테리어에 도움을 주기 좋은, 매끄럽고 윤기나는 잎사귀가 4계절 내내 푸르게 자라있어,'
            '보기만해도 싱그러운 느낌이 나게 합니다. 1.8m까지 자라서 아레카야자보다 모양이 아름답고 해충에도 강하고 어느 공간에도 배치에 어울립니다.',
      ),
      Plant(
        imagePath: 'assets/plant/plant4.png',
        title: '인도고무나무',
        subtitle: '개업식, 취임식, 승진, 이사때 선물로 제격',
        price: 39000,
        category: 1,
        detail_1:
            '원산지가 인도인 ‘인도고무나무’는 빅토리아 시대부터 오늘날에 이르기까지 영국에서 가장 인기 있는 실내식물이며, '
            '‘고무나무’라는 이름은 잎이나 줄기를 자르면 고무성분인 ‘라텍스’라는 하얀 수액이 나오기 때문!  '
            '공기정화 효과가 많이 밝혀지지 않았지만 포름알데히드 제거 능력이 상당하며 크고 실내의 넓은 공간에 잘 어울리기 때문에 거실에 두면 좋다.'
            '잎은 두껍고, 광택이 나는 짙은 녹색이며, 적정한 조건의 환경에서는 키가 2.5m까지 자란다.',
        detail_2: '공기정화효과가 있는 식물로, 키우기쉬워서 초보자에게 추천하는 식물입니다. '
            '물주기는 여름에 20일에 한 번, 겨울엔 30~40일에 한 번 정도 주시면되고 '
            '물을 너무 자주주면 과습으로 병에 걸리기 쉬워서 열므 장마철엔 물을 거의 주지 않으셔도 됩니다.',
        detail_3: '주로, 개업,창립,전시,공연,오픈식,준공식 등등 행사기간동안 선물용으로도 많이 사용되며, '
            '수명이 길고 홈 인테리어용으로 멋있고 고급스러워서 집안의 인테리어로도 많이 사용됩니다.',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant3.png',
        title: '대나무야자',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
    ];
  }

  // 모든 식물을 반환하는 함수
  List<Plant> getPlants() {
    return plants;
  }
}

// 카테고리에 해당하는 식물 목록을 반환하는 함수
List<Plant> getCategoryPlants(int category, PlantService plantService) {
  return plantService.plants
      .where((plant) => plant.category == category)
      .toList();
}

// 식물데이터 클래스 정의
class Plant {
  final String imagePath;
  final String title;
  final String subtitle;
  final int price;
  final int category;
  final String detail_1;
  final String detail_2;
  final String detail_3;

  // 생성자
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
