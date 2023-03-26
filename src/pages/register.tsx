import Link from "next/link";
import Image from "next/image";
import { Button, Divider } from "@mantine/core";
import GoogleSignIn from "@/components/GoogleSignIn";

export default function register() {
  return (
    <div className="flex min-h-screen flex-col items-center bg-[#D0EBFF] pb-10">
      <Image
        width={199}
        height={199}
        src="/images/logo.png"
        alt="Growing Together Logo"
      />

      <div className="mx-4 flex w-11/12 max-w-md flex-col rounded-md bg-[#1C7ED6] p-10 text-white">
        <p className="text-3xl">Welcome!</p>
        <p className="-mt-6 text-xl">Please register to continue.</p>
        <form className="flex flex-col">
          <label htmlFor="email" className="mb-1">
            First Name
          </label>
          <input
            className="mb-3 rounded-lg border-none p-3"
            type="text"
            name="fname"
            id=""
            placeholder="First Name"
          />
          <label htmlFor="password" className="mb-1">
            Last Name
          </label>
          <input
            className="mb-3 rounded-lg border-none p-3"
            type="text"
            name="lname"
            id=""
            placeholder="Last Name"
          />
          <label htmlFor="email" className="mb-1">
            Email
          </label>
          <input
            className="mb-3 rounded-lg border-none p-3"
            type="email"
            name="email"
            id=""
            placeholder="Email"
          />
          <label htmlFor="password" className="mb-1">
            Password
          </label>
          <input
            className="mb-3 rounded-lg border-none p-3"
            type="password"
            name="password"
            id=""
            placeholder="Password"
          />
          <Button type="submit" variant="white" className="mt-5 uppercase">
            Submit
          </Button>
        </form>
        <Divider
          size="sm"
          label={<span className="my-3 text-lg">OR</span>}
          labelPosition="center"
          color="white"
        />
        <GoogleSignIn />
        <div className="mt-4 flex flex-col items-center text-lg">
          <p className="mb-2">Already have an account?</p>
          <Link href="/login">Login</Link>
        </div>
      </div>
    </div>
  );
}
