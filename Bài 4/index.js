let chieucao = prompt("Nhập vào chiều cao");
let cannang = prompt("Nhập vào cân năng");
let BMI = Number(cannang)/(Math.pow(Number(chieucao),2));
if(BMI < 18.5){
    console.log("Cân nặng thấp (gầy)");
}else if(18.5< BMI < 24.9){
    console.log("Bình thường");
}else if(25<= BMI){
    console.log("Thừa cân");
}else if(25< BMI < 29.9){
    console.log("Tiền béo phì");
}else if(30< BMI < 34.9){
    console.log("Béo phì độ I");
}else if(35< BMI < 39.9){
    console.log("Béo phì độ II");
}else if(40<= BMI){
    console.log("Béo phì độ III");
}