let nam = Number(prompt("Hãy nhập vào số năm"));
let thang = Number(prompt("Hãy nhập vào số tháng"));
let nam_nhuan = null;

if (nam % 4 === 0 && nam % 100 !== 0 || nam % 400 === 0) {
    nam_nhuan = nam;
} else {
    nam_nhuan = null;
}

if (thang < 1 || thang > 12) {
    console.log("Bạn đã nhập sai tháng! Vui lòng nhập tháng từ 1 đến 12.");
} else if (thang === 2 && nam_nhuan !== null) {
    console.log(`Tháng ${thang} năm ${nam} có 29 ngày`);
} else if (thang === 2) {
    console.log(`Tháng ${thang} năm ${nam} có 28 ngày`);
} else if (thang === 4 || thang === 6 || thang === 9 || thang === 11) {
    console.log(`Tháng ${thang} năm ${nam} có 30 ngày`);
} else if (thang === 1 || thang === 3 || thang === 5 || thang === 7 || thang === 8 || thang === 10 || thang === 12) {
    console.log(`Tháng ${thang} năm ${nam} có 31 ngày`);
}
