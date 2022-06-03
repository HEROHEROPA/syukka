


const form = `<form id="item"> 
 商品名: <input type="text">
 数量:<input type="text">
 <input type="submit" value="入庫する">
</form>`


function ToStore(){
  const enter = document.getElementById("to-store-button")
  enter.addEventListener("click",(e)=>{//Javascriptにクリックイベントを認識させる。
    // e.preventDefault();//ブラウザから送信されたクリックイベントをここで無効化する
    // const form = document.getElementById("form")
    const enterStock = document.getElementById("items-stock-title")

    const currentFormState = document.getElementsByClassName('item-number')
   if(currentFormState[1].children[1]===undefined){
     enterStock.insertAdjacentHTML("afterend", form);
   }
   else{
    document.querySelector('#item').remove();
   }

   //console.log(enterStock)
  } 
  )
}
  window.addEventListener('load',ToStore);