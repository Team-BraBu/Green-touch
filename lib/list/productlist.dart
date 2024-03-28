import 'package:flutter/material.dart';
import 'package:greentouch/list/productlistitem.dart';
import 'package:greentouch/product/plant_service.dart';
import 'package:provider/provider.dart';

import '../layout/app_drawer.dart';
import '../layout/appbar.dart';
import 'information_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int? category;

  @override
  void initState() {
    super.initState();
    // 초기 카테고리 설정
    category = 1; // 예시로 카테고리 1 선택
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Consumer<PlantService>(
        builder: (context, plantService, _) {
          // 선택된 카테고리에 해당하는 식물 목록 가져오기
          List<Plant> plants = getCategoryPlants(category!, plantService);

          return Column(
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        category = 1; // 카테고리 1 선택
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 30),
                      backgroundColor:
                          category == 1 ? Color(0xff739072) : Colors.white,
                      foregroundColor:
                          category == 1 ? Colors.white : Color(0xff739072),
                    ),
                    child: Text('공기 정화 식물'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        category = 2; // 카테고리 2 선택
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 30),
                      backgroundColor:
                          category == 2 ? Color(0xff739072) : Colors.white,
                      foregroundColor:
                          category == 2 ? Colors.white : Color(0xff739072),
                    ),
                    child: Text('초보자 식물'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        category = 3; // 카테고리 2 선택
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 30),
                      backgroundColor:
                          category == 3 ? Color(0xff739072) : Colors.white,
                      foregroundColor:
                          category == 3 ? Colors.white : Color(0xff739072),
                    ),
                    child: Text('영양제'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: Builder(builder: (context) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.6,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    padding: EdgeInsets.all(8),
                    itemCount: plants.length,
                    itemBuilder: (context, index) {
                      final Plant plant = plants[index];
                      return ProductListItem(
                        imagePath: plant.imagePath,
                        title: plant.title,
                        subtitle: plant.subtitle,
                        price: '${plant.price} 원',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InformationDetail(plant: plant),
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
