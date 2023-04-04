import Head from "next/head";
import {
  Title,
  Group,
  Loader,
  Pagination,
  Switch,
  Indicator,
} from "@mantine/core";
import { Calendar } from "@mantine/dates";
import VaccineCard from "@/components/VaccineCard";
import { withAuth } from "@/utils/protect";
import Layout from "@/components/Layout";
import type { NextPage } from "next";
import { api } from "@/utils/api";
import { useEffect, useState } from "react";

export const getServerSideProps = withAuth();

const Vaccination: NextPage = () => {
  const { data } = api.vaccination.getVacinations.useQuery();
  const [activePage, setActivePage] = useState(1);
  const [mandatoryOnly, setMandatoryOnly] = useState(false);
  const [upcomingOnly, setUpcomingOnly] = useState(false);
  const [activeDate, setActiveDate] = useState<null | Date>(null);

  useEffect(() => {
    setActivePage(1);
  }, [mandatoryOnly, upcomingOnly]);

  if (!data) {
    return (
      <Layout>
        <Head>
          <title>Vaccination | Growing Together</title>
        </Head>
        <div className="mt-10 flex justify-center">
          <Loader />
        </div>
      </Layout>
    );
  }

  const vaccinations = data.vaccinations.filter((v) => {
    if (mandatoryOnly) {
      return v.requirements.includes("Mandatory");
    }
    if (upcomingOnly) {
      return v.dueDate.getTime() > Date.now();
    }
    if (activeDate) {
      return (
        v.dueDate.getDate() === activeDate.getDate() &&
        v.dueDate.getMonth() === activeDate.getMonth() &&
        v.dueDate.getFullYear() === activeDate.getFullYear()
      );
    }
    return true;
  });

  const vaccinationPerPage = 2;

  const activeVaccinations = vaccinations
    .sort((a, b) => a.ageGroup - b.ageGroup)
    .slice(
      (activePage - 1) * vaccinationPerPage,
      activePage * vaccinationPerPage
    );

  const isVaccineDueOnDate = (date: Date) => {
    return data.vaccinations.some((v) => {
      return (
        v.dueDate.getDate() === date.getDate() &&
        v.dueDate.getMonth() === date.getMonth() &&
        v.dueDate.getFullYear() === date.getFullYear()
      );
    });
  };

  return (
    <Layout>
      <Head>
        <title>Vaccination | Growing Together</title>
      </Head>
      <Title order={1} ta="center" mt={"3rem"} size={"2rem"} weight={600}>
        Ensure your child&apos;s protection by tracking their vaccines
      </Title>
      <div className="mx-auto mt-16 flex w-[65%] justify-start">
        <div className="flex flex-col">
          <div>
            <Calendar
              bg="white"
              size="lg"
              my={{ base: "1rem", lg: "auto" }}
              mx={"auto"}
              p={{ md: "sm" }}
              renderDay={(date) => {
                return (
                  <Indicator
                    size={6}
                    color="red"
                    offset={-2}
                    disabled={!isVaccineDueOnDate(date)}
                    onClick={() => setActiveDate(date)}
                  >
                    {date.getDate()}
                  </Indicator>
                );
              }}
            />
          </div>
          <div className="mt-5">
            <h3 className="mb-3 text-2xl font-semibold">Legend:</h3>
            <div className="flex items-center">
              <div className="mr-2 h-4 w-4 rounded-full bg-[#228BE6]"></div>
              <p className="my-1 text-lg font-medium">Upcoming Vaccine</p>
            </div>
            <div className="flex items-center">
              <div className="mr-2 h-4 w-4 rounded-full bg-[#66bb6a]"></div>
              <p className="my-1 text-lg font-medium">Vaccine Currently Due</p>
            </div>
            <div className="flex items-center">
              <div className="mr-2 h-4 w-4 rounded-full bg-[#ff6149]"></div>
              <p className="my-1 text-lg font-medium">Overdue Vaccine</p>
            </div>
          </div>
        </div>
        <Group
          className="flex flex-col"
          mt={{ base: "3rem", lg: "0.5rem" }}
          mx={{ lg: "3rem" }}
        >
          <Switch
            checked={mandatoryOnly}
            onChange={(event) => setMandatoryOnly(event.currentTarget.checked)}
            labelPosition="left"
            label="Mandatory Vaccines Only"
            size="md"
            className="self-end"
          />
          <Switch
            checked={upcomingOnly}
            onChange={(event) => setUpcomingOnly(event.currentTarget.checked)}
            labelPosition="left"
            label="Upcoming Vaccinations Only"
            size="md"
            className="self-end"
          />
          {activeVaccinations.map((vaccination) => {
            return (
              <VaccineCard
                key={vaccination.name}
                {...vaccination}
                weeks={data.weeks}
              />
            );
          })}
          <div className="mx-auto">
            <Pagination
              value={activePage}
              onChange={(page) => setActivePage(page)}
              total={vaccinations.length / vaccinationPerPage}
              radius="lg"
              className="mt-5"
              color="blue"
            />
          </div>
        </Group>
      </div>
    </Layout>
  );
};

export default Vaccination;
