let a = prompt("hãy nhập vào số a");
let b = prompt("Hãy nhập vào số b");
let c = prompt("Hãy nhập vào số c");
let temp;
if(Number(a) > Number(b)){
    temp = a;
    a = b;
    b = temp;
}
if(Number(a) > Number(c)){
    temp = a;
    a = c;
    c = temp;
}
if(Number(b) > Number(c)){
    temp = b;
    b = c;
    c = temp;
}
console.log(a,b,c);