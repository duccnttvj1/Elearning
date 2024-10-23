let a = prompt("Nhập vào số a");
let b = prompt("Nhập vào số b");
let c = prompt("Nhập vào số c");
let max = Number(a);
if(max < Number(b)){
    max = b;
}else if(max < Number(c)){
    max = c;
}else{
    max = a;
}
console.log("Số lớn nhất là:"+ max);