import Layout from "@/components/Layout";
import { withAuth } from "@/utils/protect";
import Head from "next/head";
import type { FC } from "react";

export const getServerSideProps = withAuth();

const paediatricians: FC = () => {
  return (
    <Layout>
      <Head>
        <title>Paediatricians | Growing Together</title>
      </Head>
      <h1>Paediatricians</h1>
    </Layout>
  );
};

export default paediatricians;
