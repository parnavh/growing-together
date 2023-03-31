import {
  Card,
  Text,
  Button,
  Image,
  Group,
  Badge,
  Title,
  Highlight,
} from "@mantine/core";
import { type FC } from "react";
import { type Article } from "@/utils/getData";

const HomeCard: FC<Article> = ({
  title,
  description,
  link,
  readingTime,
  tags,
  thumbnail,
}) => {
  return (
    <Card
      display="flex"
      className="flex-col"
      padding="lg"
      radius="md"
      bg="#228BE6"
      mx={{ lg: "xs" }}
    >
      <Card.Section>
        <Image src={thumbnail} alt="Thumbnail" height={160} />
      </Card.Section>
      <Group position="apart" mt="md" mb="xs">
        <Title order={3} weight={500} c="white">
          {title}
        </Title>
        <div className="flex flex-wrap gap-1">
          {tags.map((tag, id) => (
            <Badge key={id} color="pink" variant="light">
              {tag}
            </Badge>
          ))}
        </div>
      </Group>

      <Text size="sm" c="white" className="flex-1">
        {description}
      </Text>

      <Button
        component="a"
        target="_blank"
        href={link}
        variant="light"
        color="blue"
        fullWidth
        mt="md"
        radius="md"
        className="self-end"
      >
        Read More
      </Button>
    </Card>
  );
};

export default HomeCard;
