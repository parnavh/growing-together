import 'dart:ui';
import 'package:flutter/material.dart';

enum VaccinationStatus {
  Received,
  Due,
  OverDue,
}

class Vaccine {
  final String uid;
  final String name;
  final String info;
  final bool required;
  final String sideEffects;
  final int ageGroup;
  final int? maxAge;
  final int dosesNumber;
  // final List<int> intervals;

  Vaccine({required this.uid, required this.name, required this.info, required this.required, required this.sideEffects, required this.ageGroup, required this.dosesNumber,
    // required this.intervals,
    this.maxAge});

  Vaccine.fromJson(this.uid, Map<String, dynamic> object) :
    name = object['name'],
    info = object['info'],
    required = object['required'],
    sideEffects = object['sideEffects'],
    ageGroup = object['ageGroup'],
    maxAge = object['maxAge'],
    dosesNumber = object['dosesNumber'];
    // intervals = object['intervals'].cast<int>();

  Map<String, dynamic> toJson() => {
      "name": this.name,
      "info": this.info,
      "required": this.required,
      "sideEffects": this.sideEffects,
      "ageGroup": this.ageGroup,
      "maxAge": this.maxAge,
      "dosesNumber": this.dosesNumber,
      // "intervals": this.intervals,
  };

  DateTime calculateDueDate({
    // required int doseNumber,
    required DateTime dob}) {
    // int dur = this.intervals.sublist(doseNumber).reduce((value, element) => value + element);

    DateTime dueDate = dob.add(Duration(days: (this.ageGroup*7
        // + dur
    )));
    return dueDate;
  }

  VaccinationStatus getStatus(bool rec, DateTime dueDate) {
    if(rec) {
      return VaccinationStatus.Received;
    }
    else if(DateTime.now().isBefore(dueDate)) return VaccinationStatus.Due;
    else return VaccinationStatus.OverDue;
  }

}

String show(VaccinationStatus s) {
  return s.toString().substring(19);
}

final Map<VaccinationStatus, Color> VSColorMap = {
  VaccinationStatus.Received: Colors.greenAccent.withAlpha(50),
  VaccinationStatus.Due: Colors.amberAccent.withAlpha(50),
  VaccinationStatus.OverDue: Colors.redAccent.withAlpha(50),
};

final Map<VaccinationStatus, Icon> VSIconMap = {
  VaccinationStatus.Received: const Icon(Icons.check_box, color: Colors.greenAccent,),
  VaccinationStatus.Due: const Icon(Icons.alarm, color: Colors.amber,),
  VaccinationStatus.OverDue: const Icon(Icons.alarm_off, color: Colors.redAccent,),
};


List<Map<String, dynamic>> demo =  [
  {"name": "BCG Vaccine for Tuberculosis", "info": "Bacillus Calmette-Guerin (BCG) vaccine is administered to prevent tuberculosis in infants, BCG is a well-known newborn baby vaccination.", "required": true, "sideEffects": "The vaccine causes swelling at the site of administration.", "ageGroup": 0, "maxAge": 52, "doses": 1, "intervals": [0],},
  {"name": "Oral Polio Vaccines","info":"Polio is a disease that causes paralysis in children, Poliovirus lives in the throat and intestinal tract of a person and spreads by contact with faeces, Some children who get polio do not feel any symptoms, and others get symptoms similar to the common cold. In comparison, others may feel muscle pain and can be paralysed within a week, There is no treatment for polio, and some children may die from it.",
    "required": true,
    "sideEffects":
    "Common minor vaccine reaction associated with OPV are fever, irritability, malaise, and non-specific symptoms, such as diarrhea, headache, and/or muscle pain.",
    "ageGroup": 0,
    "maxAge": 2,
    "doses": 4,
    "intervals": [0, 6, 4, 4],
  },
  {
    "name": "Hepatitis B (Hep B)",
    "info":
    "Hepatitis B virus causes Hepatitis B, It is found in blood and body fluids, People are infected when these fluids transmit from person to person, Using needles previously used by others may also transfer the disease from one person to another, Children are immunised to prevent any infection in the case of exposure to HBV-positive material.",
    "required": true,
    "sideEffects":
    "The vaccine causes swelling at the site of administration.",
    "ageGroup": 0,
    "maxAge": 0,
    "doses": 3,
    "intervals": [0, 6, 20],
  },
  {
    "name": "DTP Vaccine",
    "info":
    "Healthcare professionals administer DTP (Diptheria, tetanus, pertussis) to children to prevent these three deadly diseases, Diptheria is a thick covering at the back of the throat. It causes breathing problems, paralysis and heart problems and even death in severe cases, Tetanus is a disease wherein the muscles of the body contract all over the body. It can lead to lockjaw and as a result of which the victim cannot swallow, Pertussis causes severe coughing spells that last for weeks. It can lead to pneumonia, brain damage, convulsions and even death",
    "required": true,
    "sideEffects":
    "it is an intramuscular vaccine, In some cases, children who react adversely to the DTP shot should not get the second dose, Consult with a healthcare professional to know when to avoid the next dosage of DTP.",
    "ageGroup": 6,
    "maxAge": 6,
    "doses": 1,
    "intervals": [0],
  },
  {
    "name": "Haemophilus Influenza B Virus (HIB)e",
    "info":
    "It prevents brain and spine damage if causing meningitis, Hib bacteria can cause mild issues such as ear infections, bronchitis, or severe blood illnesses, Hib can also cause pneumonia, severe swelling of the throat, infections of the joints, bones, covering of the heart, and even death in extreme cases.",
    "required": true,
    "sideEffects":
    "Side effects amy include - pain or redness or swelling at the site of the injection, a high temperature, irritability, loss of appetite, sleepiness.",
    "ageGroup": 6,
    "maxAge": 6,
    "doses": 3,
    "intervals": [0, 4, 4],
  },
  {
    "name": "Rotavirus",
    "info":
    "Rotavirus is the cause of severe gastroenteritis in infants and children, The virus enters the body through the mouth, Rotavirus in young children can result in severe diarrhoea, dehydration, electrolyte imbalance, and metabolic acidosis, This microbe spreads when it comes in contact with stool",
    "required": true,
    "sideEffects":
    "Side effects are rare, usually mild, and may include fussiness, diarrhea, and vomiting.",
    "ageGroup": 6,
    "maxAge": 6,
    "doses": 3,
    "intervals": [0, 4, 4],
  },
  {
    "name": "Typhoid Conjugate Vaccine",
    "info":
    "TCV is the latest group of required vaccinations for babies in India, It is a conjugate of tetanus and typhoid vaccines, It prevents typhoid fever between 9 months to 16 years, WHO has qualified it, Typhoid fever, caused by salmonella typhi, causes 11 million cases in a year and more than 1 lakh deaths, It spreads through contaminated food or water, The efficacy of the conjugate is 82%",
    "required": true,
    "sideEffects":
    "common side effects such as headache, fever, redness, pain, and inflammation at the injection site. Most of these side effects do not require medical attention and will resolve gradually over time.",
    "ageGroup": 13,
    "maxAge": 26,
    "doses": 1,
    "intervals": [0],
  },
  {
    "name": "MMR Vaccine for Measles",
    "info":
    "MMR is for measles, mumps and rubella, Measles is an infectious disease, causing stomach problems, ear infections, convulsions, brain damage and pneumonia, Mumps can lead to meningitis and encephalitis, Rubella is known as German measles.",
    "required": true,
    "sideEffects":
    "Sore arm from the shot, Fever, Mild rash, Temporary pain and stiffness in the joints",
    "ageGroup": 39,
    "maxAge": 39,
    "doses": 2,
    "intervals": [0, 169],
  },
  {
    "name": "Hepatitis A",
    "info":
    "Hepatitis A affects the liver. The Hepatitis virus causes this disease, The disease is transmitted through the faecal-oral route because of poor sanitation, 1.5 million cases are reported each year, Around 85% of children below the age of 2 can be infected, It also causes jaundice in most cases",
    "required": true,
    "sideEffects":
    "Side effects may include - Swelling, tenderness, redness, warmth, or a hard lump where the shot was given, Low fever, General ill feeling, Nausea, Loss of appetite, Headache.",
    "ageGroup": 52,
    "maxAge": null,
    "doses": 2,
    "intervals": [0, 26],
  },
  //OPTIONAL
  {
    "name": "Pneumococcal Conjugate Vaccine",
    "info":
    "The vaccine protects against invasive pneumococcal disease, It is a significant cause of death in children in India, WHO recommends the vaccine, The disease can occur in multiple organ systems causing pneumonia, sepsis, sinusitis, bronchitis, middle ear infection, meningitis, It is transmitted by direct contact with cough or sputum",
    "required": false,
    "sideEffects":
    "Side effects may include - Reactions where the shot was given. Redness. Swelling. Pain or tenderness, Fever, Loss of appetite, Fussiness (irritability}, Feeling tired, Headache, Muscle aches or joint pain, Chills.",
    "ageGroup": 8,
    "maxAge": null,
    "doses": 1,
    "intervals": [0],
  },
  {
    "name": "Influenza",
    "info":
    "This vaccination for babies in India is crucial as it protects against influenza.",
    "required": false,
    "sideEffects":
    "Side effects may include - Soreness, redness, and/or swelling from the shot, Headache, Fever, Nausea, Muscle aches.",
    "ageGroup": 26,
    "maxAge": null,
    "doses": 30,
    "intervals": [0, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52],
  },
  {
    "name": "Chickenpox Varicella",
    "info":
    "Varicella-zoster VSirus causes Chickenpox, The disease lasts 1-2 weeks, It is not very dangerous in childhood with rash and fever.",
    "required": false,
    "sideEffects":
    "Sore arm from the injection, redness or rash where the shot is given, or fever can happen after varicella vaccination. More serious reactions happen very rarely. These can include pneumonia, infection of the brain and/or spinal cord covering, or seizures that are often associated with fever.",
    "ageGroup": 52,
    "maxAge": 52,
    "doses": 1,
    "intervals": [0],
  },
  {
    "name": "Japanese Encephalitis",
    "info":
    "The Culex mosquito carries Flavivirus which causes this disease, High fever, malaise, headache, the rigidity of the neck are some common symptoms.",
    "required": false,
    "sideEffects":
    "Pain, tenderness, redness, or swelling where the shot was given are common after JE vaccine. Fever sometimes happens (more often in children). Headache or muscle aches can occur (mainly in adults).",
    "ageGroup": 78,
    "maxAge": null,
    "doses": 2,
    "intervals": [0, 4],
  },
  {
    "name": "Meningococcal Meningitis",
    "info":
    "A bacteria Neisseria meningitides cause it, 1.2 million cases occur every year, There are significant outbreaks in northern and northeastern states, This bacteria is transmitted through direct contact with droplets from the nose or throat and affects the upper respiratory tract, It primarily affects children, There is a sudden onset of headache, nausea, vomiting, confusion, etc",
    "required": false,
    "sideEffects":
    "Side effects may include - Soreness, redness, or swelling where they got the shot, Fatigue, Headache, Muscle or joint pain, Fever or chills, Nausea or diarrhea.",
    "ageGroup": 572,
    "maxAge": 624,
    "doses": 2,
    "intervals": [0, 208],
  },
  {
    "name": "Cholera",
    "info":
    "Cholera is an acute diarrhoeal illness of the intestine, Vibrio cholera causes it.",
    "required": false,
    "sideEffects":
    "Tiredness, headache, abdominal pain, nausea, vomiting, lack of appetite, and diarrhea can happen after cholera vaccine.",
    "ageGroup": 104,
    "maxAge": null,
    "doses": 3,
    "intervals": [0, 6, 6],
  },
];