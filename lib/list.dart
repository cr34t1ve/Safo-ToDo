var catergory = ['school', 'personal'];

class Tasks {
  String? catergory;
  String? taskName;

  Tasks({this.taskName, this.catergory});
}

List<Tasks> taskList = [
  Tasks(
    catergory: catergory[0],
    taskName: 'Submit assignment',
  ),
  Tasks(
    catergory: catergory[0],
    taskName: 'Write case study for App',
  ),
  Tasks(
    catergory: catergory[0],
    taskName: 'Send project link',
  ),
  Tasks(
    catergory: catergory[1],
    taskName: 'Take groceries to room',
  ),
];


var items = <Tasks>[];
