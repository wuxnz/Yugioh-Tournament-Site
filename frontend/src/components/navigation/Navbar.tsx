import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Menu } from "lucide-react";
import { Card } from "@/components/ui/card";
// import ThemeToggle from "../ui/theme-toggle";
import { Button } from "../ui/button";
// import ShadcnKit from "../ui/icons/shadcn-kit";
import { nanoid } from "nanoid";
import ToggleDarkMode from "../settings/ToggleDarkMode";
import { useNavigate } from "react-router";
import { Link } from "react-router";

const Navbar = () => {
  const navigate = useNavigate();
  return (
    <Card className="bg-background flex-row items-center justify-between shadow border-b-2 px-4 rounded-none">
      <p className="text-primary font-bold text-2xl md:text-xl lg:text-2xl xl:text-2xl 2xl:text-3xl ">
        YGO Site
      </p>

      <ul className="hidden md:flex items-center gap-10 text-card-foreground">
        <li className="text-primary font-medium">
          <Link to="/">Home</Link>
        </li>
        <li>
          <Link to="#features">Features</Link>
        </li>
        <li>
          <Link to="#pricing">Pricing</Link>
        </li>
        <li>
          <Link to="#faqs">FAQs</Link>
        </li>
        <li>
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <span className="cursor-pointer">Pages</span>
            </DropdownMenuTrigger>

            <DropdownMenuContent align="start">
              {landings.map((page) => (
                <DropdownMenuItem key={page.id}>
                  <Link to={page.route}>{page.title}</Link>
                </DropdownMenuItem>
              ))}
            </DropdownMenuContent>
          </DropdownMenu>
        </li>
      </ul>

      <div className="flex items-center gap-3">
        <Button
          className="text-white hidden md:flex"
          onClick={() => {
            navigate("/signup");
          }}
        >
          Sign Up
        </Button>
        <Button className="text-white hidden md:flex">Get Started</Button>

        <div className="flex md:hidden mr-2 items-center gap-2">
          <DropdownMenu>
            <DropdownMenuContent align="start">
              {landings.map((page) => (
                <DropdownMenuItem key={page.id}>
                  <Link to={page.route}>{page.title}</Link>
                </DropdownMenuItem>
              ))}
            </DropdownMenuContent>
          </DropdownMenu>

          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button className="text-white" variant="outline" size="icon">
                <Menu className="h-5 w-5 rotate-0 scale-100" />
              </Button>
            </DropdownMenuTrigger>

            <DropdownMenuContent className="brightness-90" align="end">
              <DropdownMenuItem className="flex justify-center items-center">
                <Link to="/">Home</Link>
              </DropdownMenuItem>
              <DropdownMenuItem className="flex justify-center items-center">
                <Link to="#features">Features</Link>
              </DropdownMenuItem>
              <DropdownMenuItem className="flex justify-center items-center">
                <Link to="#pricing">Pricing</Link>
              </DropdownMenuItem>
              <DropdownMenuItem className="flex justify-center items-center">
                <Link to="#faqs">FAQs</Link>
              </DropdownMenuItem>
              <DropdownMenuItem className="flex justify-center items-center">
                <ToggleDarkMode /> {/* Add Dark Mode Toggle */}
              </DropdownMenuItem>
              <DropdownMenuItem>
                <Button
                  className="w-full text-sm text-white"
                  onClick={() => {
                    navigate("/signup");
                  }}
                >
                  Sign Up
                </Button>
              </DropdownMenuItem>
              <DropdownMenuItem>
                <Button className="w-full text-sm text-white">
                  Get Started
                </Button>
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>

        <div className="hidden md:block px-2">
          <ToggleDarkMode />
        </div>
      </div>
    </Card>
  );
};

const landings = [
  {
    id: nanoid(),
    title: "Landing 01",
    route: "/project-management",
  },
  {
    id: nanoid(),
    title: "Landing 02",
    route: "/crm-landing",
  },
  {
    id: nanoid(),
    title: "Landing 03",
    route: "/ai-content-landing",
  },
  {
    id: nanoid(),
    title: "Landing 04",
    route: "/new-intro-landing",
  },
  {
    id: nanoid(),
    title: "Landing 05",
    route: "/about-us-landing",
  },
  {
    id: nanoid(),
    title: "Landing 06",
    route: "/contact-us-landing",
  },
  {
    id: nanoid(),
    title: "Landing 07",
    route: "/faqs-landing",
  },
  {
    id: nanoid(),
    title: "Landing 08",
    route: "/pricing-landing",
  },
  {
    id: nanoid(),
    title: "Landing 09",
    route: "/career-landing",
  },
];

export default Navbar;
