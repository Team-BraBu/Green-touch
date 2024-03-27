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
        imagePath: 'assets/plant/plant5.jpg',
        title: '아이비',
        subtitle: '',
        price: 30000,
        category: 1,
        detail_1: '아이비는 잎의 형태와 색상이 다양한 유형이 있으며, 종에 따라 상당히 다를 수 있습니다. '
            '일반적으로 아이비는 잎이 작고 둥근 모양이며, 녹색, 연두색, 황갈색 등 다양한 색상의 잎을 가지고 있습니다.'
            ' 또한, 아이비는 기둥이나 벽에 기어오르거나 땅바닥을 기어다니는 덩굴식 식물로 잘 알려져 있습니다.',
        detail_2:
            '1. 조명: 아이비는 적당한 조명을 선호하지만 직사광선을 피해야 합니다. 실내에 위치한 경우 밝은 간접 조명이 좋습니다. '
            '2. 온도: 온화한 환경을 선호합니다. 15°C에서 24°C 사이의 온도가 적합합니다. '
            '3. 습도: 보통 습도에서 잘 자라지만, 너무 건조하면 잎이 시들어질 수 있습니다. '
            '따라서 실내 공기가 건조한 경우 습도를 유지하는데 도움이 되는 기기를 사용할 수 있습니다.'
            '4. 물 주기: 흙이 마르면 물을 주되, 물을 과도하게 주지 않도록 주의해야 합니다. 토양이 너무 습하지 않도록 주의하세요.',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant6.png',
        title: '황금죽',
        subtitle: '',
        price: 40000,
        category: 2,
        detail_1: '',
        detail_2: '',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant10.png',
        title: '피닉스야자',
        subtitle: '피부에 좋고 선물용 으로도 좋고!',
        price: 39000,
        category: 1,
        detail_1:
            '드라세나 자넷 크레이그 빛이 부족한 반음지에서도 잘 커서 실내에서 키우기 좋음공기정화 및 습도조절에 탁월하여 '
            '아토피 및 피부 건조증에 좋음개업 축하 선물용으로 많이 쓰임.',
        detail_2:
            '물주기 - 여름철 : 3일에 1번, 겨울철 : 4~5일에 1번 / 온도 및 장소 - 생육 적정 온도 : 16~20도(13도 이하가 되지 않도록 하는 것이 좋음)',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant7.png',
        title: '피닉스야자',
        subtitle: '왜성 대추야자',
        price: 39000,
        category: 2,
        detail_1: '자일렌, 크실렌 등 실내 오염물질 제거 능력 높음 병충해, 영양 부족에 강하여 관리하기 쉬워요',
        detail_2:
            '물주기 - 봄,여름철 : 1주일에 1번, 가을,겨울철 : 2주일에 1번 / 온도 및 장소 - 생육 적정 온도 : 18~25도',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant8.png',
        title: '보스턴 고사리',
        subtitle: '담배연기 제거 능력 높음',
        price: 25000,
        category: 1,
        detail_1:
            '고사리목 면마과의 다년초, 공기 중에 수분을 많이 뿜어내어 가습 효과 높음 (증산 작용) 포름알데히드, 담배연기 제거 능력 높습니다.',
        detail_2:
            '물주기 - 일주일에 1~2회 이상 / 온도 및 장소 - 생육 적정 온도 : 16~20도(13도 이하가 되지 않도록 하는 것이 좋아요)',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant9.png',
        title: '스파티 필름',
        subtitle: '냄새 제거에 최고 !',
        price: 59000,
        category: 2,
        detail_1: '외떡잎식물 천남성과 식물로서 미세먼지, 포름알데히드, 벤젠 등 유해가스 제거 능력 뛰어나요. '
            '냄새와 암모니아 가스 제거 도움이될뿐더러 생명력이 강해 초보에게 적합하답니다',
        detail_2:
            '물주기 - 봄~가을철 : 1주일에 2번, 겨울철 : 1주일에 1번 / 온도 및 장소 - 생육 적정 온도 : 20~30도 유지(8도 이하로 내려가지 않도록 주의)',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/plant11.jpg',
        title: '스킨답서스',
        subtitle: '주방에 딱!',
        price: 20000,
        category: 2,
        detail_1: '우아한 심성이란 꽃말을 가진 스킨답서스! '
            '빛이 없는 사무실이나 방에 두어 키워도 잘 자랄정도로 생명력이 강하고, 병충해에도 강해 초보자들에게 추천하는 대표적인 공기정화 식물이에요'
            '일산화탄소 등 유해물질을 제거 능력이 우수하고, 비교적 약한 빛에서도 적응력이 뛰어나고, 일산화 타소 정화능력이 뛰어나서 주방에 배치하고 키워도 좋아 주방에 두고 키우기 좋답니다. ',
        detail_2: '온도 : 20~25도의 온도 / 물 : 겉 흙이 말랐을 때 물을 듬뿍주는 것이 좋다 (후에는 통풍 필수)',
        detail_3:
            '적절한 길이를 유지하며 덩굴로 흘러내리게 키우기 / 벽에 고정해서 벽면을 타고 자라도록 하기 / 이끼 스틱을 활용해 식물이 타고 자라게 하기',
      ),
      Plant(
        imagePath: 'assets/plant/plant12.png',
        title: '홍콩야자',
        subtitle: '적응력 최고',
        price: 32000,
        category: 2,
        detail_1:
            '따뜻한 열대 지역이 원산지인 두릅나뭇과 식물. 적응력이 강해 키우기 어렵지 않고 공기 정화 능력이 있어서 꾸준한 인기 식물. 바닷바람에도 잘 견뎌 따뜻한 지중해와 하와이에서는 해안 조경용 쓰인다.',
        detail_2:
            '- 온도 : 21~25도 / 물: 평균 주 1~2회 / 습도: 40~70% (습한곳에서 잘 자라는 특성) / 반음지 : 하루 2~3시간 정도의 은은한 햇빛',
        detail_3: '수경재배로 키워보세요! 집안의 산뜻한 분위기를 줄 수 있어요!',
      ),
      Plant(
        imagePath: 'assets/plant/plant13.jpg',
        title: '테이블야자',
        subtitle: '마음의 평화',
        price: 39000,
        category: 2,
        detail_1: '아열대 지방에서 주로 서식하는데, 테이블에 올려 놓고 키운다 하여 테이블 야자라고 불려요'
            ' 실내의 조명만으로도 잘 자라 빛이 적어도 되는 식물로, 공기정화도 되어 선물하기 좋고, 초보자용식물로 많이 알려져있습니다'
            '공기정화 대표식물이고, 독성이 없어 어린아이 혹은 반려동물과 함께 집에서도 걱정없이 키울 수 있는 식물인데다가, 생명력이 강하고 수경재배도 잘 되서 다양하게 연출 할 수있답니다!',
        detail_2:
            ' 온도 : 15~28도 / 물 : 주1회(마름의 정도를 파악하면서), 분무기로 잎에 스프레이 해주어도 좋아요',
        detail_3: '책상위에 선물해보는건 어떨까요?',
      ),
      Plant(
        imagePath: 'assets/plant/plant14.png',
        title: '박쥐란',
        subtitle: '미세먼지 제거 기능',
        price: 30000,
        category: 2,
        detail_1: '박쥐란은 고란초과의 양치식물로, 바위나 나무에 붙어 자라는 모습이 박쥐가 매달려 있는 것 같다고 '
            '해서 붙여진 이름이랍니다. 박쥐란은 밝은 빛이 드는 곳을 좋아하고, 실내 미세먼지를 제거하는 능력도 있는 식물이에요',
        detail_2:
            '온도 : 16~25도 / 물 : 평균 주2회 이상, 하루2~3시간 정도의 은은한 햇빛 / 습도 : 40~70%',
        detail_3: '천장이나 벽에 걸어 놓는다면 더할나위없을거에요 !',
      ),
      Plant(
        imagePath: 'assets/plant/plant15.jpg',
        title: '떡갈고무나무',
        subtitle: '',
        price: 39000,
        category: 2,
        detail_1:
            '떡갈 고무 나무는 크고 흔히 초록색이거나 단색의, 두꺼운 잎을 가진 식물입니다. 주로 실내에 위치해 있으며, 잎이 광택이 나며 무성합니다.',
        detail_2:
            '조명 : 밝은 간접 조명을 선호합니다. 직사광선을 피하며, 실내에 있는 창가에 배치하는 것이 좋습니다. / 온도 : 온화한 환경을 선호하며, 18°C에서 24°C 사이의 온도가 적합합니다. '
            '/ 습도 : 보통 습도에서도 잘 자랍니다. 건조한 공기에 노출되지 않도록 주의해야 합니다. / 물 주기 :흙이 마르면 물을 주되, 물은 흠뻑 흠뻑 주지 않도록 주의하세요.'
            ' 물은 뿌리에 과도한 습기가 발생하지 않도록 흡수되어야 합니다.',
        detail_3: '',
      ),
      Plant(
        imagePath: 'assets/plant/y.jpg',
        title: '영양제',
        subtitle: '',
        price: 40000,
        category: 3,
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
