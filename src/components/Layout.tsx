import { useSession } from "next-auth/react";
import NextImage from "next/image";
import { Avatar } from "@mantine/core";
import Link from "next/link";
import type { FC, ReactNode } from "react";
import Footer from "./Footer";
import Nav from "./Nav";

interface Props {
  children: ReactNode;
  showNav?: boolean;
}

const Layout: FC<Props> = ({ children, showNav = true }) => {
  const { data } = useSession();

  return (
    <div className="flex min-h-screen flex-col bg-[#D0EBFF]">
      <header className="relative grid place-items-center">
        <Link href="/">
          <NextImage
            width={200}
            height={200}
            src="/images/logo.svg"
            alt="Growing Together Logo"
          />
        </Link>

        <div className="absolute right-32 ">
          <Link href="/profile">
            <Avatar
              alt="Profile Picture"
              src={data?.user.image}
              radius="xl"
              size="lg"
            />
          </Link>
        </div>
      </header>
      {showNav && <Nav />}
      <main>{children}</main>
      <Footer />
    </div>
  );
};

export default Layout;
