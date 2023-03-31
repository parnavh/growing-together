interface Vaccine {
    name: string;
    information: string; // keep under 100 words
    requirements: string; // keep under 100 words
    sideEffects: string | null; // keep under 100 words
    ageGroup: number; // age group in weeks
    maxAge: number; // age group in weeks
    doses: number; // number of doses
    interval: number[]; // interval between doses in weeks
}

const vaccineData: Vaccine[] = [
  {
    name: "BCG Vaccine for Tuberculosis",
    information:
    "Bacillus Calmette-Guerin (BCG) vaccine is administered to prevent tuberculosis in infants, BCG is a well-known newborn baby vaccination.",
    requirements: "Mandatory",
    sideEffects:
      "The vaccine causes swelling at the site of administration.",
    ageGroup: 0,
    maxAge: 52,
    doses: 1,
    interval: [0],
  },
  {
    name: "Oral Polio Vaccines",
    information:
    "Polio is a disease that causes paralysis in children, Poliovirus lives in the throat and intestinal tract of a person and spreads by contact with faeces, Some children who get polio do not feel any symptoms, and others get symptoms similar to the common cold. In comparison, others may feel muscle pain and can be paralysed within a week, There is no treatment for polio, and some children may die from it.",
    requirements: "Mandatory",
    sideEffects:
      "Common minor vaccine reaction associated with OPV are fever, irritability, malaise, and non-specific symptoms, such as diarrhea, headache, and/or muscle pain.",
    ageGroup: 0,
    maxAge: 2,
    doses: 4,
    interval: [0, 6, 4, 4],
  },
  {
    name: "Hepatitis B (Hep B)",
    information:
    "Hepatitis B virus causes Hepatitis B, It is found in blood and body fluids, People are infected when these fluids transmit from person to person, Using needles previously used by others may also transfer the disease from one person to another, Children are immunised to prevent any infection in the case of exposure to HBV-positive material.",
    requirements: "Mandatory",
    sideEffects:
      "The vaccine causes swelling at the site of administration.",
    ageGroup: 0,
    maxAge: 0,
    doses: 3,
    interval: [0, 6, 20],
  },
  {
    name: "DTP Vaccine",
    information:
    "Healthcare professionals administer DTP (Diptheria, tetanus, pertussis) to children to prevent these three deadly diseases, Diptheria is a thick covering at the back of the throat. It causes breathing problems, paralysis and heart problems and even death in severe cases, Tetanus is a disease wherein the muscles of the body contract all over the body. It can lead to lockjaw and as a result of which the victim cannot swallow, Pertussis causes severe coughing spells that last for weeks. It can lead to pneumonia, brain damage, convulsions and even death",
    requirements: "Mandatory",
    sideEffects:
      "it is an intramuscular vaccine, In some cases, children who react adversely to the DTP shot should not get the second dose, Consult with a healthcare professional to know when to avoid the next dosage of DTP.",
    ageGroup: 6,
    maxAge: 6,
    doses: 1,
    interval: [0],
  },
  {
    name: "Haemophilus Influenza B Virus (HIB)e",
    information:
    "It prevents brain and spine damage if causing meningitis, Hib bacteria can cause mild issues such as ear infections, bronchitis, or severe blood illnesses, Hib can also cause pneumonia, severe swelling of the throat, infections of the joints, bones, covering of the heart, and even death in extreme cases.",
    requirements: "There is only 1 dosage for this vaccine in the vaccination programme for babies in India",
    sideEffects:
      "",
    ageGroup: 6,
    maxAge: 6,
    doses: 3,
    interval: [0, 4, 4],
  },
  {
    name: "Rotavirus",
    information:
      "Rotavirus is the cause of severe gastroenteritis in infants and children, The virus enters the body through the mouth, Rotavirus in young children can result in severe diarrhoea, dehydration, electrolyte imbalance, and metabolic acidosis, This microbe spreads when it comes in contact with stool",
    requirements: "Mandatory",
    sideEffects:
      "",
    ageGroup: 6,
    maxAge: 6,
    doses: 2,
    interval: [0, 4],
  },
  {
    name: "Typhoid Conjugate Vaccine",
    information:
    "TCV is the latest group of required vaccinations for babies in India, It is a conjugate of tetanus and typhoid vaccines, It prevents typhoid fever between 9 months to 16 years, WHO has qualified it, Typhoid fever, caused by salmonella typhi, causes 11 million cases in a year and more than 1 lakh deaths, It spreads through contaminated food or water, The efficacy of the conjugate is 82%",
    requirements: "Mandatory",
    sideEffects:
      "",
    ageGroup: 13,
    maxAge: 26,
    doses: 1,
    interval: [0],
  },
  {
    name: "MMR Vaccine for Measles",
    information:
    "MMR is for measles, mumps and rubella, Measles is an infectious disease, causing stomach problems, ear infections, convulsions, brain damage and pneumonia, Mumps can lead to meningitis and encephalitis, Rubella is known as German measles.",
    requirements: "Mandatory",
    sideEffects:
      "",
    ageGroup: 39,
    maxAge: 39,
    doses: 2,
    interval: [0, 169],
  },
];

export default vaccineData;
