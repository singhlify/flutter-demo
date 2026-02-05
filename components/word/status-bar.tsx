"use client";

import { useState } from "react";
import {
  BookOpen,
  FileText,
  Globe,
  Minus,
  Plus,
  Eye,
  PanelBottom,
  Maximize2,
} from "lucide-react";

export function StatusBar() {
  const [zoom, setZoom] = useState(100);

  return (
    <div className="flex items-center h-[22px] bg-word-status-bg text-word-status-text text-[11px] px-[10px] shrink-0 no-select">
      {/* Left section */}
      <div className="flex items-center gap-[16px]">
        <StatusItem>Page 1 of 1</StatusItem>
        <StatusItem>0 words</StatusItem>
        <StatusItem>English (Canada)</StatusItem>
        <StatusItem>Text Predictions: On</StatusItem>
        <StatusItem>
          <span className="flex items-center gap-1">
            Accessibility: Good to go
          </span>
        </StatusItem>
      </div>

      {/* Spacer */}
      <div className="flex-1" />

      {/* Right section */}
      <div className="flex items-center gap-[4px]">
        {/* Focus mode */}
        <StatusButton title="Focus">
          <Eye size={13} strokeWidth={1.5} />
        </StatusButton>

        {/* View modes */}
        <StatusButton title="Read Mode">
          <BookOpen size={13} strokeWidth={1.5} />
        </StatusButton>
        <StatusButton title="Print Layout" isActive>
          <FileText size={13} strokeWidth={1.5} />
        </StatusButton>
        <StatusButton title="Web Layout">
          <Globe size={13} strokeWidth={1.5} />
        </StatusButton>

        {/* Zoom controls */}
        <div className="flex items-center gap-[4px] ml-[8px]">
          <StatusButton
            title="Zoom Out"
            onClick={() => setZoom((z) => Math.max(10, z - 10))}
          >
            <Minus size={12} strokeWidth={1.5} />
          </StatusButton>

          {/* Zoom slider */}
          <div className="relative w-[80px] h-[12px] flex items-center">
            <div className="absolute w-full h-[1px] bg-white/40" />
            <div
              className="absolute w-[8px] h-[8px] bg-white rounded-sm border border-white/60 cursor-pointer"
              style={{ left: `${((zoom - 10) / 490) * 100}%` }}
            />
          </div>

          <StatusButton
            title="Zoom In"
            onClick={() => setZoom((z) => Math.min(500, z + 10))}
          >
            <Plus size={12} strokeWidth={1.5} />
          </StatusButton>

          <span className="text-[11px] ml-[4px] min-w-[32px] text-right">
            {zoom}%
          </span>
        </div>
      </div>
    </div>
  );
}

function StatusItem({ children }: { children: React.ReactNode }) {
  return (
    <span className="hover:bg-[#1E4578] px-[4px] py-[1px] cursor-pointer transition-colors">
      {children}
    </span>
  );
}

function StatusButton({
  children,
  title,
  isActive = false,
  onClick,
}: {
  children: React.ReactNode;
  title: string;
  isActive?: boolean;
  onClick?: () => void;
}) {
  return (
    <button
      title={title}
      onClick={onClick}
      className={`flex items-center justify-center w-[20px] h-[18px] rounded-sm transition-colors ${
        isActive ? "bg-[#1E4578]" : "hover:bg-[#1E4578]"
      }`}
    >
      {children}
    </button>
  );
}
