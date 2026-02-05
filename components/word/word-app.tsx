"use client";

import { TitleBar } from "./title-bar";
import { Ribbon } from "./ribbon";
import { PageCanvas } from "./page-canvas";
import { StatusBar } from "./status-bar";

export function WordApp() {
  return (
    <div className="flex flex-col h-screen w-screen overflow-hidden">
      <TitleBar />
      <Ribbon />
      <PageCanvas />
      <StatusBar />
    </div>
  );
}
