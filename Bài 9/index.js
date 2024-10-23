let nam = Number(prompt("Hãy nhập vào 1 năm bất kỳ"));
if(nam%4 ===0 && nam%100 !==0 || nam % 400 ===0 ){
    console.log(`Năm ${nam} là năm nhuận`);
}else{
    console.log(`Năm ${nam} không là năm nhuận`);
}