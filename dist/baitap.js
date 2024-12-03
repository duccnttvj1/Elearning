"use strict";
let num = 123;
let str = "Hello";
let check = true;
num = 213123;
check = false;
let firstName = "nguyen";
let lastName = "Duc";
let fullName = "";
function FullNName(str) {
    let newarr = "";
    for (let i = 0; i < str.length; i++) {
        if (i === 0) {
            newarr += (str[i].toUpperCase());
        }
        else {
            newarr += (str[i]);
        }
    }
    return newarr;
}
function kethop(str1, str2) {
    return fullName.concat(str1, " ", str2);
}
let result1 = FullNName(firstName);
let result2 = FullNName(lastName);
let result3 = kethop(result1, result2);
console.log(result3);
str = "bananaa";
console.log([...new Set(str)].join(""));
while (true) {
    let a = prompt("Hãy nhập vào số tự nhiên mà bạn muốn lấy bảng cửu chương của nó");
    if (a === 'E') {
        break;
    }
    else {
        for (let i = 1; i <= 10; i++) {
            console.log(`${a}*${i} = ` + Number(a) * i);
        }
        console.log("-------------");
    }
}
