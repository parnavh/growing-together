import { Flex, Loader, Text } from "@mantine/core";
import { type FC, useEffect, useState } from "react";
import { type OnboardingFormValues } from "@/pages/onboarding";
import { api } from "@/utils/api";

interface Props {
  formValues: OnboardingFormValues;
}

const Submit: FC<Props> = ({ formValues }) => {
  const [status, setStatus] = useState<"loading" | "success" | "fail">(
    "loading"
  );

  const { mutate } = api.onboarding.createProfile.useMutation();

  useEffect(() => {
    mutate(formValues, {
      onSuccess: () => setStatus("success"),
      onError: () => setStatus("fail"),
    });
  }, []);

  return (
    <>
      <Flex
        align="center"
        justify="center"
        mt="xl"
        p="xl"
        sx={(theme) => {
          if (status === "fail") {
            return {
              backgroundColor: theme.colors.red[5],
              borderRadius: theme.radius.md,
              color: "white",
            };
          }
          if (status === "loading") {
            return {
              backgroundColor: theme.colors.gray[3],
              borderRadius: theme.radius.md,
              color: "white",
            };
          }
          return {
            backgroundImage: theme.fn.gradient({ from: "indigo", to: "grape" }),
            borderRadius: theme.radius.md,
            color: "white",
          };
        }}
      >
        {status === "loading" ? (
          <Loader />
        ) : (
          <Text align="center" fw={700} fz="xl">
            {status === "success"
              ? "Your submission has been received!"
              : "An error occurred, submission failed!"}
          </Text>
        )}
      </Flex>
      <div className="mt-3 text-center">
        {/* eslint-disable-next-line @next/next/no-html-link-for-pages */}
        <a href="/">Go to home page</a>
      </div>
    </>
  );
};

export default Submit;
