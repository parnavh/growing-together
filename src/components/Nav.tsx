import { Tabs } from "@mantine/core";
import { useRouter } from "next/router";
import type { FC } from "react";

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
        className="flex justify-between gap-[10px] rounded-full px-[10px] py-2"
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
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="icon icon-tabler icon-tabler-home"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              stroke-width="2"
              stroke="currentColor"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
              <path d="M5 12l-2 0l9 -9l9 9l-2 0"></path>
              <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path>
              <path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path>
            </svg>
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
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="icon icon-tabler icon-tabler-vaccine"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              stroke-width="2"
              stroke="currentColor"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
              <path d="M17 3l4 4"></path>
              <path d="M19 5l-4.5 4.5"></path>
              <path d="M11.5 6.5l6 6"></path>
              <path d="M16.5 11.5l-6.5 6.5h-4v-4l6.5 -6.5"></path>
              <path d="M7.5 12.5l1.5 1.5"></path>
              <path d="M10.5 9.5l1.5 1.5"></path>
              <path d="M3 21l3 -3"></path>
            </svg>
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
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="icon icon-tabler icon-tabler-stethoscope"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              stroke-width="2"
              stroke="currentColor"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
              <path d="M6 4h-1a2 2 0 0 0 -2 2v3.5h0a5.5 5.5 0 0 0 11 0v-3.5a2 2 0 0 0 -2 -2h-1"></path>
              <path d="M8 15a6 6 0 1 0 12 0v-3"></path>
              <path d="M11 3v2"></path>
              <path d="M6 3v2"></path>
              <path d="M20 10m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path>
            </svg>
            <span>Paediatricians</span>
          </div>
        </Tabs.Tab>
      </Tabs.List>
    </Tabs>
  );
};

export default Nav;
