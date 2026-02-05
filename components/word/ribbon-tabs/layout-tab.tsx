"use client";

import {
  FileText,
  Columns3,
  Minus,
  Pilcrow,
  IndentIncrease,
  AlignVerticalSpaceAround,
  ArrowDownUp,
  MoveHorizontal,
  RotateCw,
} from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function LayoutTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Page Setup">
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Margins" hasDropdown />
        <LargeButton icon={<RotateCw size={20} strokeWidth={1.2} className="text-word-icon" />} label="Orientation" hasDropdown />
        <LargeButton icon={<MoveHorizontal size={20} strokeWidth={1.2} className="text-word-icon" />} label="Size" hasDropdown />
        <LargeButton icon={<Columns3 size={20} strokeWidth={1.2} className="text-word-icon" />} label="Columns" hasDropdown />
        <LargeButton icon={<Minus size={20} strokeWidth={1.2} className="text-word-icon" />} label="Breaks" hasDropdown />
        <LargeButton icon={<Pilcrow size={20} strokeWidth={1.2} className="text-word-icon" />} label="Line Numbers" hasDropdown />
      </RibbonGroup>
      <RibbonGroup label="Paragraph">
        <LargeButton icon={<IndentIncrease size={20} strokeWidth={1.2} className="text-word-icon" />} label="Indent" />
        <LargeButton icon={<AlignVerticalSpaceAround size={20} strokeWidth={1.2} className="text-word-icon" />} label="Spacing" />
      </RibbonGroup>
      <RibbonGroup label="Arrange" showDivider={false}>
        <LargeButton icon={<ArrowDownUp size={20} strokeWidth={1.2} className="text-word-icon" />} label="Position" hasDropdown />
      </RibbonGroup>
    </div>
  );
}
