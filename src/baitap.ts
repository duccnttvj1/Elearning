// bài 1
// bài 2
let num: number = 123;
let str: string = "Hello";
let check: boolean = true;
// gán lại giá trị
num = 213123;
check = false;

// str = 123123;
// bài 3
let firstName: string = "nguyen";
let lastName: string = "Duc";
let fullName: string = "";


function FullNName(str: string): string{
let newarr: string = "";
    for(let i =0; i < str.length; i++){
        if(i === 0 ){
        //    str[i]= str[i];
            newarr+=(str[i].toUpperCase());
        }else{
            newarr+=(str[i]);
        }
    }
    return newarr;
}

function kethop(str1: string, str2:string): string{
    return fullName.concat(str1," ",str2);
}

let result1 = FullNName(firstName);
let result2 = FullNName(lastName);

let result3 = kethop(result1, result2);
console.log(result3);

// bài 4
str = "bananaa";
// let result: string;
// result = Array.from(new Set(str.split(''))).toString()
console.log([...new Set(str)].join(""));

// // bài 5
// // cong
// function sum(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         return toNumber1 + toNumber2;
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }

// console.log(sum("12212",2));

// // tru
// function tru(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         return toNumber1 - toNumber2;
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }

// console.log(tru("-1231",2));

// // nhan
// function nhan(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         return toNumber1 * toNumber2;
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }

// console.log(nhan("-1231",2));

// // chia
// function chia(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         return toNumber1 / toNumber2;
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }

// console.log(chia("20",2));

// // bài 6
// while(true){
// let a = Number(prompt("hãy nhập vào số thứ 1 cần tính toán:"));
// let inputA = isNaN(a) ? a : Number(a);
// let b = Number(prompt("hãy nhập vào số thứ 2 cần tính toán"));
// let c = prompt("hãy nhập vào phép tính thuộc dang C|T|N|CH|LT|GT|CB|E");
// let inputB = isNaN(b) ? b : Number(b);
// if(c === 'C'){
//     console.log("Tổng: "+sum(inputA,inputB));
// }else if(c === 'T'){
//     console.log("Trừ: "+tru(inputA,inputB));
// }else if(c === 'N'){
//     console.log("Nhân: "+nhan(inputA,inputB));
// }else if(c === 'CH'){
//     console.log("Chia: "+chia(inputA,inputB));
// }else if(c === 'LT'){
//     console.log("Lũy Thừa:"+luythua(inputA,inputB));
// }else if(c === 'GT'){
//     console.log("Giai thừa của số đầu tiên nhập vào: "+giaithua(inputA,inputB));
// }else if(c === 'CB'){
//     console.log(`Cân bậc ${inputB} của ${inputA} là: `+canbac(inputA,inputB));
// }
// else if(c === 'E'){
//     console.log("Cảm ơn bạn đã dùng máy tính");
//     break;
// }
// else{
//     c = prompt("hãy nhập lại phép tính");
// }
// };

// function luythua(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         return toNumber1**toNumber2;
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }

// function giaithua(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     let result: number = 1;
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         if(toNumber1 < 0){
//             console.log("Không có giai thừa cho số âm!!!");
//             return 0;
//         }else if(toNumber2 <0){
//             console.log("Không có giai thừa cho số âm!!!");
//             return 0;
//         }else if(toNumber1 === 0 || toNumber1 === 1){
//             return 1;
//         }else if(toNumber2 === 0 || toNumber2 === 1){
//             return 1;
//         }else{
//             for(let i=toNumber1; i > 0; i-- ){
//                 result *= i;
//             }
//             return result;
//         }
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }
 
// function canbac(a: string | number, b: string | number): number{
//     let toNumber1 = Number(a);
//     let toNumber2 = Number(b);
//     if(!Number.isNaN(toNumber1) && !Number.isNaN(toNumber2)){
//         return Math.pow(toNumber1,1/toNumber2);
//     }else{
//         console.log("đây ko phải là số");
//         return 0;
//     }
// }

// bai 7
while(true){
let a = prompt("Hãy nhập vào số tự nhiên mà bạn muốn lấy bảng cửu chương của nó");
if(a === 'E'){
    break;
}else{
    for(let i=1; i<=10; i++ ){
        console.log(`${a}*${i} = `+Number(a)*i);
    }
    console.log("-------------");
}
}
  