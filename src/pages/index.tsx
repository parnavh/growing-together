import { type NextPage } from "next";
import Head from "next/head";
import ArticleCard from "@/components/ArticleCard";
import { SimpleGrid, Text } from "@mantine/core";
import Layout from "@/components/Layout";
import { Blockquote } from "@mantine/core";
import { useEffect, useState } from "react";
import { getRandomQuote, articles, type Quote } from "@/utils/getData";
import { withAuth } from "@/utils/protect";

export const getServerSideProps = withAuth();

const Home: NextPage = () => {
  const [quote, setQuote] = useState<Quote>();

  useEffect(() => {
    setQuote(getRandomQuote());
  }, []);

  return (
    <Layout>
      <Head>
        <title>Home | Growing Together</title>
      </Head>

      <Text ta="center" mt={"3rem"} size={"2rem"} weight={600}>
        Welcome Back, Joe!
      </Text>
      <div className="flex justify-center">
        <Blockquote
          maw="45%"
          cite={quote && "- " + quote.cite}
          mt="sm"
          px={{ base: "md" }}
        >
          {quote?.quote}
        </Blockquote>
      </div>

      <SimpleGrid w="70%" mx="auto" my="lg" cols={3} spacing={32}>
        {articles.map((article, id) => (
          <ArticleCard key={id} {...article} />
        ))}
      </SimpleGrid>
    </Layout>
  );
};

export default Home;
