let toan = prompt("Nhập vào điểm toán");
let van = prompt("Nhập vào điểm văn");
let anh = prompt("Nhập vào điểm anh");
let dtb = Number(toan) + Number(van) + Number(anh);
let DTB = dtb/3;
if (DTB >= 8 && DTB <= 10) {
    console.log("Xếp loại Giỏi");
} else if (DTB >= 6.5 && DTB < 8) {
    console.log("Xếp loại Khá");
} else if (DTB >= 5 && DTB < 6.5) {
    console.log("Xếp loại Trung bình");
} else if (DTB < 5) {
    console.log("Xếp loại Yếu");
} else {
    console.log("Điểm nhập vào không hợp lệ");
}