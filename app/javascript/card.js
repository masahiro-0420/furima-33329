const pay = () => {
  Payjp.setPublicKey("pk_test_7c03e1941f0fb768c6679700"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_destination[number]"),
      cvc: formData.get("order_destination[cvc]"),
      exp_month: formData.get("order_destination[exp_month]"),
      exp_year: `20${formData.get("order_destination[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);