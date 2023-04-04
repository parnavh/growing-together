import Layout from "@/components/Layout";
import { withAuth } from "@/utils/protect";
import { Title } from "@mantine/core";
import { type NextPage } from "next";
import Head from "next/head";

export const getServerSideProps = withAuth();

const Consulting: NextPage = () => {
  return (
    <Layout>
      <Head>
        <title>Consulting | Growing Together</title>
      </Head>
      <Title order={1} ta="center" mt={"3rem"} size={"2rem"} weight={600}>
        Consult our bot with your Vaccine related Queries
      </Title>
      <div className="mx-auto mt-4 h-[80vh] w-8/12">
        <iframe
          allow="microphone;"
          width="100%"
          height="100%"
          src="https://console.dialogflow.com/api-client/demo/embedded/9961a20f-44b6-44d7-b76f-9880f2f4ef6e"
        ></iframe>
      </div>
    </Layout>
  );
};

export default Consulting;
