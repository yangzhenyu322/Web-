var xhr
function showInform(categoryId)
{
    console.log(categoryId);
    xhr=new XMLHttpRequest();
    xhr.open("GET","floatCategory?categoryId="+categoryId);
    xhr.onreadystatechange=processResponse;
    xhr.send(null)
}

function processResponse() {
    if(xhr.readyState===4)
    {
        if(xhr.status===200)
        {
            var resp=xhr.responseText;
            var inform=document.getElementById("inform");
            inform.innerText=resp;
            inform.style.display="block";
        }
    }
}

function hiddenInform(event) {
    var informDiv=document.getElementById("inform");
    var x=event.clientX;
    var y=event.clientY;
    var divx1 = informDiv.offsetLeft;
    var divy1 = informDiv.offsetTop;
    var divx2 = informDiv.offsetLeft + informDiv.offsetWidth;
    var divy2 = informDiv.offsetTop + informDiv.offsetHeight;
    if(x < divx1 || x > divx2 || y < divy1 || y > divy2)
    {
        document.getElementById("inform").style.display="none";
    }
}