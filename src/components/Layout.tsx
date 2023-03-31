import Image from "next/image";
import Link from "next/link";
import type { FC, ReactNode } from "react";
import Footer from "./Footer";
import Nav from "./Nav";

interface Props {
  children: ReactNode;
  showNav?: boolean;
}

const Layout: FC<Props> = ({ children, showNav = true }) => {
  return (
    <div className="flex min-h-screen flex-col bg-[#D0EBFF]">
      <Link href="/" className="self-center">
        <Image
          width={200}
          height={200}
          src="/images/logo.svg"
          alt="Growing Together Logo"
        />
      </Link>
      {showNav && <Nav />}
      <main>{children}</main>
      <Footer />
    </div>
  );
};

export default Layout;
