import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import App from "./App.tsx";
import { BrowserRouter, Routes, Route } from "react-router";
import SignUp from "./pages/account/auth/SignUp.tsx";
import Navbar from "./components/navigation/Navbar.tsx";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <BrowserRouter>
      <Navbar />
      <Routes>
        <Route path="/" element={<App />}></Route>
        {/* <Route element={<AuthLayout />}> */}
        {/* <Route path="login" element={<Login />} /> */}
        <Route path="signup" element={<SignUp />} />
        {/* </Route> */}
      </Routes>
    </BrowserRouter>
  </StrictMode>
);
