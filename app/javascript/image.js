


let number= 0;
//let img =["/assets/9085B47F-39FD-4A40-936E-E025762919B7_1_105_c.jpg","/assets/2B6BAF72-8026-407C-A8C5-26B88577DD78_1_105_c.jpg","/assets/E5FB7F7F-2F23-457D-93AF-4397B618C41A_1_105_c.jpg"]
let itemNames=["pod-r","pod-l","pods"]

function change(picture,img,num,itemName){
  if(num<2){
    picture[0].src=img[num] 
    itemName[0].innerText=itemNames[num]
    number+=1
  }
  else{
    picture[0].src=img[num]
    itemName[0].innerText=itemNames[num]
    number=0
  }
}

function image(){
  let img = [];
  let picture = document.getElementsByClassName("image");
  let itemName = document.getElementsByTagName("h1");
  let pic = document.getElementsByTagName("img");//非表示タグの要素取得
  for(let i=1; i<pic.length;i++){img.push(pic[i].src)}

  change(picture,img,number,itemName);
  setTimeout(image,3000)
}


  window.addEventListener('load',image);
  