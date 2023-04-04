import { Tabs } from "@mantine/core";
import { useRouter } from "next/router";
import type { FC } from "react";
import { IconHome, IconVaccine, IconMessages } from "@tabler/icons-react";

const Nav: FC = () => {
  const router = useRouter();
  const { pathname: activeTab } = router;

  return (
    <Tabs
      value={activeTab}
      // eslint-disable-next-line @typescript-eslint/no-misused-promises
      onTabChange={(value: string) => router.push(value)}
      className="mx-auto w-4/5 max-w-[640px]"
    >
      <Tabs.List
        sx={(theme) => ({
          background: theme.colors.blue[7],
        })}
        className="flex justify-between gap-[10px] rounded-full p-3"
      >
        <Tabs.Tab
          className={`flex-1 rounded-full text-xl font-bold ${
            activeTab === "/"
              ? "bg-white text-black"
              : "text-white hover:bg-white hover:text-black"
          }`}
          value="/"
        >
          <div className="flex items-center gap-3">
            <IconHome size={24} />
            <span>Home</span>
          </div>
        </Tabs.Tab>
        <Tabs.Tab
          className={`flex-1 rounded-full text-xl font-bold ${
            activeTab === "/vaccination"
              ? "bg-white text-black"
              : "text-white hover:bg-white hover:text-black"
          }`}
          value="/vaccination"
        >
          <div className="flex items-center gap-3">
            <IconVaccine size={24} />
            <span>Vaccination</span>
          </div>
        </Tabs.Tab>
        <Tabs.Tab
          className={`flex-1 rounded-full text-xl font-bold ${
            activeTab === "/consulting"
              ? "bg-white text-black"
              : "text-white hover:bg-white hover:text-black"
          }`}
          value="/consulting"
        >
          <div className="flex items-center gap-3">
            <IconMessages size={24} />
            <span>Consulting</span>
          </div>
        </Tabs.Tab>
      </Tabs.List>
    </Tabs>
  );
};

export default Nav;
