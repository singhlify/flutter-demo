"use client";

import { HelpCircle, MessageSquare, Info, Bug } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function HelpTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Help">
        <LargeButton icon={<HelpCircle size={20} strokeWidth={1.2} className="text-word-icon" />} label="Help" />
        <LargeButton icon={<MessageSquare size={20} strokeWidth={1.2} className="text-word-icon" />} label="Contact Support" />
        <LargeButton icon={<Bug size={20} strokeWidth={1.2} className="text-word-icon" />} label="Feedback" />
      </RibbonGroup>
      <RibbonGroup label="" showDivider={false}>
        <LargeButton icon={<Info size={20} strokeWidth={1.2} className="text-[#2B579A]" />} label="About Word" />
      </RibbonGroup>
    </div>
  );
}
