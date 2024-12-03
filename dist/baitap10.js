"use strict";
let a = prompt("Hãy nhập vào ngày sinh");
let b = prompt("Hãy nhập vào tháng sinh");
let date = Number(a);
let month = Number(b);
if (month === 1) {
    if (date <= 19 && date >= 1) {
        alert("Bạn thuộc cung Ma Kết");
    }
    else if (date <= 31 && date >= 20) {
        alert("Bạn thuộc cung Bảo Bình");
    }
}
else if (month === 2) {
    if (date <= 18 && date >= 1) {
        alert("Bạn thuộc cung Bảo Bình");
    }
    else if (date <= 29 && date >= 19) {
        alert("Bạn thuộc cung Song Ngư");
    }
}
else if (month === 3) {
    if (date <= 20 && date >= 1) {
        alert("Bạn thuộc cung Song Ngư");
    }
    else if (date <= 31 && date >= 21) {
        alert("Bạn thuộc cung Bạch Duong");
    }
}
else if (month === 4) {
    if (date <= 19 && date >= 1) {
        alert("Bạn thuộc cung Bạch Dương");
    }
    else if (date <= 30 && date >= 20) {
        alert("Bạn thuộc cung Kim Ngưu");
    }
}
else if (month === 5) {
    if (date <= 20 && date >= 1) {
        alert("Bạn thuộc cung Kim Ngưu");
    }
    else if (date <= 31 && date >= 21) {
        alert("Bạn thuộc cung Song Tử");
    }
}
else if (month === 6) {
    if (date <= 21 && date >= 1) {
        alert("Bạn thuộc cung Song Tử");
    }
    else if (date <= 30 && date >= 22) {
        alert("Bạn thuộc cung Cự Giải");
    }
}
else if (month === 7) {
    if (date <= 22 && date >= 1) {
        alert("Bạn thuộc cung Cự Giải");
    }
    else if (date <= 31 && date >= 23) {
        alert("Bạn thuộc cung Sư Tử");
    }
}
else if (month === 8) {
    if (date <= 22 && date >= 1) {
        alert("Bạn thuộc cung Sử tử");
    }
    else if (date <= 31 && date >= 23) {
        alert("Bạn thuộc cung Xử Nữ");
    }
}
else if (month === 9) {
    if (date <= 22 && date >= 1) {
        alert("Bạn thuộc cung Xử Nữ");
    }
    else if (date <= 30 && date >= 23) {
        alert("Bạn thuộc cung thiên Bình");
    }
}
else if (month === 10) {
    if (date <= 23 && date >= 1) {
        alert("Bạn thuộc cung Thiên Bình");
    }
    else if (date <= 31 && date >= 24) {
        alert("Bạn thuộc cung Bọ Cạp");
    }
}
else if (month === 11) {
    if (date <= 21 && date >= 1) {
        alert("Bạn thuộc cung Bọ Cạp");
    }
    else if (date <= 30 && date >= 22) {
        alert("Bạn thuộc cung Nhân Mã");
    }
}
else if (month === 12) {
    if (date <= 21 && date >= 1) {
        alert("Bạn thuộc cung Nhân Mã");
    }
    else if (date <= 31 && date >= 22) {
        alert("Bạn thuộc cung Ma Kết");
    }
}
