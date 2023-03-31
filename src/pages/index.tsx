import { type NextPage } from "next";
import Head from "next/head";
import Image from "next/image";
import Nav from "@/components/Nav";
import HomeCard from "@/components/HomeCard";
import { Grid, Text } from "@mantine/core";
import { withAuth } from "@/utils/protect";

export const getServerSideProps = withAuth();

const Home: NextPage = () => {
  return (
    <>
      <Head>
        <title>Home | Growing Together</title>
      </Head>
      <main className="flex min-h-screen flex-col items-center justify-center bg-[#D0EBFF]">
        <Image
          width={199}
          height={199}
          src="/images/logo.png"
          alt="Growing Together Logo"
        />

        <Nav activeTab="home" />

        {/* <div className="flex flex-col items-center gap-2">
          <AuthShowcase />
        </div> */}

        <Text mt={"3rem"} size={"2rem"} weight={600}>
          Welcome Back, Joe!
        </Text>
        <Text ta="center" mt={"0.5rem"} weight={500} px={{ base: "md" }}>
          "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem
          eaque eius sed itaque laborum. Tempora."
        </Text>

        <Grid
          gutter={"2rem"}
          gutterSm={"2rem"}
          gutterLg={"3.5rem"}
          w={{ base: "75%", lg: "65%" }}
          my={{ base: "3rem", sm: "3rem" }}
        >
          <Grid.Col span={12} sm={6} lg={4}>
            <HomeCard />
          </Grid.Col>
          <Grid.Col span={12} sm={6} lg={4}>
            <HomeCard />
          </Grid.Col>
          <Grid.Col span={12} sm={6} lg={4}>
            <HomeCard />
          </Grid.Col>
          <Grid.Col span={12} sm={6} lg={4}>
            <HomeCard />
          </Grid.Col>
          <Grid.Col span={12} sm={6} lg={4}>
            <HomeCard />
          </Grid.Col>
          <Grid.Col span={12} sm={6} lg={4}>
            <HomeCard />
          </Grid.Col>
        </Grid>
      </main>
    </>
  );
};

export default Home;
