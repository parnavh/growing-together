import Image from "next/image";
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
      <Image
        width={200}
        height={200}
        src="/images/logo.svg"
        alt="Growing Together Logo"
        className="self-center"
      />
      {showNav && <Nav />}
      <main>{children}</main>
      <Footer />
    </div>
  );
};

export default Layout;
