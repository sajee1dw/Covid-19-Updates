import 'package:covid_19/models/situation.dart';
import 'package:covid_19/providers/status.dart';
import 'package:covid_19/widjets/countCard.dart';
import 'package:covid_19/widjets/toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final StatusProvider stat = StatusProvider();


  Widget buildBodyBackground(
      Situation status, ToggleButton toggleButton, BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Image.asset(
            'assets/shape-bg.png',
            height: MediaQuery.of(context).size.height,
            scale: 1.0,
          ),
          right: -350.0,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset('assets/main/1.png'),
              Positioned(
                child: Image.asset(
                  'assets/main/2.png',
                  scale: 1.2,
                ),
                bottom: 430.0,
                right: 255.0,
              ),
              Positioned(
                child: Image.asset(
                  'assets/main/3.png',
                  scale: 1.2,
                ),
                bottom: 340.0,
                right: -10.0,
              ),
              Positioned(
                child: Image.asset(
                  'assets/main/4.png',
                  scale: 1.2,
                ),
                right: -10.0,
                bottom: 220.0,
              ),
              Positioned(
                child: Image.asset(
                  'assets/main/6.png',
                  scale: 1.2,
                ),
                bottom: 190.0,
                right: 230.0,
              ),
              Positioned(
                child: Image.asset(
                  'assets/main/5.png',
                  scale: 1.2,
                ),
                right: 20.0,
                bottom: 160.0,
              ),
              status == null
                  ? Container()
                  : SingleChildScrollView(
                      child: buildBody(status, toggleButton, context),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody(
      Situation status, ToggleButton toggleButton, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width * 0.87,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'COVID-19 \nnSituation Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF2B2350),
                        fontSize: 38.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    status.updateDateTime.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF2B2350),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 300),
                        style: !toggleButton.isToggled
                            ? TextStyle(
                                fontSize: 20.0, color: Color(0xFF7052FB))
                            : TextStyle(fontSize: 20.0, color: Colors.black),
                        child: Text('Local',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      toggleButton.toggleButton(),
                      SizedBox(
                        width: 10.0,
                      ),
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 300),
                        style: toggleButton.isToggled
                            ? TextStyle(
                                fontSize: 20.0, color: Color(0xFF7052FB))
                            : TextStyle(fontSize: 20.0, color: Colors.black),
                        child: Text(
                          'Global',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 500),
                    crossFadeState: toggleButton.isToggled
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 15.0),
                          countCard('Total Cases', status.globalTotalCases,
                              context, 0xFFFDB01A),
                          SizedBox(height: 15.0),
                          countCard('New Cases', status.globalNewCases, context,
                              0xFF50CD8A),
                          SizedBox(height: 15.0),
                          countCard('Deaths', status.globalDeaths, context,
                              0xFFF64A8F),
                          SizedBox(height: 15.0),
                          countCard('Recovered', status.globalRecovers, context,
                              0xFF50CD8A),
                        ],
                      ),
                    ),
                    secondChild: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 15.0),
                          countCard('Total Cases', status.localTotalCases,
                              context, 0xFFFDB01A),
                          SizedBox(height: 15.0),
                          countCard('New Cases', status.localNewCases, context,
                              0xFF50CD8A),
                          SizedBox(height: 15.0),
                          countCard(
                              'Total in hospitals',
                              status.localTotalNumberOfIndividualsInHospitals,
                              context,
                              0xFF7052FB),
                          SizedBox(height: 15.0),
                          countCard('Deaths', status.localDeaths, context,
                              0xFFF64A8F),
                          SizedBox(height: 15.0),
                          countCard('Recovered', status.localRecovered, context,
                              0xFF50CD8A),
                          SizedBox(height: 15.0),
                          countCard('currently in hospitals', (status.localTotalCases - (status.localRecovered + status.localDeaths)), context,
                              0xFF7052FB),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ToggleButton toggleButton = Provider.of<ToggleButton>(context);
    final Situation status = Provider.of<Situation>(context);
    print('Size of the screen' + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Color(0xFF7052FB),
      body: Container(
        child: buildBodyBackground(status, toggleButton, context),
      ),
    );
  }
}
