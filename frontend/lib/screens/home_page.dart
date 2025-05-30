// import 'package:flutter/material.dart';
// import '../widgets/app_header.dart';
// import '../widgets/section_title.dart';
// import '../widgets/task_card.dart';
// import '../widgets/group_card.dart';
// import '../widgets/add_task_dialog.dart';
// import 'task_list_screen.dart';
// import '../utils/constants.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   void _showAdd() => showDialog(
//     context: context,
//     builder: (_) => AddTaskDialog(onAdded: () => setState(() {})),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackground,
//       appBar: AppHeader(name: 'Livia Vaccaro'),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           // === Today’s Task Card ===
//           Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: kPrimaryColor,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Your today’s task almost done!',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                         SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (_) => Dialog(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Container(
//                                   width: double.maxFinite,
//                                   height: 400,
//                                   child: TaskListScreen(),
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: kPrimaryColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: Text('View Task'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     SizedBox(
//                       width: 60,
//                       height: 60,
//                       child: CircularProgressIndicator(
//                         value: 0.85,
//                         backgroundColor: Colors.white24,
//                         valueColor: AlwaysStoppedAnimation(Colors.white),
//                         strokeWidth: 6,
//                       ),
//                     ),
//                     Text(
//                       '85%',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 24),

//           // === In Progress Section ===
//           SectionTitle(title: "In Progress", count: 6),
//           SizedBox(height: 16),
//           TaskCard(
//             title: 'Grocery shopping app design',
//             tag: 'Office Project',
//             tagColor: Colors.blue,
//             onTap: () {},
//           ),
//           TaskCard(
//             title: 'Uber Eats redesign challenge',
//             tag: 'Personal Project',
//             tagColor: Colors.orange,
//             onTap: () {},
//           ),
//           SizedBox(height: 24),

//           // === Task Groups Section ===
//           SectionTitle(title: "Task Groups", count: 3),
//           SizedBox(height: 16),
//           GroupCard(
//             title: 'Office Project',
//             taskCount: 23,
//             progressPercent: 0.7,
//             icon: Icons.work_outline,
//             color: Colors.pink,
//           ),
//           SizedBox(height: 12),
//           GroupCard(
//             title: 'Personal Project',
//             taskCount: 30,
//             progressPercent: 0.52,
//             icon: Icons.person_outline,
//             color: Colors.purple,
//           ),
//           SizedBox(height: 12),
//           GroupCard(
//             title: 'Daily Study',
//             taskCount: 30,
//             progressPercent: 0.87,
//             icon: Icons.book_outlined,
//             color: Colors.orange,
//           ),
//         ],
//       ),

//       // FAB chính giữa
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: kPrimaryColor,
//         onPressed: _showAdd,
//         child: Icon(Icons.add),
//       ),

//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         child: Row(
//           // 5 slot bằng nhau
//           children: [
//             // slot 1
//             Expanded(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.home_outlined,
//                   color: _selectedIndex == 0
//                       ? kPrimaryColor
//                       : kPrimaryColor.withOpacity(0.4),
//                 ),
//                 onPressed: () => setState(() => _selectedIndex = 0),
//               ),
//             ),
//             // slot 2
//             Expanded(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.calendar_today_outlined,
//                   color: _selectedIndex == 1
//                       ? kPrimaryColor
//                       : kPrimaryColor.withOpacity(0.4),
//                 ),
//                 onPressed: () => setState(() => _selectedIndex = 1),
//               ),
//             ),
//             // slot 3 trống, để FAB notch
//             Expanded(child: SizedBox()),
//             // slot 4
//             Expanded(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.chat_bubble_outline,
//                   color: _selectedIndex == 2
//                       ? kPrimaryColor
//                       : kPrimaryColor.withOpacity(0.4),
//                 ),
//                 onPressed: () => setState(() => _selectedIndex = 2),
//               ),
//             ),
//             // slot 5
//             Expanded(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.person_outline,
//                   color: _selectedIndex == 3
//                       ? kPrimaryColor
//                       : kPrimaryColor.withOpacity(0.4),
//                 ),
//                 onPressed: () => setState(() => _selectedIndex = 3),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Refactored HomePage and TaskListScreen with responsive layout support

import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/section_title.dart';
import '../widgets/task_card.dart';
import '../widgets/group_card.dart';
import '../widgets/add_task_dialog.dart';
import 'task_list_screen.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _showAdd() => showDialog(
    context: context,
    builder: (_) => AddTaskDialog(onAdded: () => setState(() {})),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppHeader(name: 'Livia Vaccaro'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth;
          if (constraints.maxWidth >= 1200) {
            maxWidth = 1000; // Desktop
          } else if (constraints.maxWidth >= 800) {
            maxWidth = 800; // Tablet
          } else {
            maxWidth = constraints.maxWidth; // Mobile
          }
          return Center(
            child: Container(
              width: maxWidth,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  _buildTodayTaskCard(),
                  SizedBox(height: 24),
                  SectionTitle(title: "In Progress", count: 6),
                  SizedBox(height: 16),
                  TaskCard(
                    title: 'Grocery shopping app design',
                    tag: 'Office Project',
                    tagColor: Colors.blue,
                    onTap: () {},
                  ),
                  TaskCard(
                    title: 'Uber Eats redesign challenge',
                    tag: 'Personal Project',
                    tagColor: Colors.orange,
                    onTap: () {},
                  ),
                  SizedBox(height: 24),
                  SectionTitle(title: "Task Groups", count: 3),
                  SizedBox(height: 16),
                  GroupCard(
                    title: 'Office Project',
                    taskCount: 23,
                    progressPercent: 0.7,
                    icon: Icons.work_outline,
                    color: Colors.pink,
                  ),
                  SizedBox(height: 12),
                  GroupCard(
                    title: 'Personal Project',
                    taskCount: 30,
                    progressPercent: 0.52,
                    icon: Icons.person_outline,
                    color: Colors.purple,
                  ),
                  SizedBox(height: 12),
                  GroupCard(
                    title: 'Daily Study',
                    taskCount: 30,
                    progressPercent: 0.87,
                    icon: Icons.book_outlined,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: _showAdd,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          children: List.generate(5, (index) {
            if (index == 2) return Expanded(child: SizedBox());
            IconData icon;
            switch (index > 2 ? index - 1 : index) {
              case 0:
                icon = Icons.home_outlined;
                break;
              case 1:
                icon = Icons.calendar_today_outlined;
                break;
              case 2:
                icon = Icons.chat_bubble_outline;
                break;
              default:
                icon = Icons.person_outline;
            }
            return Expanded(
              child: IconButton(
                icon: Icon(
                  icon,
                  color: _selectedIndex == (index > 2 ? index - 1 : index)
                      ? kPrimaryColor
                      : kPrimaryColor.withOpacity(0.4),
                ),
                onPressed: () => setState(
                  () => _selectedIndex = index > 2 ? index - 1 : index,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTodayTaskCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your today’s task almost done!',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          child: TaskListScreen(),
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('View Task'),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: 0.85,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 6,
                ),
              ),
              Text(
                '85%',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
