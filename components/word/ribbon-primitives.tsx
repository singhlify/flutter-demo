"use client";

import { ChevronDown } from "lucide-react";

/** Vertical divider between ribbon groups */
export function RibbonDivider() {
  return <div className="w-px bg-word-divider mx-[6px] my-[4px] self-stretch" />;
}

/** A labeled group container with optional trailing divider */
export function RibbonGroup({
  label,
  children,
  showDivider = true,
}: {
  label: string;
  children: React.ReactNode;
  showDivider?: boolean;
}) {
  return (
    <div className="flex items-stretch">
      <div className="flex flex-col pt-[3px] pb-0 px-[4px]">
        <div className="flex items-start gap-[2px] flex-1">{children}</div>
        <span className="text-[10px] text-word-group-label text-center mt-auto pb-[2px] leading-[12px]">
          {label}
        </span>
      </div>
      {showDivider && <RibbonDivider />}
    </div>
  );
}

/** Small icon button (used in Font, Paragraph groups) */
export function SmallButton({
  icon,
  title,
  hasDropdown = false,
  isActive = false,
  underlineColor,
  children,
}: {
  icon?: React.ReactNode;
  title: string;
  hasDropdown?: boolean;
  isActive?: boolean;
  underlineColor?: string;
  children?: React.ReactNode;
}) {
  return (
    <button
      title={title}
      className={`
        relative flex items-center justify-center min-w-[22px] h-[22px] px-[2px]
        hover:bg-word-icon-hover rounded-[2px] transition-colors
        ${isActive ? "bg-[#D0D0D0]" : ""}
      `}
    >
      <div className="flex items-center gap-0">
        {icon || children}
        {hasDropdown && (
          <ChevronDown size={7} className="text-[#888] ml-[1px]" strokeWidth={2.5} />
        )}
      </div>
      {underlineColor && (
        <div
          className="absolute bottom-[1px] left-[3px] right-[3px] h-[2.5px] rounded-[1px]"
          style={{ backgroundColor: underlineColor }}
        />
      )}
    </button>
  );
}

/** Large button with icon on top and label below (like Paste, Styles, etc.) */
export function LargeButton({
  icon,
  label,
  hasDropdown = false,
  iconColor,
}: {
  icon: React.ReactNode;
  label: string;
  hasDropdown?: boolean;
  iconColor?: string;
}) {
  return (
    <button className="flex flex-col items-center justify-start px-[6px] pt-[4px] hover:bg-word-icon-hover rounded-[2px] transition-colors min-w-[48px]">
      <div className="flex items-center justify-center h-[32px]" style={{ color: iconColor }}>
        {icon}
      </div>
      <div className="flex items-center gap-0 mt-[1px]">
        <span className="text-[10px] text-word-icon leading-[12px] whitespace-nowrap">
          {label}
        </span>
        {hasDropdown && (
          <ChevronDown size={8} className="text-[#888] ml-[1px]" strokeWidth={2} />
        )}
      </div>
    </button>
  );
}

/** Dropdown-like field (font family, font size) */
export function DropdownField({
  value,
  width,
}: {
  value: string;
  width: number;
}) {
  return (
    <div
      className="flex items-center h-[22px] border border-word-dropdown-border rounded-[2px] bg-white px-[4px] cursor-pointer hover:border-[#888]"
      style={{ width }}
    >
      <span className="flex-1 text-[11px] text-word-icon truncate">{value}</span>
      <ChevronDown size={10} className="text-[#888] ml-1 shrink-0" strokeWidth={2} />
    </div>
  );
}
