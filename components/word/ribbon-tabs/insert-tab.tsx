"use client";

import {
  FileText,
  Image,
  Table2,
  Shapes,
  BarChart3,
  Link,
  MessageSquare,
  Type,
  Bookmark,
  Film,
  Globe,
  Puzzle,
  Hash,
  Minus,
} from "lucide-react";
import { RibbonGroup, LargeButton } from "../ribbon-primitives";

export function InsertTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      <RibbonGroup label="Pages">
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Cover Page" hasDropdown />
        <LargeButton icon={<FileText size={20} strokeWidth={1.2} className="text-word-icon" />} label="Blank Page" />
        <LargeButton icon={<Minus size={20} strokeWidth={1.2} className="text-word-icon" />} label="Page Break" />
      </RibbonGroup>

      <RibbonGroup label="Tables">
        <LargeButton icon={<Table2 size={20} strokeWidth={1.2} className="text-word-icon" />} label="Table" hasDropdown />
      </RibbonGroup>

      <RibbonGroup label="Illustrations">
        <LargeButton icon={<Image size={20} strokeWidth={1.2} className="text-word-icon" />} label="Pictures" hasDropdown />
        <LargeButton icon={<Shapes size={20} strokeWidth={1.2} className="text-word-icon" />} label="Shapes" hasDropdown />
        <LargeButton icon={<Globe size={20} strokeWidth={1.2} className="text-word-icon" />} label="Icons" />
        <LargeButton icon={<Film size={20} strokeWidth={1.2} className="text-word-icon" />} label="3D Models" hasDropdown />
        <LargeButton icon={<BarChart3 size={20} strokeWidth={1.2} className="text-word-icon" />} label="Chart" />
      </RibbonGroup>

      <RibbonGroup label="Add-ins">
        <LargeButton icon={<Puzzle size={20} strokeWidth={1.2} className="text-[#217346]" />} label="Add-ins" hasDropdown />
      </RibbonGroup>

      <RibbonGroup label="Links">
        <LargeButton icon={<Link size={20} strokeWidth={1.2} className="text-word-icon" />} label="Link" hasDropdown />
        <LargeButton icon={<Bookmark size={20} strokeWidth={1.2} className="text-word-icon" />} label="Bookmark" />
      </RibbonGroup>

      <RibbonGroup label="Comments">
        <LargeButton icon={<MessageSquare size={20} strokeWidth={1.2} className="text-word-icon" />} label="Comment" />
      </RibbonGroup>

      <RibbonGroup label="Header & Footer">
        <LargeButton icon={<Type size={20} strokeWidth={1.2} className="text-word-icon" />} label="Header" hasDropdown />
        <LargeButton icon={<Type size={20} strokeWidth={1.2} className="text-word-icon" />} label="Footer" hasDropdown />
        <LargeButton icon={<Hash size={20} strokeWidth={1.2} className="text-word-icon" />} label="Page Number" hasDropdown />
      </RibbonGroup>

      <RibbonGroup label="Text" showDivider={false}>
        <LargeButton icon={<Type size={20} strokeWidth={1.2} className="text-word-icon" />} label="Text Box" hasDropdown />
        <LargeButton icon={<Type size={20} strokeWidth={1.2} className="text-[#2B579A]" />} label="WordArt" hasDropdown />
      </RibbonGroup>
    </div>
  );
}
