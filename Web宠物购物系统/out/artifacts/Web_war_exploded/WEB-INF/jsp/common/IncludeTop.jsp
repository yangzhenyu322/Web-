<%@ page import="org.csu.myproject.domain.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<style>
    div.wrap{
        width: 240px;
        margin: 20px auto 0 auto;
    }
    .auto-inp{
        width: 240px;
        height: 36px;
        padding-left: .5em;
        border-radius: 2px;
        border: 1px solid #dedede;
        color: #666;
        outline: none;
    }
    .auto{
        width: 240px;
        border: 1px solid #dedede;
        border-top: none;
        position: absolute;
    }
    .auto_out{
        width: 238px;
        height: 36px;
        line-height: 36px;
        padding-left: .5em;
        color: #000;
        background: #fff;
        overflow: hidden;
        white-space: nowrap;
        -o-text-overflow: ellipsis;
        text-overflow: ellipsis;
    }
    .auto_out.on{
        background: #eee;
        cursor: pointer;
    }
    .hidden{
        display: none;
    }

</style>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="images/logo-topbar.gif" /></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart"><img align="middle" name="img_cart"
                                    src="images/cart.gif" /></a> <img align="middle"
                                                                      src="images/separator.gif" />

            <%
                Account loginUser = (Account) session.getAttribute("loginUser");
                if (loginUser==null){
                    out.write("<a href=\"loginForm\">Sign In</a>");
                }else {
                    out.write("<a href=\"signOut\">Sign Out</a>");
                }
            %>


            <img align="middle" src="images/separator.gif" />
            <a href="editAccountForm">My Account</a> <img align="middle" src="images/separator.gif" />
            <a href="logForm">logs</a>
            <script src="js/SearchProduct.js"></script>
        </div>
    </div>


    <%--    <div id="Search">--%>
    <%--        <div id="SearchContent">--%>
    <%--            <form action="catalog/SearchProducts.jsp" method="post">--%>
    <%--                <input type="text" name="keyword" size="14" /> <input type="submit"--%>
    <%--                                                                      name="searchProducts" value="Search" />--%>
    <%--            </form>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <%--    <div id="QuickLinks">--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_fish.gif" /></a> <img src="images/separator.gif" />--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_dogs.gif" /></a> <img src="images/separator.gif" />--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_reptiles.gif" /></a> <img--%>
    <%--            src="images/separator.gif" /> <a href="catalog/Category.jsp"><img--%>
    <%--            src="images/sm_cats.gif" /></a> <img src="images/separator.gif" />--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_birds.gif" /></a>--%>
    <%--    </div>--%>


    <div id="Search">
        <div id="SearchContent">
            <form action="search" method="post">
                <input id="keyword" type="text" name="keyword" size="14" />
                <div class="auto hidden" id="auto">
                    <div class="auto_out">1</div>
                    <div class="auto_out">2</div>
                </div>
                <input type="submit" name="searchProducts" value="Search" />
                <script>
                    Array.prototype.unique = function(){
                        this.sort();
                        var res = [];
                        var json = {};
                        for (var i = 0; i < this.length; i++) {
                            if(!json[this[i]]){
                                res.push(this[i]);
                                json[this[i]] = 1;
                            }
                        }
                        return res;
                    };

                    // 对样式操作
                    var setClass = {
                        hasClass: function(elements,cName){
                            if(elements.className.match(new RegExp( "(\\s|^)" + cName + "(\\s|$)") ))
                                return true;
                            else
                                return false;
                        },
                        addClass: function(elements,cName){
                            if( !this.hasClass( elements,cName ) ){
                                elements.className += " " + cName;
                            }
                        },
                        removeClass: function(elements,cName){
                            if( this.hasClass( elements,cName ) ){
                                elements.className = elements.className.replace( new RegExp( "(\\s|^)" + cName + "(\\s|$)" )," " );
                            }
                        }
                    };

                    var Bind = function(This){
                        return function(){
                            This.init();
                        }
                    };

                    function AutoComplete(keyword,auto,arr) {
                        this.obj = document.getElementById(keyword);
                        this.autoObj = document.getElementById(auto);
                        this.search_value = "";
                        this.index = -1;
                        this.value_arr = arr;
                    }
                    AutoComplete.prototype = {
                        // 初始化
                        init: function(){
                            var This = this;
                            setClass.removeClass(This.autoObj,"hidden");
                            this.autoObj.style.left = this.obj.offsetLeft + "px";
                            this.autoObj.style.top = this.obj.offsetTop + this.obj.offsetHeight + "px";
                        },
                        deleteDIV: function(){
                            while(this.autoObj.hasChildNodes()){
                                this.autoObj.removeChild(this.autoObj.firstChild);
                            }
                            setClass.addClass(this.autoObj,"hidden");
                        },
                        autoOnmouseover: function(index){
                            if(index !== this.index){
                                setClass.addClass(this.autoObj.children[index],"on");
                                setClass.removeClass(this.autoObj.children[this.index],"on");
                                this.index = index;
                            }
                        },
                        setValue: function(This){
                            return function(){
                                This.obj.value = this.seq;
                                setClass.addClass(This.autoObj,"hidden");
                            }
                        },
                        // 响应键盘
                        pressKey: function(event){
                            var code = event.keyCode;
                            var length = this.autoObj.children.length;
                            if(code === 38){
                                setClass.removeClass(this.autoObj.children[this.index],"on");
                                this.index--;
                                if(this.index < 0){
                                    this.index = length - 1;
                                }
                                setClass.addClass(this.autoObj.children[this.index],"on");
                                this.obj.value = this.autoObj.children[this.index].seq;
                            }else if(code === 40){
                                setClass.removeClass(this.autoObj.children[this.index],"on");
                                this.index++;
                                if(this.index > length-1){
                                    this.index = 0;
                                }
                                setClass.addClass(this.autoObj.children[this.index],"on");
                                this.obj.value = this.autoObj.children[this.index].seq;
                            }else{
                                this.obj.value = this.autoObj.children[this.index].seq;
                                setClass.addClass(this.autoObj,"hidden");
                                this.index = -1;
                            }
                        },
                        // 程序入口
                        start: function(event){
                            event = event || window.event;
                            var code = event.keyCode;
                            var This = this;
                            if(code !== 13 && code !== 38 && code !== 40){
                                this.init();
                                this.deleteDIV();
                                this.search_value = this.obj.value;
                                var valueArr = this.value_arr.unique();
                                //去掉前后空格不能为空
                                if(this.obj.value.replace(/(^\s*)|(\s*$)/g,"") === ""){ return;}
                                //判断数组中是否含有输入的关键字
                                try{
                                    var reg = new RegExp("("+ this.obj.value +")","i"); //输入"aaa" 则 reg = /(aaa)/i
                                }catch(e){
                                    alert(e.message);
                                }
                                var div_index = 0;  //记录匹配索引个数
                                for (var i = 0; i < valueArr.length; i++) {
                                    if(reg.test(valueArr[i])){
                                        var div = document.createElement("div");
                                        div.className = "auto_out";
                                        div.seq = valueArr[i];
                                        div.index = div_index;
                                        div.innerHTML = valueArr[i].replace(reg,"<strong>$1</strong>");
                                        this.autoObj.appendChild(div);
                                        setClass.removeClass(this.autoObj,"hidden");
                                        div_index++;
                                        if(div_index === 1) {
                                            setClass.addClass(this.autoObj.firstChild,"on");
                                            this.index = 0;
                                        }
                                        div.onmouseover = function(){
                                            This.autoOnmouseover(this.index);
                                        };
                                        div.onclick = this.setValue(This);
                                    }
                                }
                            }else{
                                this.pressKey(event);
                            }
                            window.onresize = Bind(This);
                        }
                    };

                    var xmlHttpRequest;
                    var keyword = document.getElementById('keyword').value;
                    sendRequest("searchProductEngine?keyword=" + keyword);
                    function sendRequest(url) {
                        xmlHttpRequest = new XMLHttpRequest();
                        xmlHttpRequest.open("GET", url, true);
                        xmlHttpRequest.onreadystatechange = processResponse;
                        xmlHttpRequest.send(null);
                    }

                    function processResponse() {
                        if (xmlHttpRequest.readyState === 4) {
                            if (xmlHttpRequest.status === 200) {
                                console.log("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                                var resp = xmlHttpRequest.responseText;
                                var array = resp.split(",");
                                var autoComplete = new AutoComplete("keyword","auto",array);
                                document.getElementById("keyword").onkeyup = function(event){
                                    console.log("**************************");
                                    autoComplete.start(event);
                                    console.log("--------------------------------------");
                                }
                            }
                        }
                    }
                </script>
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH"><img
                src="images/sm_fish.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=DOGS"><img
                src="images/sm_dogs.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=REPTILES"><img
                src="images/sm_reptiles.gif" /></a> <img
            src="images/separator.gif" /> <a href="viewCategory?categoryId=CATS"><img
            src="images/sm_cats.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=BIRDS"><img
                src="images/sm_birds.gif" /></a>
    </div>
</div>
