interface Vaccine {
  name: string;
  information: string; // keep under 100 words
  requirements: string; // keep under 100 words
  sideEffects: string | null; // keep under 100 words
  ageGroup: number; // age group in months
  doses: number; // number of doses
  interval: number; // interval between doses in weeks
}

const vaccineData: Vaccine[] = [
  {
    name: "Hepatitis B",
    information:
      "Hepatitis B is a liver infection caused by the hepatitis B virus. Some people with hepatitis B are sick for only a few weeks (known as “acute” infection), but for others, the disease progresses to a serious, lifelong illness known as chronic hepatitis B.",
    requirements:
      "Hepatitis B vaccine is recommended for all infants, children, and adolescents. It is also recommended for adults who are at increased risk for hepatitis B infection, including those who are infected with HIV, have chronic liver disease, or are at risk for occupational exposure to hepatitis B.",
    sideEffects:
      "Only mild side effects, commonly including soreness, redness, or swelling where the shot was given. These side effects usually go away within a few days.",
    ageGroup: 0,
    doses: 3,
    interval: 4,
  },
];

export default vaccineData;
