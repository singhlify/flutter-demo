"use client";

import {
  Bold,
  Italic,
  Underline,
  Strikethrough,
  Subscript,
  Superscript,
  Paintbrush,
  Scissors,
  Copy,
  ClipboardPaste,
  List,
  ListOrdered,
  AlignLeft,
  AlignCenter,
  AlignRight,
  AlignJustify,
  IndentDecrease,
  IndentIncrease,
  ArrowDownUp,
  Pilcrow,
  TableProperties,
  PaintBucket,
  Sparkles,
  Type,
  ChevronsUpDown,
  Pen,
  Mic,
  Shield,
  Puzzle,
  SpellCheck,
  Bot,
  FileText,
} from "lucide-react";
import {
  RibbonGroup,
  SmallButton,
  LargeButton,
  DropdownField,
} from "../ribbon-primitives";

export function HomeTab() {
  return (
    <div className="flex items-stretch h-full px-[2px]">
      {/* ---- CLIPBOARD ---- */}
      <RibbonGroup label="Clipboard">
        <div className="flex items-start gap-[2px]">
          {/* Paste large button */}
          <LargeButton
            icon={<ClipboardPaste size={24} strokeWidth={1.2} className="text-[#D4A843]" />}
            label="Paste"
            hasDropdown
          />
          {/* Stacked small buttons */}
          <div className="flex flex-col gap-[1px] pt-[2px]">
            <SmallButton icon={<Scissors size={14} strokeWidth={1.5} className="text-word-icon" />} title="Cut" />
            <SmallButton icon={<Copy size={14} strokeWidth={1.5} className="text-word-icon" />} title="Copy" />
            <SmallButton icon={<Paintbrush size={14} strokeWidth={1.5} className="text-word-icon" />} title="Format Painter" />
          </div>
        </div>
      </RibbonGroup>

      {/* ---- FONT ---- */}
      <RibbonGroup label="Font">
        <div className="flex flex-col gap-[2px]">
          {/* Row 1: font family + size */}
          <div className="flex items-center gap-[4px]">
            <DropdownField value="Aptos (Body)" width={130} />
            <DropdownField value="12" width={42} />
          </div>
          {/* Row 2: B I U strikethrough subscript superscript text-effects */}
          <div className="flex items-center gap-0">
            <SmallButton title="Bold">
              <span className="text-[13px] font-bold text-word-icon">B</span>
            </SmallButton>
            <SmallButton title="Italic">
              <span className="text-[13px] italic font-serif text-word-icon">I</span>
            </SmallButton>
            <SmallButton title="Underline" hasDropdown>
              <span className="text-[13px] underline text-word-icon">U</span>
            </SmallButton>
            <SmallButton icon={<Strikethrough size={14} strokeWidth={1.5} className="text-word-icon" />} title="Strikethrough" />
            <SmallButton title="Subscript">
              <span className="text-[11px] text-word-icon">x<sub className="text-[8px]">2</sub></span>
            </SmallButton>
            <SmallButton title="Superscript">
              <span className="text-[11px] text-word-icon">x<sup className="text-[8px]">2</sup></span>
            </SmallButton>
            <SmallButton icon={<Sparkles size={14} strokeWidth={1.5} className="text-[#2B579A]" />} title="Text Effects" />
          </div>
          {/* Row 3: font color, highlight, change case, clear formatting */}
          <div className="flex items-center gap-0">
            <SmallButton title="Font Color" hasDropdown underlineColor="#FF0000">
              <span className="text-[14px] font-bold text-word-icon">A</span>
            </SmallButton>
            <SmallButton title="Text Highlight Color" hasDropdown underlineColor="#FFFF00">
              <PaintBucket size={14} strokeWidth={1.5} className="text-word-icon" />
            </SmallButton>
            <SmallButton title="Change Case" hasDropdown>
              <span className="text-[10px] text-word-icon font-medium">Aa</span>
            </SmallButton>
            <SmallButton title="Clear All Formatting">
              <Type size={13} strokeWidth={1.5} className="text-[#C44E52]" />
            </SmallButton>
            <SmallButton title="Clear All Formatting">
              <Type size={11} strokeWidth={1.5} className="text-word-icon" />
            </SmallButton>
          </div>
        </div>
      </RibbonGroup>

      {/* ---- PARAGRAPH ---- */}
      <RibbonGroup label="Paragraph">
        <div className="flex flex-col gap-[2px]">
          {/* Row 1: bullets, numbering, multilevel, indent */}
          <div className="flex items-center gap-0">
            <SmallButton icon={<List size={14} strokeWidth={1.5} className="text-word-icon" />} title="Bullets" hasDropdown />
            <SmallButton icon={<ListOrdered size={14} strokeWidth={1.5} className="text-word-icon" />} title="Numbering" hasDropdown />
            <SmallButton icon={<List size={14} strokeWidth={1.5} className="text-word-icon" />} title="Multilevel List" hasDropdown />
            <div className="w-[4px]" />
            <SmallButton icon={<IndentDecrease size={14} strokeWidth={1.5} className="text-word-icon" />} title="Decrease Indent" />
            <SmallButton icon={<IndentIncrease size={14} strokeWidth={1.5} className="text-word-icon" />} title="Increase Indent" />
          </div>
          {/* Row 2: alignment + line spacing */}
          <div className="flex items-center gap-0">
            <SmallButton icon={<AlignLeft size={14} strokeWidth={1.5} className="text-word-icon" />} title="Align Left" />
            <SmallButton icon={<AlignCenter size={14} strokeWidth={1.5} className="text-word-icon" />} title="Center" />
            <SmallButton icon={<AlignRight size={14} strokeWidth={1.5} className="text-word-icon" />} title="Align Right" />
            <SmallButton icon={<AlignJustify size={14} strokeWidth={1.5} className="text-word-icon" />} title="Justify" />
            <SmallButton icon={<ChevronsUpDown size={14} strokeWidth={1.5} className="text-word-icon" />} title="Line Spacing" hasDropdown />
          </div>
          {/* Row 3: shading, borders, sort, show/hide */}
          <div className="flex items-center gap-0">
            <SmallButton icon={<PaintBucket size={14} strokeWidth={1.5} className="text-word-icon" />} title="Shading" hasDropdown />
            <SmallButton icon={<TableProperties size={14} strokeWidth={1.5} className="text-word-icon" />} title="Borders" hasDropdown />
            <SmallButton icon={<ArrowDownUp size={14} strokeWidth={1.5} className="text-word-icon" />} title="Sort" />
            <SmallButton icon={<Pilcrow size={14} strokeWidth={1.5} className="text-word-icon" />} title="Show/Hide" />
          </div>
        </div>
      </RibbonGroup>

      {/* ---- STYLES ---- */}
      <RibbonGroup label="Styles">
        <LargeButton
          icon={
            <span className="text-[28px] font-normal text-[#2B579A] leading-none" style={{ fontFamily: "Georgia, serif" }}>
              A
            </span>
          }
          label="Styles"
          hasDropdown
          iconColor="#2B579A"
        />
      </RibbonGroup>

      {/* ---- EDITING ---- */}
      <RibbonGroup label="">
        <LargeButton
          icon={<Pen size={20} strokeWidth={1.2} className="text-word-icon" />}
          label="Editing"
          hasDropdown
        />
      </RibbonGroup>

      {/* ---- CREATE A PDF ---- */}
      <RibbonGroup label="Adobe Acrobat">
        <LargeButton
          icon={<FileText size={20} strokeWidth={1.2} className="text-red-600" />}
          label="Create a PDF"
        />
      </RibbonGroup>

      {/* ---- DICTATE ---- */}
      <RibbonGroup label="Voice">
        <LargeButton
          icon={<Mic size={20} strokeWidth={1.2} className="text-[#2B579A]" />}
          label="Dictate"
          hasDropdown
        />
      </RibbonGroup>

      {/* ---- SENSITIVITY ---- */}
      <RibbonGroup label="Sensitivity">
        <LargeButton
          icon={<Shield size={20} strokeWidth={1.2} className="text-word-icon" />}
          label="Sensitivity"
          hasDropdown
        />
      </RibbonGroup>

      {/* ---- ADD-INS ---- */}
      <RibbonGroup label="Add-ins">
        <LargeButton
          icon={<Puzzle size={20} strokeWidth={1.2} className="text-[#217346]" />}
          label="Add-ins"
          hasDropdown
        />
      </RibbonGroup>

      {/* ---- EDITOR ---- */}
      <RibbonGroup label="" showDivider={false}>
        <div className="flex items-start gap-[2px]">
          <LargeButton
            icon={<SpellCheck size={20} strokeWidth={1.2} className="text-word-icon" />}
            label="Editor"
          />
          <LargeButton
            icon={<Bot size={20} strokeWidth={1.2} className="text-[#7B83EB]" />}
            label="Copilot"
          />
        </div>
      </RibbonGroup>
    </div>
  );
}
