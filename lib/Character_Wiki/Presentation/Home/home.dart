import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Rick & Morty Wiki')),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text('Filters', style: TextStyle(fontSize: 15))],
            ),
            Padding(padding: const EdgeInsets.all(20), child: Divider()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Characters'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DropdownMenu(
                      label: Text('Status'),
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'Alive', label: 'Alive'),
                        DropdownMenuEntry(value: 'Dead', label: 'Dead'),
                        DropdownMenuEntry(value: 'Unknown', label: 'Unknown'),
                      ],
                    ),
                    SizedBox(width: 10),
                    DropdownMenu(
                      label: Text('Species'),
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'Human', label: 'Human'),
                        DropdownMenuEntry(value: 'Alien', label: 'Alien'),
                        DropdownMenuEntry(value: 'Robot', label: 'Robot'),
                      ],
                    ),
                    SizedBox(width: 10),
                    DropdownMenu(
                      label: Text('Gender'),
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'Female', label: 'Female'),
                        DropdownMenuEntry(value: 'Male', label: 'Male'),
                        DropdownMenuEntry(value: 'Unknown', label: 'Unknown'),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Episode'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DropdownMenu(
                      label: Text('Choose'),
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'Episode 1', label: 'Episode 1'),
                        DropdownMenuEntry(value: 'Episode 2', label: 'Episode 2'),
                        DropdownMenuEntry(value: 'Episode 3', label: 'Episode 3'),
                      ],
                    ),
                    
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Location'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DropdownMenu(
                      label: Text('Choose'),
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'Location 1', label: 'Location 1'),
                        DropdownMenuEntry(value: 'Location 2', label: 'Location 2'),
                        DropdownMenuEntry(value: 'Location 3', label: 'Location 3'),
                      ],
                    ),
                    
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){}, 
              child: const Text('Clear Filters')
              )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(onTap: () {}, child: Text('Characters')),
            GestureDetector(onTap: () {}, child: Text('Episode')),
            GestureDetector(onTap: () {}, child: Text('Location')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        isSelected = true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(
                            color: isSelected == true
                                ? Colors.white54
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
