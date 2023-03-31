import type { FC } from "react";
import Head from "next/head";
import Image from "next/image";
import Nav from "@/components/Nav";
import { Progress, Group, Flex, Alert, Text, Chip, Title } from "@mantine/core";
import { Calendar } from "@mantine/dates";
import { useMediaQuery } from "@mantine/hooks";
import { IconAlertCircle } from "@tabler/icons-react";
import VaccinationCard from "@/components/VaccinationCard";
import { withAuth } from "@/utils/protect";

export const getServerSideProps = withAuth();

const Vaccination: FC = () => {
  const medScreen = useMediaQuery("(min-width: md)");
  return (
    <>
      <Head>
        <title>Vaccination | Growing Together</title>
      </Head>
      <main className="flex min-h-screen flex-col items-center justify-center bg-[#D0EBFF]">
        <Image
          width={199}
          height={199}
          src="/images/logo.png"
          alt="Growing Together Logo"
        />

        <Nav activeTab="vaccination" />

        {/* <Progress
          size="xl"
          mt={"4rem"}
          miw={"65%"}
          sections={[
            { value: 40, color: 'cyan' },
            { value: 20, color: 'blue' },
            { value: 15, color: 'indigo' },
          ]}
        />

        <Alert icon={<IconAlertCircle size="2rem" />} color={"red"} mt={"2rem"} radius={"md"} p={"md"}>
          <Title order={4} color={"red"}>Vaccination #2 is due!</Title>
          <Text display={"inline"}>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eum, sint? &nbsp;</Text>
          <Chip display={"inline"} color={"black"} radius={"md"}>Already Done?</Chip>
        </Alert>

        <Flex w={"65%"} my={"3rem"}>
          <Calendar size={"xl"} bg={"white"} my={"auto"} p={"1rem"} />
          <Group>
            <VaccinationCard />
            <VaccinationCard />
            <VaccinationCard />
          </Group>
        </Flex> */}

        <Progress
          size="xl"
          mt={"4rem"}
          miw={"65%"}
          sections={[
            { value: 40, color: "cyan" },
            { value: 20, color: "blue" },
            { value: 15, color: "indigo" },
          ]}
        />

        <Alert
          icon={<IconAlertCircle size="2rem" />}
          color={"red"}
          mt={"2.5rem"}
          radius={"md"}
          p={"md"}
          mx={{ base: "md" }}
        >
          <Title order={4} color={"red"}>
            Vaccination #2 is due!
          </Title>
          <Text display={"inline"}>
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eum, sint?
            &nbsp;
          </Text>
          <Chip display={"inline"} color={"black"} radius={"md"}>
            Already Done?
          </Chip>
        </Alert>

        <Flex
          my={"3rem"}
          direction={{ base: "column", lg: "row" }}
          mx={"1rem"}
          w={{ sm: "80%", lg: "65%" }}
        >
          <Calendar
            bg={"white"}
            size={medScreen ? "xl" : "lg"}
            my={{ base: "1rem", lg: "auto" }}
            mx={"auto"}
            p={{ md: "sm" }}
          />
          <Group mt={{ base: "3rem", lg: "0.5rem" }} mx={{ lg: "3rem" }}>
            <VaccinationCard
              vNo={3}
              date={"22/12/23"}
              desc={
                "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quam earum, incidunt ducimus tenetur natus ratione adipisci ab fugiat distinctio vero neque tempore? Est, eligendi odio!"
              }
            />
            <VaccinationCard
              vNo={4}
              date={"23/12/23"}
              desc={
                "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quam earum, incidunt ducimus tenetur natus ratione adipisci ab fugiat distinctio vero neque tempore? Est, eligendi odio!"
              }
            />
            <VaccinationCard
              vNo={5}
              date={"24/12/23"}
              desc={
                "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quam earum, incidunt ducimus tenetur natus ratione adipisci ab fugiat distinctio vero neque tempore? Est, eligendi odio!"
              }
            />
          </Group>
        </Flex>
      </main>
    </>
  );
};

export default Vaccination;
