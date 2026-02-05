"use client";

import { Palette, PaintBucket, Paintbrush, Layers, FileText } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function DesignTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Document Formatting">
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Themes" hasDropdown />
        <LargeButton icon={<Palette size={20} strokeWidth={1.2} className="text-word-icon" />} label="Colors" hasDropdown />
        <LargeButton icon={<Paintbrush size={20} strokeWidth={1.2} className="text-word-icon" />} label="Fonts" hasDropdown />
        <LargeButton icon={<Layers size={20} strokeWidth={1.2} className="text-word-icon" />} label="Effects" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Page Background" showDivider={false}>
        <LargeButton icon={<PaintBucket size={20} strokeWidth={1.2} className="text-word-icon" />} label="Watermark" hasDropdown />
        <LargeButton icon={<PaintBucket size={20} strokeWidth={1.2} className="text-word-icon" />} label="Page Color" hasDropdown />
        <LargeButton icon={<Layers size={20} strokeWidth={1.2} className="text-word-icon" />} label="Page Borders" />
      </RibbonGroup>
    </div>
  );
}
