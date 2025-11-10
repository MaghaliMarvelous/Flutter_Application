import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/controllers/premire_table_controller.dart';
import 'package:get/get.dart';

class PremierTablePage extends StatelessWidget {
  const PremierTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PremireTableController());
    return Scaffold(
      appBar: AppBar(title: const Text('Premier League Table')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {

          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: (){
            return controller.fetchPremierTable();
            },
            child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index) {
                final team = controller.standings[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.strBadge),
                    ),
                    trailing: Text(team.intPoints.toString() + " pts"),
                    subtitle: Text(
                      "Played " +
                          team.intPlayed.toString() +
                          " - Win " +
                          team.intWin.toString() +
                          " - Draw " +
                          team.intDraw.toString() +
                          " - Loss " +
                          team.intLoss.toString(),
                    ),
                    title: Text(team.strTeam.toString()),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
