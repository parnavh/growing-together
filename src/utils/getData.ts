interface Vaccine {
  name: string;
  information: string; // keep under 100 words
  requirements: string; // keep under 100 words
  sideEffects: string | null; // keep under 100 words
  ageGroup: number; // age group in weeks
  maxAge: number | null; // age group in weeks
  doses: number; // number of doses
  interval: number[]; // interval between doses in weeks
}

const vaccineData: Vaccine[] = [
  {
    name: "BCG Vaccine for Tuberculosis",
    information:
      "Bacillus Calmette-Guerin (BCG) vaccine is administered to prevent tuberculosis in infants, BCG is a well-known newborn baby vaccination.",
    requirements: "Mandatory",
    sideEffects: "The vaccine causes swelling at the site of administration.",
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
      "Common minor vaccine reaction associated with OPV are fever, irritability, malaise, and non-specific symptoms, such as diarrhea, headache, and/or muscle pain.",
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
    sideEffects: "The vaccine causes swelling at the site of administration.",
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
    requirements:
      "There is only 1 dosage for this vaccine in the vaccination programme for babies in India",
    sideEffects:
      "Side effects amy include - pain or redness or swelling at the site of the injection, a high temperature, irritability, loss of appetite, sleepiness.",
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
      "Side effects are rare, usually mild, and may include fussiness, diarrhea, and vomiting.",
    ageGroup: 6,
    maxAge: 6,
    doses: 3,
    interval: [0, 4, 4],
  },
  {
    name: "Typhoid Conjugate Vaccine",
    information:
      "TCV is the latest group of required vaccinations for babies in India, It is a conjugate of tetanus and typhoid vaccines, It prevents typhoid fever between 9 months to 16 years, WHO has qualified it, Typhoid fever, caused by salmonella typhi, causes 11 million cases in a year and more than 1 lakh deaths, It spreads through contaminated food or water, The efficacy of the conjugate is 82%",
    requirements: "Mandatory",
    sideEffects:
      "common side effects such as headache, fever, redness, pain, and inflammation at the injection site. Most of these side effects do not require medical attention and will resolve gradually over time.",
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
      "Sore arm from the shot, Fever, Mild rash, Temporary pain and stiffness in the joints",
    ageGroup: 39,
    maxAge: 39,
    doses: 2,
    interval: [0, 169],
  },
  {
    name: "Hepatitis A",
    information:
      "Hepatitis A affects the liver. The Hepatitis virus causes this disease, The disease is transmitted through the faecal-oral route because of poor sanitation, 1.5 million cases are reported each year, Around 85% of children below the age of 2 can be infected, It also causes jaundice in most cases",
    requirements: "Mandatory",
    sideEffects:
      "Side effects may include - Swelling, tenderness, redness, warmth, or a hard lump where the shot was given, Low fever, General ill feeling, Nausea, Loss of appetite, Headache.",
    ageGroup: 52,
    maxAge: null,
    doses: 2,
    interval: [0, 26],
  },
  // OPTIONAL
  {
    name: "Pneumococcal Conjugate Vaccine",
    information:
      "The vaccine protects against invasive pneumococcal disease, It is a significant cause of death in children in India, WHO recommends the vaccine, The disease can occur in multiple organ systems causing pneumonia, sepsis, sinusitis, bronchitis, middle ear infection, meningitis, It is transmitted by direct contact with cough or sputum",
    requirements: "Optional",
    sideEffects:
      "Side effects may include - Reactions where the shot was given. Redness. Swelling. Pain or tenderness, Fever, Loss of appetite, Fussiness (irritability), Feeling tired, Headache, Muscle aches or joint pain, Chills.",
    ageGroup: 8,
    maxAge: null,
    doses: 1,
    interval: [0],
  },
  {
    name: "Influenza",
    information:
      "This vaccination for babies in India is crucial as it protects against influenza.",
    requirements: "Optional",
    sideEffects:
      "Side effects may include - Soreness, redness, and/or swelling from the shot, Headache, Fever, Nausea, Muscle aches.",
    ageGroup: 26,
    maxAge: null,
    doses: 30,
    interval: [
      0, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
      52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
    ],
  },
  {
    name: "Chickenpox Varicella",
    information:
      "Varicella-zoster VSirus causes Chickenpox, The disease lasts 1-2 weeks, It is not very dangerous in childhood with rash and fever.",
    requirements: "Optional",
    sideEffects:
      "Sore arm from the injection, redness or rash where the shot is given, or fever can happen after varicella vaccination. More serious reactions happen very rarely. These can include pneumonia, infection of the brain and/or spinal cord covering, or seizures that are often associated with fever.",
    ageGroup: 52,
    maxAge: 52,
    doses: 1,
    interval: [0],
  },
  {
    name: "Japanese Encephalitis",
    information:
      "The Culex mosquito carries Flavivirus which causes this disease, High fever, malaise, headache, the rigidity of the neck are some common symptoms.",
    requirements: "Optional, Mandatory for travelling to some countries",
    sideEffects:
      "Pain, tenderness, redness, or swelling where the shot was given are common after JE vaccine. Fever sometimes happens (more often in children). Headache or muscle aches can occur (mainly in adults).",
    ageGroup: 78,
    maxAge: null,
    doses: 2,
    interval: [0, 4],
  },
  {
    name: "Meningococcal Meningitis",
    information:
      "A bacteria Neisseria meningitides cause it, 1.2 million cases occur every year, There are significant outbreaks in northern and northeastern states, This bacteria is transmitted through direct contact with droplets from the nose or throat and affects the upper respiratory tract, It primarily affects children, There is a sudden onset of headache, nausea, vomiting, confusion, etc",
    requirements: "Optional",
    sideEffects:
      "Side effects may include - Soreness, redness, or swelling where they got the shot, Fatigue, Headache, Muscle or joint pain, Fever or chills, Nausea or diarrhea.",
    ageGroup: 572,
    maxAge: 624,
    doses: 2,
    interval: [0, 208],
  },
  {
    name: "Cholera",
    information:
      "Cholera is an acute diarrhoeal illness of the intestine, Vibrio cholera causes it.",
    requirements: "Optional, Recommended",
    sideEffects:
      "Tiredness, headache, abdominal pain, nausea, vomiting, lack of appetite, and diarrhea can happen after cholera vaccine.",
    ageGroup: 104,
    maxAge: null,
    doses: 3,
    interval: [0, 6, 6],
  },
];

interface Quote {
  quote: string;
  cite: string;
}

const quoteData: Quote[] = [
  {
    quote: "Those little feet, won't be little forever.",
    cite: "Ashlee Edens",
  },
  {
    quote: "If you’ve never been hated by your child, you've never been a parent.",
    cite: "Bette Davis",
  },
  {
    quote: "Sometimes, You will never know the value of a moment until it becomes a memory.",
    cite: "Dr. Seuss",
  },
  {
    quote: "Parents can only give good advice or put them on the right paths, but the final forming of a person’s character lies in their own hands.",
    cite: "Anne Frank",
  },
  {
    quote: "You know children are growing up when they start asking questions that have answers.",
    cite: "John J. Plomp",
  },
  {
    quote: "As your kids grow they may forget what you said, but won’t forget how you made them feel.",
    cite: "Kevin Heath",
  },
  {
    quote: "The empty nest comes quickly. Do not squander your most precious privilege of participating in the lives of your children.",
    cite: "Alan Hedquist",
  },
  {
    quote: "Your son will always be your little boy and your daughters will always be your little girls!",
    cite: "Felicisima Nietes De Jesus",
  },
  {
    quote: "You have a lifetime to work, but children are only young once.",
    cite: "Polish Proverb",
  },
  {
    quote: "Cherish your children… for they are the footprints you will leave behind.",
    cite: "Taylor Evan Fulks",
  },
  {
    quote: "I regret not having had more time with my kids when they were growing up.",
    cite: "Tina Turner",
  },
  {
    quote: "They’re all grown-ups now but I still have their sweet voices in my ear, the way they laughed and talked…it’s implanted in my memory…I love my kids so much.",
    cite: "Emelina Fabian Frobel",
  },
  {
    quote: "Children need models rather than critics.",
    cite: "Joseph Joubert",
  },
  {
    quote: "There are only 940 Saturdays between a child’s birth and her leaving for college.",
    cite: "Harley Rotbart",
  },
  {
    quote: "When we give children advice or instant solutions, we deprive them of the experience that comes from wrestling with their own problems.",
    cite: "Adele Faber",
  },
  {
    quote: "I continue to believe that if children are given the necessary tools to succeed, they will succeed beyond their wildest dreams!",
    cite: "David Vitter",
  },
  {
    quote: "There are no perfect parents, and there are no perfect children, but there are plenty of perfect moments along the way.",
    cite: "Dave Willis",
  },
  {
    quote: "That’s the real trouble with the world, too many people grow up. They forget.",
    cite: "Walt Disney",
  },
  {
    quote: "When they tell you to grow up, they mean stop growing.",
    cite: "Tom Robbins",
  },
  {
    quote: "We’ve had bad luck with children; they’ve all grown up.",
    cite: "Christopher Morley",
  },
  {
    quote: "You’ve got to do your own growing, no matter how tall your grandfather was.",
    cite: "Irish saying",
  },
  {
    quote: "You can learn many things from children. How much patience you have, for instance.",
    cite: "Franklin P. Jones",
  },
  {
    quote: "A grownup is a child with layers on.",
    cite: "Woody Harrelson",
  },
  {
    quote: "Don’t try to make children grow up to be like you, or they may do it.",
    cite: "Russell Baker",
  },
  {
    quote: "Growing old is mandatory. Growing up is optional.",
    cite: "Chili Davis",
  },
  {
    quote: "Children are a great comfort in your old age- and they help you reach it faster too.",
    cite: "Lionel Kauffman",
  },
  {
    quote: "Motherhood is an early retirement position. Your children do grow up.",
    cite: "Colleen Parro",
  },
  {
    quote: "No one tells you that the hardest part of motherhood is when your kids grow up.",
    cite: "Anonymous",
  },
  {
    quote: "Kids are great imitators, so give them something great to imitate.",
    cite: "Anonymous",
  },
  {
    quote: "Hold on to the tiny moments and cherish the little snuggles. They grow up so fast!",
    cite: "Anonymous",
  },
  {
    quote: "The greatest gift you can give your kids is your time, your love, and your attention.",
    cite: "Anonymous",
  },
  {
    quote: "Those little feet, won't be little forever.",
    cite: "Anonymous",
  },
  {
    quote: "Once a mom, always a mom. No matter how grown the kids are, they will always be your precious babies in your eyes!",
    cite: "Anonymous",
  },
  {
    quote: "Let them be little for they are only little for such a little while.",
    cite: "Anonymous",
  },
  {
    quote: "Son, you outgrew my lap, but never my heart.",
    cite: "Anonymous",
  },
];

export { vaccineData, quoteData };
