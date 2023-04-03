import Layout from "@/components/Layout";
import { type NextPage } from "next";
import Head from "next/head";

const profile: NextPage = () => {
  return (
    <Layout showNav={false}>
      <Head>
        <title>Profile | Growing Together</title>
      </Head>
      <h1>Profile</h1>
    </Layout>
  );
};

export default profile;
