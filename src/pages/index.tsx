import { type NextPage } from "next";
import Head from "next/head";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "@/utils/api";
import Image from "next/image";
import Nav from "@/components/Nav";

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

        <div className="flex flex-col items-center gap-2">
          <AuthShowcase />
        </div>
      </main>
    </>
  );
};

export default Home;

const AuthShowcase: React.FC = () => {
  const { data: sessionData } = useSession();

  const { data: secretMessage } = api.example.getSecretMessage.useQuery(
    undefined, // no input
    { enabled: sessionData?.user !== undefined }
  );

  return (
    <div className="flex flex-col items-center justify-center gap-4">
      <p className="text-center text-2xl">
        {sessionData && <span>Logged in as {sessionData.user?.name}</span>}
        {secretMessage && <span> - {secretMessage}</span>}
      </p>
      <button
        className="rounded-full bg-black px-10 py-3 font-semibold text-white no-underline transition hover:bg-black/20"
        onClick={sessionData ? () => void signOut() : () => void signIn()}
      >
        {sessionData ? "Sign out" : "Sign in"}
      </button>
    </div>
  );
};