import { Tabs } from "@mantine/core";
import { useRouter } from "next/router";
import type { FC } from "react";
import { IconHome, IconVaccine, IconStethoscope } from "@tabler/icons-react";

interface Props {
  activeTab: string;
}

const Nav: FC<Props> = ({ activeTab }) => {
  const router = useRouter();

  return (
    <Tabs
      value={router.query.activeTab as string}
      // eslint-disable-next-line @typescript-eslint/no-misused-promises
      onTabChange={(value: string) => router.push(value)}
      className="w-4/5 max-w-[640px]"
    >
      <Tabs.List
        sx={(theme) => ({
          background: theme.colors.blue[7],
        })}
        className="flex justify-between gap-[10px] rounded-full p-3"
      >
        <Tabs.Tab
          className={`flex-1 rounded-full text-xl font-bold ${
            activeTab === "home"
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
            activeTab === "vaccination"
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
            activeTab === "paediatricians"
              ? "bg-white text-black"
              : "text-white hover:bg-white hover:text-black"
          }`}
          value="/paediatricians"
        >
          <div className="flex items-center gap-3">
            <IconStethoscope size={24} />
            <span>Paediatricians</span>
          </div>
        </Tabs.Tab>
      </Tabs.List>
    </Tabs>
  );
};

export default Nav;
