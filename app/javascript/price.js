function price () {
  const priceForm = document.getElementById("item-price")
  priceForm.addEventListener("keyup", () => {
    const totalPrice = parseInt(priceForm.value, 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    if (totalPrice >= 300) {
      addTaxPrice.innerHTML = parseInt((totalPrice / 10), 10);
      profit.innerHTML = totalPrice - addTaxPrice.innerHTML;
    }
    else {
      addTaxPrice.innerHTML = ""
      profit.innerHTML = ""
    }
  });
 };
 
 window.addEventListener('turbo:load', price);