import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/widgets/destination_screen/destination_activity_tiles.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  const DestinationScreen(this.destination, {Key? key}) : super(key: key);
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(0.0, 2.0),
                  )
                ],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: AssetImage(
                      widget.destination.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    iconSize: 30.0,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                        color: Colors.black,
                        iconSize: 30.0,
                      ),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.sortAmountDown),
                        color: Colors.black,
                        iconSize: 30.0,
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.city,
                        style: const TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.white70,
                            size: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              widget.destination.country,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            itemCount: widget.destination.activities.length,
            itemBuilder: (BuildContext context, int index) {
              var activity = widget.destination.activities[index];
              return DestinationActivityTile(activity);
            },
          ),
        )
      ]),
    );
  }
}
