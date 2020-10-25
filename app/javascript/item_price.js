window.addEventListener('mousedown', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    console.log(inputValue)
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = inputValue * 0.1
    const Profit = document.getElementById("profit");
    Profit.innerHTML = inputValue - addTax.innerHTML
  });
});