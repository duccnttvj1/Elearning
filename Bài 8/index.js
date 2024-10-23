let a = Number(prompt("Hãy nhập số a cho phương trình bậc 2"));
let b =  Number(prompt("Hãy nhập số b cho phương trình bậc 2"));
let c =  Number(prompt("Hãy nhập số c cho phương trình bậc 2"));
let delta = Math.pow(b,2)-4*a*c;
let x1 = (-b+Math.sqrt(delta))/(2*a);
let x2 = (-b-Math.sqrt(delta))/(2*a);
if(a===0 && b===0 && c!==0 || delta < 0){
    console.log("Phương trình vô nghiệm");
}else if(a===0 && b===0 && c===0){
    console.log("Phương trình vô số nghiệm");
}else {
    console.log(`Nghiệm của phương trình bậc 2 là ${x1,x2}`)
}