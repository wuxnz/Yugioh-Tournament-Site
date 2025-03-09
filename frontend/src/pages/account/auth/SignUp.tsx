// import { Metadata } from "next"
// import Image from "next/image"
import { Link } from "react-router";

// import { cn } from "@/lib/utils"
// import { buttonVariants } from "../../../../registry/ui/button";
import { UserAuthForm } from "../../../components/account/auth/user-auth-form";

// export const metadata: Metadata = {
//   title: "Authentication",
//   description: "Authentication forms built using the components.",
// }

function SignUp() {
  return (
    <>
      {/* <div className="md:hidden">
        <img
          src="/examples/authentication-light.png"
          alt="Authentication"
          className="block dark:hidden w-full h-full"
        />
        <img
          src="/examples/authentication-dark.png"
          alt="Authentication"
          className="hidden dark:block w-full h-full"
        />
      </div> */}
      <div className="relative container flex-1 flex-col items-center justify-center md:grid lg:max-w-none lg:grid-cols-2 lg:px-0">
        <Link
          to="/examples/authentication"
          className={
            "rounded hover:bg-accent hover:text-accent-foreground absolute right-4 top-4 md:right-8 md:top-8"
          }
        >
          Login
        </Link>
        <div className="relative hidden h-full flex-col bg-muted p-10  dark:border-r lg:flex">
          <div className="absolute inset-0 bg-background brightness-75" />
          <div className="relative z-20 flex items-center text-lg font-medium">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              className="mr-2 h-6 w-6"
            >
              <path d="M15 6v12a3 3 0 1 0 3-3H6a3 3 0 1 0 3 3V6a3 3 0 1 0-3 3h12a3 3 0 1 0-3-3" />
            </svg>
            Acme Inc
          </div>
          <div className="relative z-20 mt-auto">
            <blockquote className="space-y-2">
              <p className="text-lg">
                &ldquo;This library has saved me countless hours of work and
                helped me deliver stunning designs to my clients faster than
                ever before.&rdquo;
              </p>
              <footer className="text-sm">Sofia Davis</footer>
            </blockquote>
          </div>
        </div>
        <div className="p-8 h-full flex items-center">
          <div className="mx-auto flex w-full flex-col justify-center space-y-6 sm:w-[350px]">
            <div className="flex flex-col space-y-2 text-center">
              <h1 className="text-2xl font-semibold tracking-tight">
                Create an account
              </h1>
              <p className="text-sm text-muted-foreground">
                Enter your email below to create your account
              </p>
            </div>
            <UserAuthForm />
            <p className="px-8 text-center text-sm text-muted-foreground">
              By clicking continue, you agree to our{" "}
              <Link
                to="/terms"
                className="underline underline-offset-4 hover:text-primary"
              >
                Terms of Service
              </Link>{" "}
              and{" "}
              <Link
                to="/privacy"
                className="underline underline-offset-4 hover:text-primary"
              >
                Privacy Policy
              </Link>
              .
            </p>
          </div>
        </div>
      </div>
    </>
  );
}

export default SignUp;
