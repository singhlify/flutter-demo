"use client";

import { SpellCheck, BookOpen, MessageSquare, GitCompare, Shield, Languages, Pen } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function ReviewTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Proofing">
        <LargeButton icon={<SpellCheck size={20} strokeWidth={1.2} className="text-word-icon" />} label="Spelling & Grammar" />
        <LargeButton icon={<BookOpen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Thesaurus" />
      </RibbonGroup>
      <RibbonGroup label="Language">
        <LargeButton icon={<Languages size={20} strokeWidth={1.2} className="text-word-icon" />} label="Translate" hasDropdown />
        <LargeButton icon={<Languages size={20} strokeWidth={1.2} className="text-word-icon" />} label="Language" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Comments">
        <LargeButton icon={<MessageSquare size={20} strokeWidth={1.2} className="text-word-icon" />} label="New Comment" />
      </RibbonGroup>
      <RibbonGroup label="Tracking">
        <LargeButton icon={<GitCompare size={20} strokeWidth={1.2} className="text-word-icon" />} label="Track Changes" hasDropdown />
        <LargeButton icon={<Pen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Markup" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Protect" showDivider={false}>
        <LargeButton icon={<Shield size={20} strokeWidth={1.2} className="text-word-icon" />} label="Protect" hasDropdown />
      </RibbonGroup>
    </div>
  );
}
