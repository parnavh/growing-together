import React from 'react';
import { Card, Text, Flex, Chip, Group, Alert, Title } from '@mantine/core';
import { IconAlertCircle } from '@tabler/icons-react';

export default function VaccinationCard(props: {vNo:number, date:string, desc:string}) {
  return (
    <Alert icon={<IconAlertCircle size="2rem" />} bg={"#ABD7FF"} radius={"xl"} p={"lg"} style={{"border":"2px solid #ABD7FF"}}>
      <Flex justify={"space-between"} mb={"sm"}>
        <Group>
          <Title order={4}>Vaccination #{props.vNo}</Title>
        </Group>
        <Chip variant={"light"} color={"blue"}>Mark as Done</Chip>
      </Flex>
      <Text fw={500} mt={"-1rem"}>{props.date}</Text>
      <Text>{props.desc}</Text>
    </Alert>
  )
}
