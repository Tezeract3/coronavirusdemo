import 'package:coronaliveupdate/widget/bottomNavigationBar.dart';
import 'package:coronaliveupdate/widget/coronaPicWidget.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> data = [
  {
    "title": "When should I get medical help for my symptoms?",
    "data":
        "If you're sick, call your doctor's office or a health-care facility and describe your symptoms. They'll go over the next steps with you, including whether or not you should get a COVID-19 test. If it turns out that you have COVID-19, mild cases can be managed at home with rest and self-isolation. If you become severely ill, you may need hospital care.",
  },
  {
    "title":
        "How long does it take for me to develop symptoms after being exposed to the coronavirus?",
    "data":
        "After being infected with the SARS-CoV-2 coronavirus, symptoms can appear anywhere between two and fourteen days. According to a study conducted by Johns Hopkins Bloomberg School of Public Health researchers, the median duration for symptoms to appear is roughly five days. That is why the CDC recommends a 14-day quarantine for those who have been exposed to the coronavirus.",
  },
  {
    "title": "Is it possible to get coronavirus without getting a fever?",
    "data":
        "Yes, you can be infected with the coronavirus and have a cough or other symptoms without a temperature, or with a very low-grade fever in the first few days. It's important to remember that COVID-19 might manifest itself with few or no symptoms. COVID-19 can be disseminated by peopl",
  },
  {
    "title": "What are the early signs of coronavirus infection?",
    "data": "Some people have reported weariness, headaches, sore throats, and fever as early symptoms. Others report losing their sense of smell or taste. COVID-19 can cause modest symptoms at initially, but over the course of five to seven days, symptoms such as coughing and shortness of breath can increase. COVID-19 can cause pneumonia in certain patients." +
        "The type and severity of early symptoms might vary greatly from person to person, which is why it is critical to contact your doctor if you experience any symptoms, no matter how little.",
  },
  {
    "title": "Is it possible for COVID symptoms to come and go?",
    "data":
        "Yes. People with COVID-19 may endure repeated symptoms alternating with periods of feeling better during the rehabilitation process. Fever, tiredness, and breathing issues of varying degrees might recur on and off for days or even weeks.",
  },
  {
    "title": "Is it possible to have COVID-19 without showing any symptoms?",
    "data":
        "Yes. COVID-19 symptoms often appear two to 14 days after exposure to the SARS-CoV-2 coronavirus, but some persons who are infected do not experience symptoms or become ill. This is why wearing a face mask and practicing physical distancing and hand cleanliness are so vital. People can be infected with the COVID-19 virus and not realize it, but they can still spread it to others.",
  },
  {
    "title": "What are the symptoms of COVID-19 in children?",
    "data": "COVID-19 can cause fever, cough, sore throat, difficulty breathing, and diarrhea in babies and children, much like it does in adults. COVID-19 infection in children is usually milder than in adults, and hospitalization is rarely required. However, in a few known cases, extremely young neonates have developed pneumonia as a result of coronavirus infection." +
        "Children may also be at risk for multisystem inflammatory syndrome in children, or MIS-C, a relatively rare coronavirus consequence. Parents should be on the lookout for indicators of MIS-C and should contact their child's doctor as soon as they emerge.",
  },
  {
    "title":
        "What distinguishes coronavirus symptoms from allergy symptoms? What about strep throat, the flu, and colds?",
    "data": "COVID-19 has symptoms that are similar to allergies, the flu, and strep throat. Without a test, distinguishing between COVID-19 and flu may be difficult." +
        "If you experience symptoms that could be caused by the coronavirus, see your doctor, report your symptoms, and follow their advice.",
  },
  {
    "title":
        "Will I get COVID-19 symptoms if I obtain the coronavirus vaccine?",
    "data": "No, the COVID-19 vaccinations approved by the Food and Drug Administration cannot and will not provide you with COVID-19 protection. Because the new coronavirus vaccinations activate your immune system, they may induce side effects, but this does not suggest you are infected with the coronavirus or have COVID-19." +
        "Fever, soreness at the injection site, and muscular pains are all possible side effects while your immune system adapts to the vaccine and learns to detect and fight the coronavirus, but they are usually moderate and only last a few days. Learn more about the coronavirus vaccinations' safety.",
  },
];

class ListScreen extends StatefulWidget {
  static const String id = "ListScreen";

  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ///corona
            Positioned(
                bottom: 110,
                child: CoronaPicWidget(
                  opacity: 0.3,
                  size: 100,
                )),

            ///corona
            Positioned(
                top: 100,
                right: -50,
                child: CoronaPicWidget(
                  opacity: 0.3,
                  size: MediaQuery.of(context).size.shortestSide * 0.6,
                )),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(bottom: 50),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Color(0x8FEFEFF0),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Text(
                                  "${data[i]["title"]}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue.shade700,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "${data[i]["data"]}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xFF05255A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          );
                        }),
                  )),

                  ///bottom bar
                  BottomNavBar(
                    status: NavStatus.File,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
