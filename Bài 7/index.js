let a = Number(prompt("Hãy nhập số a cho phương trình ax+b=0"));
let b =  Number(prompt("Hãy nhập số b cho phương trình ax+b=0"));
let x = (-b)/a;
if(a === 0 && b === 0){
    console.log("Phương trình vô số nghiệm");
}else if(a === 0 && b !== 0){
    console.log("Phương trình vô nghiệm");
}else{
    console.log(`Nghiệm x = ${x}`);
}