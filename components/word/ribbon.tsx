"use client";

import { useState } from "react";
import { ChevronDown } from "lucide-react";
import { HomeTab } from "./ribbon-tabs/home-tab";
import { InsertTab } from "./ribbon-tabs/insert-tab";
import { DrawTab } from "./ribbon-tabs/draw-tab";
import { DesignTab } from "./ribbon-tabs/design-tab";
import { LayoutTab } from "./ribbon-tabs/layout-tab";
import { ReferencesTab } from "./ribbon-tabs/references-tab";
import { MailingsTab } from "./ribbon-tabs/mailings-tab";
import { ReviewTab } from "./ribbon-tabs/review-tab";
import { ViewTab } from "./ribbon-tabs/view-tab";
import { HelpTab } from "./ribbon-tabs/help-tab";

const TABS = [
  { id: "file", label: "File", isFile: true },
  { id: "home", label: "Home" },
  { id: "insert", label: "Insert" },
  { id: "draw", label: "Draw" },
  { id: "design", label: "Design" },
  { id: "layout", label: "Layout" },
  { id: "references", label: "References" },
  { id: "mailings", label: "Mailings" },
  { id: "review", label: "Review" },
  { id: "view", label: "View" },
  { id: "help", label: "Help" },
  { id: "ezcf", label: "Easy Code Formatter" },
  { id: "acrobat", label: "Acrobat" },
] as const;

export function Ribbon() {
  const [activeTab, setActiveTab] = useState("home");

  return (
    <div className="flex flex-col shrink-0 no-select">
      {/* Tab bar */}
      <div className="flex items-end h-[32px] bg-word-ribbon-bg border-b border-word-ribbon-border px-1">
        {TABS.map((tab) => (
          <button
            key={tab.id}
            onClick={() => {
              if (!tab.isFile) setActiveTab(tab.id);
            }}
            className={`
              relative px-[14px] h-[28px] text-[12px] transition-colors
              ${
                tab.isFile
                  ? "text-white bg-word-blue hover:bg-word-blue-hover rounded-t-sm font-normal"
                  : activeTab === tab.id
                  ? "bg-word-tab-active text-word-icon border-t-[3px] border-t-word-blue border-x border-x-word-ribbon-border border-b-0 font-semibold"
                  : "text-[#444444] hover:bg-word-tab-hover"
              }
              flex items-center justify-center
            `}
          >
            {tab.label}
          </button>
        ))}

        {/* Right side: Comments, Editing, Share */}
        <div className="flex-1" />
        <div className="flex items-center gap-0 mb-[2px]">
          {/* Collapse ribbon button */}
          <button
            className="flex items-center justify-center w-[24px] h-[24px] hover:bg-word-tab-hover rounded-sm"
            title="Ribbon Display Options"
          >
            <ChevronDown size={14} className="text-[#666]" />
          </button>
        </div>
      </div>

      {/* Ribbon content */}
      <div className="h-[94px] bg-word-tab-active border-b border-word-ribbon-border flex items-stretch overflow-hidden">
        <RibbonContent activeTab={activeTab} />
      </div>
    </div>
  );
}

function RibbonContent({ activeTab }: { activeTab: string }) {
  switch (activeTab) {
    case "home":
      return <HomeTab />;
    case "insert":
      return <InsertTab />;
    case "draw":
      return <DrawTab />;
    case "design":
      return <DesignTab />;
    case "layout":
      return <LayoutTab />;
    case "references":
      return <ReferencesTab />;
    case "mailings":
      return <MailingsTab />;
    case "review":
      return <ReviewTab />;
    case "view":
      return <ViewTab />;
    case "help":
      return <HelpTab />;
    default:
      return <HomeTab />;
  }
}
