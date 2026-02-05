"use client";

import { useRef, useEffect } from "react";

const RULER_HEIGHT = 18;

export function HorizontalRuler() {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    const parent = canvas.parentElement;
    if (!parent) return;

    const dpr = window.devicePixelRatio || 1;
    const width = parent.clientWidth;
    const height = RULER_HEIGHT;

    canvas.width = width * dpr;
    canvas.height = height * dpr;
    canvas.style.width = `${width}px`;
    canvas.style.height = `${height}px`;

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    ctx.scale(dpr, dpr);

    // Background
    ctx.fillStyle = "#E8E8E8";
    ctx.fillRect(0, 0, width, height);

    // White margin area (simulating the page-aligned section)
    const pageLeft = Math.max(0, (width - 816) / 2); // 816px ~ 8.5 inches at 96dpi
    const pageRight = pageLeft + 816;

    // Draw white area for page region
    ctx.fillStyle = "#FFFFFF";
    ctx.fillRect(pageLeft, 0, 816, height);

    // Margin indicators (1 inch margins)
    const marginPx = 96; // 1 inch
    ctx.fillStyle = "#E0E0E0";
    ctx.fillRect(pageLeft, 0, marginPx, height);
    ctx.fillRect(pageRight - marginPx, 0, marginPx, height);

    // Ruler ticks
    ctx.fillStyle = "#999999";
    ctx.strokeStyle = "#999999";
    ctx.lineWidth = 0.5;
    ctx.font = "8px Segoe UI, system-ui, sans-serif";
    ctx.textAlign = "center";

    // Draw ticks centered on the page (0 at left margin, counting up)
    const origin = pageLeft + marginPx;
    const usableWidth = 816 - 2 * marginPx; // ~6.5 inches

    // Draw ticks every 1/8 inch (12px)
    const tickInterval = 12; // 1/8 inch at 96 dpi
    const totalTicks = Math.floor(usableWidth / tickInterval);

    for (let i = -Math.floor(marginPx / tickInterval); i <= totalTicks + Math.floor(marginPx / tickInterval); i++) {
      const x = origin + i * tickInterval;
      if (x < pageLeft || x > pageRight) continue;

      const inchNumber = Math.abs(i / 8);
      const isInch = i % 8 === 0;
      const isHalf = i % 4 === 0;
      const isQuarter = i % 2 === 0;

      if (isInch) {
        // Full inch - draw number and long tick
        ctx.beginPath();
        ctx.moveTo(x, height - 2);
        ctx.lineTo(x, height - 10);
        ctx.stroke();

        if (inchNumber > 0 && inchNumber <= 17) {
          ctx.fillText(String(Math.round(inchNumber)), x, height - 10);
        }
      } else if (isHalf) {
        ctx.beginPath();
        ctx.moveTo(x, height - 2);
        ctx.lineTo(x, height - 7);
        ctx.stroke();
      } else if (isQuarter) {
        ctx.beginPath();
        ctx.moveTo(x, height - 2);
        ctx.lineTo(x, height - 5);
        ctx.stroke();
      } else {
        ctx.beginPath();
        ctx.moveTo(x, height - 2);
        ctx.lineTo(x, height - 3.5);
        ctx.stroke();
      }
    }

    // Bottom border
    ctx.strokeStyle = "#C8C8C8";
    ctx.lineWidth = 1;
    ctx.beginPath();
    ctx.moveTo(0, height - 0.5);
    ctx.lineTo(width, height - 0.5);
    ctx.stroke();
  }, []);

  return (
    <div className="w-full bg-[#E8E8E8] shrink-0 no-select" style={{ height: RULER_HEIGHT }}>
      <canvas ref={canvasRef} className="block w-full" />
    </div>
  );
}

const VERTICAL_RULER_WIDTH = 18;

export function VerticalRuler() {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    const parent = canvas.parentElement;
    if (!parent) return;

    const dpr = window.devicePixelRatio || 1;
    const width = VERTICAL_RULER_WIDTH;
    const height = parent.clientHeight;

    canvas.width = width * dpr;
    canvas.height = height * dpr;
    canvas.style.width = `${width}px`;
    canvas.style.height = `${height}px`;

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    ctx.scale(dpr, dpr);

    // Background
    ctx.fillStyle = "#E8E8E8";
    ctx.fillRect(0, 0, width, height);

    // White area for page region
    const pageHeight = 1056; // 11 inches at 96dpi
    const pageTop = 10;
    const marginPx = 96;

    ctx.fillStyle = "#FFFFFF";
    ctx.fillRect(0, pageTop, width, pageHeight);

    // Margin indicators
    ctx.fillStyle = "#E0E0E0";
    ctx.fillRect(0, pageTop, width, marginPx);
    ctx.fillRect(0, pageTop + pageHeight - marginPx, width, marginPx);

    // Ticks
    ctx.fillStyle = "#999999";
    ctx.strokeStyle = "#999999";
    ctx.lineWidth = 0.5;
    ctx.font = "8px Segoe UI, system-ui, sans-serif";
    ctx.textAlign = "center";

    const origin = pageTop + marginPx;
    const usableHeight = pageHeight - 2 * marginPx;
    const tickInterval = 12;
    const totalTicks = Math.floor(usableHeight / tickInterval);

    for (let i = -Math.floor(marginPx / tickInterval); i <= totalTicks + Math.floor(marginPx / tickInterval); i++) {
      const y = origin + i * tickInterval;
      if (y < pageTop || y > pageTop + pageHeight) continue;

      const inchNumber = Math.abs(i / 8);
      const isInch = i % 8 === 0;
      const isHalf = i % 4 === 0;
      const isQuarter = i % 2 === 0;

      if (isInch) {
        ctx.beginPath();
        ctx.moveTo(width - 2, y);
        ctx.lineTo(width - 10, y);
        ctx.stroke();

        if (inchNumber > 0 && inchNumber <= 11) {
          ctx.save();
          ctx.translate(width - 12, y);
          ctx.rotate(-Math.PI / 2);
          ctx.fillText(String(Math.round(inchNumber)), 0, 0);
          ctx.restore();
        }
      } else if (isHalf) {
        ctx.beginPath();
        ctx.moveTo(width - 2, y);
        ctx.lineTo(width - 7, y);
        ctx.stroke();
      } else if (isQuarter) {
        ctx.beginPath();
        ctx.moveTo(width - 2, y);
        ctx.lineTo(width - 5, y);
        ctx.stroke();
      } else {
        ctx.beginPath();
        ctx.moveTo(width - 2, y);
        ctx.lineTo(width - 3.5, y);
        ctx.stroke();
      }
    }

    // Right border
    ctx.strokeStyle = "#C8C8C8";
    ctx.lineWidth = 1;
    ctx.beginPath();
    ctx.moveTo(width - 0.5, 0);
    ctx.lineTo(width - 0.5, height);
    ctx.stroke();
  }, []);

  return (
    <div
      className="bg-[#E8E8E8] shrink-0 no-select h-full"
      style={{ width: VERTICAL_RULER_WIDTH }}
    >
      <canvas ref={canvasRef} className="block h-full" />
    </div>
  );
}
