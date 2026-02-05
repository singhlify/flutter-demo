"use client";

import { Mail, Users, FileText, Send, Merge } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function MailingsTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Create">
        <LargeButton icon={<Mail size={20} strokeWidth={1.2} className="text-word-icon" />} label="Envelopes" />
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Labels" />
      </RibbonGroup>
      <RibbonGroup label="Start Mail Merge">
        <LargeButton icon={<Merge size={20} strokeWidth={1.2} className="text-word-icon" />} label="Start Mail Merge" hasDropdown />
        <LargeButton icon={<Users size={20} strokeWidth={1.2} className="text-word-icon" />} label="Select Recipients" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Finish" showDivider={false}>
        <LargeButton icon={<Send size={20} strokeWidth={1.2} className="text-word-icon" />} label="Finish & Merge" hasDropdown />
      </RibbonGroup>
    </div>
  );
}
