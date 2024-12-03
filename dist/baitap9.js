"use strict";
function getRanDomColour() {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgb(${r}, ${g}, ${b})`;
}
for (let i = 1; i <= 10; i++) {
    console.log('%cMàu sắc đã được thay đổi', `color: ${getRanDomColour()}`);
}
