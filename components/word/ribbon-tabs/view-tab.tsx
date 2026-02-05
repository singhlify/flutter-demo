"use client";

import { FileText, Eye, Ruler, Columns3, ZoomIn, Maximize, PanelLeft, AppWindow } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function ViewTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Views">
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Read Mode" />
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-[#2B579A]" />} label="Print Layout" />
        <LargeButton icon={<Eye size={20} strokeWidth={1.2} className="text-word-icon" />} label="Web Layout" />
      </RibbonGroup>
      <RibbonGroup label="Show">
        <LargeButton icon={<Ruler size={20} strokeWidth={1.2} className="text-word-icon" />} label="Ruler" />
        <LargeButton icon={<Columns3 size={20} strokeWidth={1.2} className="text-word-icon" />} label="Gridlines" />
        <LargeButton icon={<PanelLeft size={20} strokeWidth={1.2} className="text-word-icon" />} label="Navigation Pane" />
      </RibbonGroup>
      <RibbonGroup label="Zoom">
        <LargeButton icon={<ZoomIn size={20} strokeWidth={1.2} className="text-word-icon" />} label="Zoom" />
        <LargeButton icon={<Maximize size={20} strokeWidth={1.2} className="text-word-icon" />} label="One Page" />
      </RibbonGroup>
      <RibbonGroup label="Window" showDivider={false}>
        <LargeButton icon={<AppWindow size={20} strokeWidth={1.2} className="text-word-icon" />} label="New Window" />
        <LargeButton icon={<Columns3 size={20} strokeWidth={1.2} className="text-word-icon" />} label="Arrange All" />
      </RibbonGroup>
    </div>
  );
}
