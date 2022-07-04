


const form = `<form id="item"> 
 商品名: <input class="toStock-name" type="text">
 数量:<input class="toStock-amount" type="text">
 <input type="submit" value="入庫確認" id="toStock">
</form>`

const errorMessage = `<div class="error-message" style="color:red">正しい商品名を入力してください！</div>`

function ToStore(){
  let toStock = "";
  const enter = document.getElementById("to-store-button")
  enter.addEventListener("click",(e)=>{//Javascriptにクリックイベントを認識させる。
    // e.preventDefault();//ブラウザから送信されたクリックイベントをここで無効化する
    // const form = document.getElementById("form")

    const enterStock = document.getElementById("items-stock-title")
    //let toStock = "";

    if(enterStock.querySelector("div")){enterStock.querySelector("div").remove()}//errorメッセージが表示されていたら取り除く。

    const currentFormState = document.getElementsByClassName('item-number')
    if(currentFormState[1].children[1]===undefined){
      enterStock.insertAdjacentHTML("afterend", form);
      toStock = document.getElementById("toStock")//入庫するボタン
     
    }
    else{
     document.querySelector('#item').remove();
    }
   //})
   //debugger

   let   formData = {name:"", amount:""}
   let   haveToStoreAmount = "";

   let   formTag = "";//入庫記入不備有り時のエラーメッセージ格納

    toStock.addEventListener("click",(e)=>{
      e.preventDefault()
      const toStoreName = document.getElementsByClassName("toStoreName") 
      let   toStoreAmount = document.getElementsByClassName("toStoreAmount")//在庫表の入庫数
      
      let   toStockName = document.getElementsByClassName("toStock-name")
      let   toStockAmount = document.getElementsByClassName("toStock-amount")
      
     
      
      
      
      // console.log(toStockName[0].value)
      // console.log(toStockAmount[0].value)
      
    if(toStock!=="" && toStock.value==="入庫確認"){
      let itemName=false;
      for(let i=0;i<toStoreName.length;i++){
        if(toStockName[0].value===toStoreName[i].innerText){
          toStoreAmount[i].innerText=toStockAmount[0].value
          formData.name = toStoreName[i].innerText;
          formData.amount =  toStoreAmount[i].innerText
          haveToStoreAmount =toStoreAmount[i]
          itemName =true
         
           if(document.getElementsByClassName("error-message").length!==0){document.querySelector('.error-message').remove();}//errormessageが表示されていたら削除する。
          toStockName[0].value=""
          toStockAmount[0].value=""
          toStock.value="実行"
          break
        } 
      }

         
        if(itemName===false && toStock.value==="入庫確認" && formTag===""){
          formTag = document.getElementById("item");
          formTag.insertAdjacentHTML("beforebegin", errorMessage);
          toStockName[0].value=""
          toStockAmount[0].value=""
        }
     }
      // }) 
      
      else if(toStock!=="" && toStock.value==="実行"){
         // toStock.addEventListener("click",(e)=>{
            e.preventDefault();
            console.log(JSON.stringify(formData))
            const XHR = new XMLHttpRequest();

            const formDates = new FormData();//postメソッドで値を送信する際に使用するインスタンス
            formDates.append("name",formData.name)//送信したい値をメソッドで(キー、値)で引数に指定
            formDates.append("amount",formData.amount)

            const token = document.getElementsByName("csrf-token")[0].content;//＊javascriptのみでサーバー送信を行う場合トークンを付与して送信する必要がある。左記はそのトークンを取得するための記述。

            XHR.responseType = "json";
            let order_id = location.pathname.split("/")[2] //アドレスバーからid ナンバーを取得

            XHR.open("POST", `/orders/${order_id}/to_stocks`, true);
            XHR.onload = function(e){if(XHR.status===200){location.reload()}else{console.log(XHR.status)}}//ページのリロードをjs側で行わないとサーバー側にリクエストを出していてもサーバー側のレスポンスでページ更新されない。
           //onloadは通信が完了した際に呼ばれる。そのため、そこに実行させたい関数を代入することでsendメソッドが実行され通信完了時に関数が実行される。
           
           XHR.setRequestHeader('X-CSRF-Token', token)//61行目で取得したトークンをリクエスト送信のヘッダーに含めるための記述。

            haveToStoreAmount.innerText=""
            XHR.send(formDates) //トークンを含めた状態でデータを送信する。
         // })
      } 

    })
  }) 
    
  //)
}
  window.addEventListener('load',ToStore);