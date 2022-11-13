const pay = () => {
  // PAY.JPテスト公開鍵（payjp.jsライブラリの中で定義されているメソッド）
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // 入力フォーム全体を、変数に定義
  const form = document.getElementById("charge-form");
  // クリックした時に実行
  form.addEventListener("submit", (e) => {
    // submitボタンをクリックすることで起こる標準設定されているイベントを阻止
    e.preventDefault();
    // "charge-form"というidでフォームの情報を取得し、それをFormDataオブジェクト(フォームに入力された値を取得できるオブジェクト)として生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // 生成したFormDataオブジェクトから、クレジットカードに関する情報を取得し、変数cardに代入するオブジェクトとして定義（name属性の値）
    const card = {
      number: formData.get("credential_form[number]"),
      exp_month: formData.get("credential_form[exp_month]"),
      exp_year: `20${formData.get("credential_form[exp_year]")}`,
      cvc: formData.get("credential_form[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      // フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
  });
};

// payページを読み込んだ時に実行
window.addEventListener("load", pay);