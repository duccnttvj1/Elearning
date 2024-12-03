"use strict";
function startGame() {
    let secretNumber = Math.floor(Math.random() * 10) + 1;
    let attempts = 3;
    while (attempts > 0) {
        let userGuess = prompt("Game đoán số (bạn chỉ có " + attempts + " lượt đoán):");
        if (userGuess === null) {
            alert("Bạn đã hủy trò chơi.");
            break;
        }
        let Guess = Number(userGuess);
        if (isNaN(Guess)) {
            alert("Vui lòng nhập một số hợp lệ.");
            continue;
        }
        if (Guess === secretNumber) {
            alert("Chúc mừng! Bạn đã đoán đúng số.");
            break;
        }
        else {
            attempts--;
            if (attempts > 0) {
                alert("Số đoán không đúng. Bạn còn " + attempts + " lượt đoán.");
                if (Guess > secretNumber) {
                    alert("Số đoán lớn hơn đáp án!!!");
                }
                else if (Guess < secretNumber) {
                    alert("Số đoán nhỏ hơn đáp án!!!");
                }
            }
            else {
                alert("Hết lượt đoán! Số đúng là " + secretNumber);
            }
        }
    }
}
