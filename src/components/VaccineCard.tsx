import type { Vaccine } from "@/utils/getData";
import type { FC } from "react";
import { Card, Title, Text, Badge } from "@mantine/core";

type Props = Vaccine & {
  dueDate: Date;
  weeks: number;
};

const VaccineCard: FC<Props> = ({
  name,
  requirements,
  information,
  ageGroup,
  doses,
  maxAge,
  weeks,
  interval,
  dueDate,
}) => {
  const bgColor =
    weeks >= ageGroup
      ? maxAge === null || weeks > maxAge
        ? "#ff6149"
        : "#66bb6a"
      : "#228BE6";

  return (
    <Card
      display="flex"
      className="flex-col"
      padding="lg"
      radius="md"
      w="100%"
      bg={bgColor}
    >
      <Title order={2} c="white">
        {name}
      </Title>
      <Badge color="pink" variant="filled" className="mt-4 mb-2 self-start">
        {requirements}
      </Badge>
      <Text c="white">{information}</Text>
      <Text c="white" mt="md">
        <span className="font-bold">Age Group: </span>
        {ageGroup === 0
          ? "New Born"
          : `${ageGroup} ${ageGroup > 1 ? "weeks" : "week"}`}
      </Text>
      <Text c="white" mt="0.2em">
        <span className="font-bold">Doses: </span>
        {doses} {doses > 1 ? "doses" : "dose"}
      </Text>
      {doses > 1 && (
        <Text c="white" mt="0.2em">
          <span className="font-bold">Interval between doses: </span>
          {interval.slice(1).join(" weeks, ")} weeks
        </Text>
      )}
      <Text c="white" mt="0.2em">
        <span className="font-bold">Due Date: </span>
        {dueDate.toLocaleDateString()}
      </Text>
    </Card>
  );
};

export default VaccineCard;
