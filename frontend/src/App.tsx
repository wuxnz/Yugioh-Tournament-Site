import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import { Button } from "./components/ui/button";
// import ToggleDarkMode from "./components/settings/ToggleDarkMode";
// import Navbar from "./components/navigation/Navbar";

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="self-center flex-col justify-center items-center mt-auto mb-auto text-center">
      <div className="flex w-full gap-2 bg rounded shadow items-center justify-center mb-5">
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1 className="mb-4">Vite + React</h1>
      <div className="text-center space-y-4">
        <Button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </Button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
      {/* <Button onClick={() => {}} className="text-white">
        Nothing
      </Button> */}
      {/* <ToggleDarkMode /> */}
    </div>
  );
}

export default App;
