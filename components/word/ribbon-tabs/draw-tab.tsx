"use client";

import { Pen, Eraser, MousePointer, Paintbrush, Palette } from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function DrawTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Tools">
        <LargeButton icon={<MousePointer size={20} strokeWidth={1.2} className="text-word-icon" />} label="Select" />
        <LargeButton icon={<Pen size={20} strokeWidth={1.2} className="text-word-icon" />} label="Draw" />
        <LargeButton icon={<Eraser size={20} strokeWidth={1.2} className="text-word-icon" />} label="Eraser" />
      </RibbonGroup>
      <RibbonGroup label="Pens" showDivider={false}>
        <LargeButton icon={<Paintbrush size={20} strokeWidth={1.2} className="text-[#333]" />} label="Pen 1" />
        <LargeButton icon={<Paintbrush size={20} strokeWidth={1.2} className="text-red-500" />} label="Pen 2" />
        <LargeButton icon={<Paintbrush size={20} strokeWidth={1.2} className="text-blue-500" />} label="Pen 3" />
        <LargeButton icon={<Palette size={20} strokeWidth={1.2} className="text-word-icon" />} label="Color" hasDropdown />
      </RibbonGroup>
    </div>
  );
}
