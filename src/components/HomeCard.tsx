import Image from "next/image";
import { Card, Text, Button } from "@mantine/core";

export default function HomeCard() {
  return (
    <Card
      p={{ base: "2rem", lg: "lg" }}
      radius="md"
      bg="#228BE6"
      mx={{ lg: "xs" }}
    >
      <Image width={60} height={70} src="/images/CardVector.png" alt="Vector" />
      <Text weight={500} size="1.4rem" color="white" mt={7}>
        Baby Care Tips
      </Text>
      <Text size="sm" color="white" my={5}>
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Harum
        temporibus qui dolores ducimus numquam exercitationem rerum perferendis
        corporis ex sequi.
      </Text>
      <Button bg="#1864AB" mt={"2.3rem"} fullWidth>
        Read More
      </Button>
    </Card>
  );
}
