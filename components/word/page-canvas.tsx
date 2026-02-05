"use client";

import { useRef } from "react";
import { HorizontalRuler, VerticalRuler } from "./ruler";

export function PageCanvas() {
  const editorRef = useRef<HTMLDivElement>(null);

  return (
    <div className="flex flex-col flex-1 overflow-hidden">
      {/* Horizontal ruler */}
      <HorizontalRuler />

      {/* Canvas area with vertical ruler */}
      <div className="flex flex-1 overflow-hidden">
        {/* Vertical ruler */}
        <VerticalRuler />

        {/* Scrollable document area */}
        <div className="flex-1 overflow-auto bg-word-canvas-bg">
          <div className="flex justify-center py-[10px] min-h-full">
            {/* Page */}
            <div
              className="bg-word-page shadow-[0_0_4px_rgba(0,0,0,0.15)] relative"
              style={{
                width: 816, // 8.5 inches at 96dpi
                minHeight: 1056, // 11 inches at 96dpi
              }}
            >
              {/* Content area with margins */}
              <div
                ref={editorRef}
                className="absolute outline-none text-[12pt] leading-normal"
                contentEditable
                suppressContentEditableWarning
                style={{
                  top: 96, // 1 inch top margin
                  left: 96, // 1 inch left margin
                  right: 96, // 1 inch right margin
                  bottom: 96, // 1 inch bottom margin
                  fontFamily: "'Aptos', 'Calibri', 'Arial', sans-serif",
                  fontSize: "12pt",
                  lineHeight: 1.15,
                  color: "#000000",
                  caretColor: "#000000",
                }}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
