"use client";

import { BookOpen, FileText, Table2, NotebookPen, Bookmark, Quote } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function ReferencesTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Table of Contents">
        <LargeButton icon={<BookOpen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Table of Contents" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Footnotes">
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Insert Footnote" />
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Insert Endnote" />
      </RibbonGroup>
      <RibbonGroup label="Citations & Bibliography">
        <LargeButton icon={<Quote size={20} strokeWidth={1.2} className="text-word-icon" />} label="Insert Citation" hasDropdown />
        <LargeButton icon={<NotebookPen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Bibliography" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Captions">
        <LargeButton icon={<Bookmark size={20} strokeWidth={1.2} className="text-word-icon" />} label="Insert Caption" />
        <LargeButton icon={<Table2 size={20} strokeWidth={1.2} className="text-word-icon" />} label="Table of Figures" />
      </RibbonGroup>
      <RibbonGroup label="Index" showDivider={false}>
        <LargeButton icon={<BookOpen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Mark Entry" />
        <LargeButton icon={<BookOpen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Insert Index" />
      </RibbonGroup>
    </div>
  );
}
