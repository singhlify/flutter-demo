"use client";

import {
  Save,
  Undo2,
  Redo2,
  ChevronDown,
  Search,
  Minus,
  Square,
  X,
  MessageSquare,
  Pen,
  Share2,
} from "lucide-react";

export function TitleBar() {
  return (
    <div className="flex items-center h-[30px] bg-word-blue text-white text-[12px] no-select shrink-0">
      {/* Left: Word icon + AutoSave + Quick Access */}
      <div className="flex items-center gap-0 h-full">
        {/* Word icon */}
        <div className="flex items-center justify-center w-[46px] h-full">
          <WordIcon />
        </div>

        {/* AutoSave toggle */}
        <div className="flex items-center gap-1.5 px-2 h-full hover:bg-word-blue-hover cursor-pointer">
          <span className="text-[11px] font-normal">AutoSave</span>
          <AutoSaveToggle />
        </div>

        {/* Quick access: Save, Undo, Redo */}
        <QATButton title="Save">
          <Save size={14} strokeWidth={1.5} />
        </QATButton>
        <QATButton title="Undo">
          <Undo2 size={14} strokeWidth={1.5} />
        </QATButton>
        <QATButton title="Redo">
          <Redo2 size={14} strokeWidth={1.5} />
        </QATButton>
        <QATButton title="Customize Quick Access Toolbar">
          <ChevronDown size={10} strokeWidth={2} />
        </QATButton>
      </div>

      {/* Center: Document title */}
      <div className="flex-1 flex items-center justify-center h-full">
        <span className="text-[12px] font-normal tracking-normal">
          Document1 &nbsp;-&nbsp; Word
        </span>
      </div>

      {/* Right: Search + user + window controls */}
      <div className="flex items-center h-full">
        {/* Search */}
        <div className="flex items-center gap-1.5 bg-[#1E4578] rounded-sm px-2.5 py-1 mr-2 cursor-pointer hover:bg-[#2A5490]">
          <Search size={12} strokeWidth={2} />
          <span className="text-[11px] opacity-90">Search</span>
        </div>

        {/* Right-side buttons */}
        <QATButton title="Comments">
          <MessageSquare size={14} strokeWidth={1.5} />
        </QATButton>

        {/* Editing button */}
        <div className="flex items-center gap-1 px-2 h-full hover:bg-word-blue-hover cursor-pointer">
          <Pen size={12} strokeWidth={1.5} />
          <span className="text-[11px]">Editing</span>
          <ChevronDown size={8} strokeWidth={2} />
        </div>

        {/* Share button */}
        <div className="flex items-center gap-1 bg-[#185ABD] hover:bg-[#1A63CC] rounded-sm px-3 py-1 mx-1 cursor-pointer">
          <Share2 size={12} strokeWidth={1.5} />
          <span className="text-[11px] font-semibold">Share</span>
        </div>

        {/* User avatar */}
        <div className="flex items-center justify-center w-[30px] h-full cursor-pointer hover:bg-word-blue-hover">
          <div className="w-[22px] h-[22px] rounded-full bg-[#7B83EB] flex items-center justify-center text-[10px] font-semibold">
            M
          </div>
        </div>

        {/* Window controls */}
        <WindowButton title="Minimize">
          <Minus size={14} strokeWidth={1.5} />
        </WindowButton>
        <WindowButton title="Maximize">
          <Square size={10} strokeWidth={1.5} />
        </WindowButton>
        <WindowButton title="Close" isClose>
          <X size={14} strokeWidth={1.5} />
        </WindowButton>
      </div>
    </div>
  );
}

function QATButton({
  children,
  title,
}: {
  children: React.ReactNode;
  title: string;
}) {
  return (
    <button
      title={title}
      className="flex items-center justify-center w-[28px] h-full hover:bg-word-blue-hover transition-colors"
    >
      {children}
    </button>
  );
}

function WindowButton({
  children,
  title,
  isClose = false,
}: {
  children: React.ReactNode;
  title: string;
  isClose?: boolean;
}) {
  return (
    <button
      title={title}
      className={`flex items-center justify-center w-[46px] h-full transition-colors ${
        isClose ? "hover:bg-red-600" : "hover:bg-word-blue-hover"
      }`}
    >
      {children}
    </button>
  );
}

function WordIcon() {
  return (
    <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
      <rect width="18" height="18" rx="2" fill="#2B579A" />
      <text
        x="9"
        y="13.5"
        textAnchor="middle"
        fill="white"
        fontSize="12"
        fontWeight="700"
        fontFamily="Segoe UI, system-ui, sans-serif"
      >
        W
      </text>
    </svg>
  );
}

function AutoSaveToggle() {
  return (
    <div className="w-[28px] h-[14px] bg-[#1E4578] rounded-full relative cursor-pointer">
      <div className="absolute left-[2px] top-[2px] w-[10px] h-[10px] bg-white/50 rounded-full" />
    </div>
  );
}
