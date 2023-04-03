import { useSession } from "next-auth/react";
import NextImage from "next/image";
import { Image } from "@mantine/core";
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

        <div className="absolute right-32 h-14 w-14 overflow-hidden rounded-full ">
          <Link href="/profile">
            <Image
              className="object-cover"
              width={56}
              height={56}
              src={(data && data.user.image) || "/images/profile.png"}
              alt="Profile Picture"
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
