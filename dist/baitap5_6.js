"use strict";
function sum(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        return toNumber1 + toNumber2;
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
console.log(sum("12212", 2));
function tru(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        return toNumber1 - toNumber2;
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
console.log(tru("-1231", 2));
function nhan(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        return toNumber1 * toNumber2;
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
console.log(nhan("-1231", 2));
function chia(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        return toNumber1 / toNumber2;
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
console.log(chia("20", 2));
while (true) {
    let a = Number(prompt("hãy nhập vào số thứ 1 cần tính toán:"));
    let inputA = isNaN(a) ? a : Number(a);
    let b = Number(prompt("hãy nhập vào số thứ 2 cần tính toán"));
    let c = prompt("hãy nhập vào phép tính thuộc dang C|T|N|CH|LT|GT|CB|E");
    let inputB = isNaN(b) ? b : Number(b);
    if (c === 'C') {
        console.log("Tổng: " + sum(inputA, inputB));
    }
    else if (c === 'T') {
        console.log("Trừ: " + tru(inputA, inputB));
    }
    else if (c === 'N') {
        console.log("Nhân: " + nhan(inputA, inputB));
    }
    else if (c === 'CH') {
        console.log("Chia: " + chia(inputA, inputB));
    }
    else if (c === 'LT') {
        console.log("Lũy Thừa:" + luythua(inputA, inputB));
    }
    else if (c === 'GT') {
        console.log("Giai thừa của số đầu tiên nhập vào: " + giaithua(inputA, inputB));
    }
    else if (c === 'CB') {
        console.log(`Cân bậc ${inputB} của ${inputA} là: ` + canbac(inputA, inputB));
    }
    else if (c === 'E') {
        console.log("Cảm ơn bạn đã dùng máy tính");
        break;
    }
    else {
        c = prompt("hãy nhập lại phép tính");
    }
}
;
function luythua(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        return toNumber1 ** toNumber2;
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
function giaithua(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    let result = 1;
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        if (toNumber1 < 0) {
            console.log("Không có giai thừa cho số âm!!!");
            return 0;
        }
        else if (toNumber2 < 0) {
            console.log("Không có giai thừa cho số âm!!!");
            return 0;
        }
        else if (toNumber1 === 0 || toNumber1 === 1) {
            return 1;
        }
        else if (toNumber2 === 0 || toNumber2 === 1) {
            return 1;
        }
        else {
            for (let i = toNumber1; i > 0; i--) {
                result *= i;
            }
            return result;
        }
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
function canbac(a, b) {
    let toNumber1 = Number(a);
    let toNumber2 = Number(b);
    if (!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)) {
        return Math.pow(toNumber1, 1 / toNumber2);
    }
    else {
        console.log("đây ko phải là số");
        return 0;
    }
}
