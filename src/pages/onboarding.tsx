import Layout from "@/components/Layout";
import Head from "next/head";
import { type FC, useEffect, useState } from "react";
import {
  Box,
  Stepper,
  Button,
  Group,
  TextInput,
  NumberInput,
  InputBase,
} from "@mantine/core";
import { useForm } from "@mantine/form";
import { DateInput } from "@mantine/dates";
import { IconLocation, IconUser } from "@tabler/icons-react";
import InputMask from "react-input-mask";
import { useSession } from "next-auth/react";
import Submit from "@/components/Submit";

export interface OnboardingFormValues {
  parentName: string;
  childName: string;
  parentAge: number;
  childDob: Date;
  city: string;
  pinCode: string;
  annualIncome: number;
}

const Onboarding: FC = () => {
  const [active, setActive] = useState(0);
  const { data, status } = useSession();

  const form = useForm<OnboardingFormValues>({
    initialValues: {
      parentName: data?.user?.name ?? "",
      childName: "",
      parentAge: 30,
      childDob: new Date(),
      city: "",
      pinCode: "",
      annualIncome: 0,
    },
    validate: (values) => {
      if (active === 0) {
        return {
          parentName:
            values.parentName.trim().length < 2
              ? "Name must contain at least 2 characters"
              : null,
          childName:
            values.childName.trim().length < 2
              ? "Name must contain at least 2 characters"
              : null,
          parentAge:
            values.parentAge < 14
              ? "Parent must be at least 14 years old"
              : null,
          childDob:
            values.childDob === null ? "Child DOB must be entered" : null,
        };
      }

      if (active === 1) {
        return {
          city:
            values.city.trim().length < 2
              ? "City must contain at least 2 characters"
              : null,
          pinCode: /^\d{3}\s\d{3}$/.test(values.pinCode)
            ? null
            : "Invalid pin code",
          annualIcome:
            values.annualIncome < 0 ? "Annual Income must be at least 0" : null,
        };
      }

      return {};
    },
  });

  useEffect(() => {
    if (status === "authenticated") {
      // @ts-ignore
      form.setValues({ parentName: data.user.name });
    }
  }, [status, form, data]);

  const nextStep = () =>
    setActive((current) => {
      if (form.validate().hasErrors) {
        console.log("form errors:", form.errors);
        return current;
      }
      return current < 2 ? current + 1 : current;
    });

  const prevStep = () =>
    setActive((current) => (current > 0 ? current - 1 : current));

  return (
    <Layout showNav={false}>
      <Head>
        <title>Onboarding | Growing Together</title>
      </Head>
      <Box w="60%" maw={500} miw={270} mx="auto">
        <Stepper active={active} breakpoint="sm">
          <Stepper.Step icon={<IconUser />} label="Parent and Child Details">
            <TextInput
              label="Parent Name"
              placeholder="Parent Name"
              {...form.getInputProps("parentName")}
            />
            <TextInput
              mt="md"
              label="Child Name"
              placeholder="Child Name"
              {...form.getInputProps("childName")}
            />
            <NumberInput
              mt="md"
              label="Parent Age"
              placeholder="Parent Age"
              {...form.getInputProps("parentAge")}
            />
            <DateInput
              mt="md"
              label="Child DOB (select a future date if expecting a child)"
              placeholder="Child DOB"
              {...form.getInputProps("childDob")}
            />
          </Stepper.Step>

          <Stepper.Step icon={<IconLocation />} label="Location and Income">
            <TextInput
              label="City"
              placeholder="City"
              {...form.getInputProps("city")}
            />
            <InputBase
              label="Pin Code"
              component={InputMask}
              mask="999 999"
              placeholder="400 002"
              {...form.getInputProps("pinCode")}
            />
            <NumberInput
              mt="md"
              label="Annual Income in INR"
              placeholder="Annual Income"
              {...form.getInputProps("annualIncome")}
            />
          </Stepper.Step>

          <Stepper.Completed>
            <Submit formValues={form.values} />
          </Stepper.Completed>
        </Stepper>

        <Group position="right" mt="xl">
          {active !== 0 && active !== 2 && (
            <Button variant="default" onClick={prevStep}>
              Back
            </Button>
          )}
          {active !== 2 && (
            <Button onClick={nextStep}>
              {active === 1 ? "Submit" : "Next"}
            </Button>
          )}
        </Group>
      </Box>
    </Layout>
  );
};

export default Onboarding;
