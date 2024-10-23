let a = Number(prompt("hãy nhập cạnh a"));
let b = Number(prompt("hãy nhập cạnh b"));
let c = Number(prompt("hãy nhập cạnh c"));
if (a + b <= c) {
    console.log(`${a}, ${b}, ${c} không phải là ba cạnh của tam giác`);
} else if (a + c <= b) {
    console.log(`${a}, ${b}, ${c} không phải là ba cạnh của tam giác`);
} else if (b + c <= a) {
    console.log(`${a}, ${b}, ${c} không phải là ba cạnh của tam giác`);
} else {
    console.log(`${a}, ${b}, ${c} là ba cạnh của tam giác`);
}