window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 1.1);
    addTaxDom.innerHTML = taxValue;
    
    const itemProfit = document.getElementById("profit");
    const profitValue = inputValue - taxValue;
    itemProfit.innerHTML = profitValue;

  })
});