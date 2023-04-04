import Layout from "@/components/Layout";
import { withAuth } from "@/utils/protect";
import { Button, Title } from "@mantine/core";
import { IconExternalLink } from "@tabler/icons-react";
import { type NextPage } from "next";
import { useSession } from "next-auth/react";
import Head from "next/head";

export const getServerSideProps = withAuth();

const Consulting: NextPage = () => {
  const { data } = useSession();

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
      <div className="mx-auto mt-4 flex w-8/12 justify-end">
        {data && data.user.pinCode && data.user.city && (
          <Button
            component="a"
            href={`https://www.cybo.com/IN-pin-code/${data?.user.pinCode}_${data?.user.city}/pediatricians/`}
            size="md"
            leftIcon={<IconExternalLink />}
          >
            Find a Paediatrician Near You
          </Button>
        )}
      </div>
    </Layout>
  );
};

export default Consulting;
