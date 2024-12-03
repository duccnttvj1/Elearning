"use strict";
let a = prompt("Hãy nhập vào ngày sinh");
let b = prompt("Hãy nhập vào tháng sinh");
let date = Number(a);
let month = Number(b);
switch (month) {
    case 1:
        if (date >= 1 && date <= 19) {
            alert("Bạn thuộc cung Ma Kết");
        }
        else if (date >= 20 && date <= 31) {
            alert("Bạn thuộc cung Bảo Bình");
        }
        break;
    case 2:
        if (date >= 1 && date <= 18) {
            alert("Bạn thuộc cung Bảo Bình");
        }
        else if (date >= 19 && date <= 29) {
            alert("Bạn thuộc cung Song Ngư");
        }
        break;
    case 3:
        if (date >= 1 && date <= 20) {
            alert("Bạn thuộc cung Song Ngư");
        }
        else if (date >= 21 && date <= 31) {
            alert("Bạn thuộc cung Bạch Dương");
        }
        break;
    case 4:
        if (date >= 1 && date <= 19) {
            alert("Bạn thuộc cung Bạch Dương");
        }
        else if (date >= 20 && date <= 30) {
            alert("Bạn thuộc cung Kim Ngưu");
        }
        break;
    case 5:
        if (date >= 1 && date <= 20) {
            alert("Bạn thuộc cung Kim Ngưu");
        }
        else if (date >= 21 && date <= 31) {
            alert("Bạn thuộc cung Song Tử");
        }
        break;
    case 6:
        if (date >= 1 && date <= 21) {
            alert("Bạn thuộc cung Song Tử");
        }
        else if (date >= 22 && date <= 30) {
            alert("Bạn thuộc cung Cự Giải");
        }
        break;
    case 7:
        if (date >= 1 && date <= 22) {
            alert("Bạn thuộc cung Cự Giải");
        }
        else if (date >= 23 && date <= 31) {
            alert("Bạn thuộc cung Sư Tử");
        }
        break;
    case 8:
        if (date >= 1 && date <= 22) {
            alert("Bạn thuộc cung Sư Tử");
        }
        else if (date >= 23 && date <= 31) {
            alert("Bạn thuộc cung Xử Nữ");
        }
        break;
    case 9:
        if (date >= 1 && date <= 22) {
            alert("Bạn thuộc cung Xử Nữ");
        }
        else if (date >= 23 && date <= 30) {
            alert("Bạn thuộc cung Thiên Bình");
        }
        break;
    case 10:
        if (date >= 1 && date <= 23) {
            alert("Bạn thuộc cung Thiên Bình");
        }
        else if (date >= 24 && date <= 31) {
            alert("Bạn thuộc cung Bọ Cạp");
        }
        break;
    case 11:
        if (date >= 1 && date <= 21) {
            alert("Bạn thuộc cung Bọ Cạp");
        }
        else if (date >= 22 && date <= 30) {
            alert("Bạn thuộc cung Nhân Mã");
        }
        break;
    case 12:
        if (date >= 1 && date <= 21) {
            alert("Bạn thuộc cung Nhân Mã");
        }
        else if (date >= 22 && date <= 31) {
            alert("Bạn thuộc cung Ma Kết");
        }
        break;
    default:
        alert("Ngày tháng không hợp lệ");
}
