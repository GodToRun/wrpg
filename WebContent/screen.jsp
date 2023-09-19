<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="db.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WRPG</title>

</head>
<body>
<h1>WRPG</h1>
<p>
<script>
var players = [];
var monsters = [];
var objects = [];
var buffs = [];
var decos = [];
var career = "";
var needexp = 1;
let showhp = 0;
let exp = 0;
let hp = 0;
let maxhp = 0;
let level = -6974;
let ad = 0;
let ap = 0;
let texnum = 0;
let aniTimes = 1;
let coin = 0;
let dirx = 0;
var name = "unnamed";
var sex = "M";
let diry = 0;
var stealth = false;
var isMoving = false;
var chat = "";
var delay = false;
function playerAniUpdate() {
	texnum++;
	if (texnum >= aniTimes) {
		texnum = 0;
	}
}
function getDirectionFrames() {
	if (diry == 1)
		   return playersouth;
	else if (diry == -1)
        return playernorth;
	if (dirx == 1)
        return playereast;
	 else if (dirx == -1)
	    return playerwest;
	return playersouth;
}
var getCookie = function(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
};
function setCookie(c_name,value,exdays)
{
   var exdate=new Date();
   exdate.setDate(exdate.getDate() + exdays);
   var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
   document.cookie=c_name + "=" + c_value;
}
var res_t0 = new Image();
res_t0.src = "https://i.imgur.com/4XRpmVp.png";
var res_t1 = new Image();
res_t1.src = "https://i.imgur.com/D6D4p5e.png";
var res_sw0 = new Image();
res_sw0.src = "https://i.imgur.com/qfb5FyE.png";
var res_sw1 = new Image();
res_sw1.src = "https://i.imgur.com/gmlVRXs.png";
var res_li0 = new Image();
res_li0.src = "https://i.imgur.com/Yxe9Iip.png";
var res_li1 = new Image();
res_li1.src = "https://i.imgur.com/NY1qjdY.png";
var res_heal0 = new Image();
res_heal0.src = "https://i.imgur.com/hcygbaz.png";
var res_heal1 = new Image();
res_heal1.src = "https://i.imgur.com/5pdRxqN.png";
var res_uiback = new Image();
res_uiback.src = "https://i.imgur.com/jniJoJg.png";
var res_dirt = new Image();
res_dirt.src = "https://i.imgur.com/1wlTPKN.png";
var res_dirtwall = new Image();
res_dirtwall.src = "https://i.imgur.com/jwE99Tw.png";
var res_cave = new Image();
res_cave.src = "https://i.imgur.com/NQJNWRE.png";
var res_cavewall = new Image();
res_cavewall.src = "https://i.imgur.com/9wq9GYn.png";
var res_eblow0 = new Image();
res_eblow0.src = "https://i.imgur.com/pBrLWnx.png";
var res_eblow1 = new Image();
res_eblow1.src = "https://i.imgur.com/cXVPlzf.png";
var res_eblow2 = new Image();
res_eblow2.src = "https://i.imgur.com/8GHtDgJ.png";
var res_sym0 = new Image();
res_sym0.src = "https://i.imgur.com/usvFSQb.png";
var res_sym1 = new Image();
res_sym1.src = "https://i.imgur.com/knI5XUH.png";
var res_sym2 = new Image();
res_sym2.src = "https://i.imgur.com/QmnmqGW.png";
var res_sym3 = new Image();
res_sym3.src = "https://i.imgur.com/EhP180K.png";
var res_sym4 = new Image();
res_sym4.src = "https://i.imgur.com/T6FJOgx.png";
var res_sym5 = new Image();
res_sym5.src = "https://i.imgur.com/umwgFRY.png";
var res_tr0 = new Image();
res_tr0.src = "https://i.imgur.com/Al0ievt.png";
var res_tr1 = new Image();
res_tr1.src = "https://i.imgur.com/AWLULxE.png";
var res_tr2 = new Image();
res_tr2.src = "https://i.imgur.com/p7LFiVh.png";
var res_tr3 = new Image();
res_tr3.src = "https://i.imgur.com/HqqPZO3.png";
var res_tr4 = new Image();
res_tr4.src = "https://i.imgur.com/050BczR.png";
var res_rage0 = new Image();
res_rage0.src = "https://i.imgur.com/GYuh2GT.png";
var res_rage1 = new Image();
res_rage1.src = "https://i.imgur.com/ht0YAUS.png";
var res_rage2 = new Image();
res_rage2.src = "https://i.imgur.com/LzgNNSv.png";
var res_playersouth0 = new Image();
res_playersouth0.src = "https://i.imgur.com/cGgO1Eu.png";
var res_playersouth1 = new Image();
res_playersouth1.src = "https://i.imgur.com/usfl2Zv.png";
var res_playernorth0 = new Image();
res_playernorth0.src = "https://i.imgur.com/jriJhN2.png";
var res_playernorth1 = new Image();
res_playernorth1.src = "https://i.imgur.com/ovrzGn3.png";
var res_playereast0 = new Image();
res_playereast0.src = "https://i.imgur.com/7dKBkJ7.png";
var res_playereast1 = new Image();
res_playereast1.src = "https://i.imgur.com/SUQdrN2.png";
var res_playerwest0 = new Image();
res_playerwest0.src = "https://i.imgur.com/xPLuRdI.png";
var res_playerwest1 = new Image();
res_playerwest1.src = "https://i.imgur.com/LhfOWba.png";
var res_womanhairsouth = new Image();
res_womanhairsouth.src = "https://i.imgur.com/TKBvBHj.png";
var res_womanhairnorth = new Image();
res_womanhairnorth.src = "https://i.imgur.com/wr9A4rl.png";
var res_womanhairwest = new Image();
res_womanhairwest.src = "https://i.imgur.com/wmUkQzR.png";
var res_womanhaireast = new Image();
res_womanhaireast.src = "https://i.imgur.com/hhHnGqk.png";
var res_skirtsouth0 = new Image();
res_skirtsouth0.src = "https://i.imgur.com/ZqrpRDX.png";
var res_skirtsouth1 = new Image();
res_skirtsouth1.src = "https://i.imgur.com/nIOgQ4m.png";
var res_skirtnorth0 = res_skirtsouth0;
var res_skirtnorth1 = new Image();
res_skirtnorth1.src = "https://i.imgur.com/xvzSVjw.png";
var res_skirtwest0 = new Image();
res_skirtwest0.src = "https://i.imgur.com/atQcMF1.png";
var res_skirtwest1 = new Image();
res_skirtwest1.src = "https://i.imgur.com/qglJueo.png";
var res_skirteast0 = new Image();
res_skirteast0.src = "https://i.imgur.com/SiHGHuy.png";
var res_skirteast1 = new Image();
res_skirteast1.src = "https://i.imgur.com/w8PmkMg.png";
var res_lvup0 = new Image();
res_lvup0.src = "https://i.imgur.com/ci6tfjh.png";
var res_lvup1 = new Image();
res_lvup1.src = "https://i.imgur.com/2XLReGm.png";
var res_lvup2 = new Image();
res_lvup2.src = "https://i.imgur.com/TqgJ9kn.png";
var res_mancorpse = new Image();
res_mancorpse.src = "https://i.imgur.com/istQOKn.png";
var res_womancorpse = new Image();
res_womancorpse.src = "https://i.imgur.com/QP1cy53.png";
var res_grass = new Image();
res_grass.src = "https://i.imgur.com/kbHEERo.png";
var res_career0 = new Image();
res_career0.src = "https://i.imgur.com/klKruJN.png";
var res_career1 = new Image();
res_career1.src = "https://i.imgur.com/3TXnb21.png";
var res_career2 = new Image();
res_career2.src = "https://i.imgur.com/vZQYHRf.png";
var res_fansouth = new Image();
res_fansouth.src = "https://i.imgur.com/h92pujQ.png";
var res_fannorth = new Image();
res_fannorth.src = "https://i.imgur.com/EIdmb6G.png";
var res_fanwest = new Image();
res_fanwest.src = "https://i.imgur.com/k2Z6RIA.png";
var res_faneast = new Image();
res_faneast.src = "https://i.imgur.com/5INqPOd.png";
var res_wandsouth = new Image();
res_wandsouth.src = "https://i.imgur.com/7tH6t7a.png";
var res_wandnorth = new Image();
res_wandnorth.src = "https://i.imgur.com/hBokqzp.png";
var res_wandwest = new Image();
res_wandwest.src = "https://i.imgur.com/CHo7kLp.png";
var res_wandeast = new Image();
res_wandeast.src = "https://i.imgur.com/6hTnY0Q.png";
var res_deepdirt = new Image();
res_deepdirt.src = "https://i.imgur.com/Sxzg5Wc.png";
var res_hpbar = new Image();
res_hpbar.src = "https://i.imgur.com/1tYmdWo.png";
var res_expbar = new Image();
res_expbar.src = "https://i.imgur.com/NTqygN6.png";
var playersouth = [res_playersouth0, res_playersouth1];
var playernorth = [res_playernorth0, res_playernorth1];
var playerwest = [res_playerwest0, res_playerwest1];
var playereast = [res_playereast0, res_playereast1];
var hairDeco = {"west":[res_womanhairwest],"south":[res_womanhairsouth],"north":[res_womanhairnorth],"east":[res_womanhaireast]};
var skirtDeco = {"south":[res_skirtsouth0,res_skirtsouth1],"north":[res_skirtnorth0,res_skirtnorth1],"east":[res_skirteast0,res_skirteast1],"west":[res_skirtwest0,res_skirtwest1]};
var fanDeco = {"south":[res_fansouth],"north":[res_fannorth],"west":[res_fanwest],"east":[res_faneast]};
var wandDeco = {"south":[res_wandsouth],"north":[res_wandnorth],"west":[res_wandwest],"east":[res_wandeast]};
var aniFrames = getDirectionFrames();
setInterval(() => playerAniUpdate(), 100);
document.write("<span id=info>체력 " + hp + " 레벨 [" + level + "] 경험치 " + exp + " 공격력 " + ad + " 마법력 " + ap + "</span>");
</script>
</p>
<style>
.tooltip {
  position: relative;
  
}

.tooltip .tooltiptext {
  visibility: hidden;       /* 이벤트가 없으면 툴팁 영역을 숨김 */
  width: 380px;             /* 툴팁 영역의 넓이를 설정 */
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  position: absolute;       /* 절대 위치를 사용 */
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;      /* hover 이벤트 발생시 영역을 보여줌 */
}

@font-face {
    @font-face {
    font-family: 'Hangeuljaemin4-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body {
        font-family: "궁서체";
      }
</style>
<canvas id="canvas" width="1000" height="540">
</canvas>
<canvas id="uicanvas" width="250" height="540">
</canvas>
<script>
let cooldown = [0,0,0,0,0,0,0,0,0,0];
function heal(amount) {
	if (died) return;
	if (amount+hp >= maxhp) {
		hp = maxhp;
		amount = 0;
	}
	hp += amount;  
	socket.send("hp="+hp);
}
function levelupEffect() {
    var frames = [res_lvup0, res_lvup1, res_lvup2];
    animate(posx, posy, frames, 190, 166, 90);
}
function changeCareerEffect() {
	var frames = [res_career0, res_career1, res_career2];
	animate(posx, posy, frames, 120, 180, 180);
}
function waitForSocketConnection(socket, callback){
    setTimeout(
        function () {
            if (socket.readyState === 1) {
                if (callback != null){
                    callback();
                }
            } else {
                waitForSocketConnection(socket, callback);
            }

        }, 5); // wait 5 milisecond for the connection...
}
function exp2_buffstart() {
	socket.send("expbuff=1.5");
	setTimeout(() => exp2_buffend(), 200000);
}
function exp2_buffend() {
    socket.send("expbuff=1");
}
function magicsymbol(si) {
	cooldown[si] = 6;
	var frames = [res_sym0, res_sym1, res_sym2, res_sym3, res_sym4, res_sym5];
	animate(posx, posy, frames, 70, 80, 80);
	exp2_buffstart();
}
function getParam(sname) {

    var params = location.search.substr(location.search.indexOf("?") + 1);

    var sval = "";

    params = params.split("&");

    for (var i = 0; i < params.length; i++) {

        temp = params[i].split("=");

        if ([temp[0]] == sname) { sval = temp[1]; }

    }

    return sval;

}
var initial = true;
var socket = new WebSocket(window.location.origin.replace("http", "ws") + "/socket");
var chatSocket = new WebSocket(window.location.origin.replace("http", "ws") + "/chatsocket");
chatSocket.onmessage = function(event) {
	var data = event.data;
	chat = data;
	var area = document.getElementById("chattext");
	area.value = chat;
}
socket.onmessage = function(event) {
	var data = event.data;
	var kv = data.split(";");
    for (let i = 0; i < kv.length; i++) {
    	var kv2 = kv[i].split("=");
    	if (initial) {
    		if (kv2[0] == "x") posx = parseFloat(kv2[1]);
            if (kv2[0] == "y") posy = parseFloat(kv2[1]);
    	}
    	if (kv2[0] == "hp") hp = parseInt(kv2[1]);
    	if (kv2[0] == "exp") exp = parseInt(kv2[1]);
    	if (kv2[0] == "coin") coin = parseInt(kv2[1]);
        if (kv2[0] == "maxhp") maxhp = parseInt(kv2[1]);
        if (kv2[0] == "level") { if (level+1 == parseInt(kv2[1])) levelupEffect(); level = parseInt(kv2[1]); }
        if (kv2[0] == "ad") ad = parseInt(kv2[1]);
        if (kv2[0] == "ap") ap = parseInt(kv2[1]);
        if (kv2[0] == "career") career = kv2[1];
        if (kv2[0] == "inv") inv = kv2[1];
        if (kv2[0] == "name") name = kv2[1];
        if (kv2[0] == "monstercount") {
        	monsters = new Array(parseInt(kv2[1]));
        }
        if (kv2[0].startsWith("monster")) {
        	let num = kv2[0].slice(7);
        	monsters[num] = {"w":80,"h":80,"maxhp":0,"hp":0,"x":0,"y":0,"tex":"","flash":false};
        
        }
        if (kv2[0].startsWith("monsterx")) {
            let num = kv2[0].slice(8);
            monsters[num].x = parseFloat(kv2[1]);
        }
        if (kv2[0].startsWith("monstertex")) {
            let num = kv2[0].slice(10);
            monsters[num].tex = (kv2[1]);
        }
        if (kv2[0].startsWith("monstery")) {
            let num = kv2[0].slice(8);
            monsters[num].y = parseFloat(kv2[1]);
        }
        if (kv2[0].startsWith("monsterw")) {
            let num = kv2[0].slice(8);
            monsters[num].w = parseInt(kv2[1]);
        }
        if (kv2[0].startsWith("monster!h")) {
            let num = kv2[0].slice(9);
            monsters[num].h = parseInt(kv2[1]);
        }
        if (kv2[0].startsWith("monsterhp")) {
            let num = kv2[0].slice(9);
            monsters[num].hp = parseInt(kv2[1]);
        }
        if (kv2[0].startsWith("monstermaxhp")) {
            let num = kv2[0].slice(12);
            monsters[num].maxhp = parseInt(kv2[1]);
        }
        if (kv2[0] == "playercount") {
            players = new Array(parseInt(kv2[1]));
        }
        if (kv2[0].startsWith("player")) {
            let num = kv2[0].slice(6);
            players[num] = {"x":0,"y":0,"tex":""};
        }
        if (kv2[0].startsWith("playerx")) {
            let num = kv2[0].slice(7);
            players[num].x = parseFloat(kv2[1]);
        }
        if (kv2[0].startsWith("playery")) {
            let num = kv2[0].slice(7);
            players[num].y = parseFloat(kv2[1]);
        }
        if (kv2[0].startsWith("playertex")) {
            let num = kv2[0].slice(9);
            players[num].tex = kv2[1];
        }
        if (kv2[0].startsWith("pindex")) {
            pindex = parseInt(kv2[1]);
        }
        if (kv2[0].startsWith("sword")) {
        	sword = kv2[1];
        	if (initial)
        		   equip(sword, 0);
        }
        if (kv2[0].startsWith("sex")) {
            sex = kv2[1];
            if (sex == "F" && !decos.includes(hairDeco)) {
            	decos.push(skirtDeco);
            	decos.push(hairDeco);
            }
        }
        if (kv2[0].startsWith("armor")) {
            armor = kv2[1];
            if (initial)
                equip(armor, 0);
        }
    }
    initial = false;
}
waitForSocketConnection(socket, function() {
	socket.send("x=?"+";y=?");
	setInterval(() => req(), 160);
});
waitForSocketConnection(chatSocket, function() {
    chatSocket.send("");
    setInterval(() => req(), 160);
});
function init() {
	
}
var map = [
                "---------------- ------------ ------",
                "-``````-```````---`````````----```--",
                "-``````-``````````````````--``````-`",
                "----```-``````````````````-```````--",
                "-``````````````````````````````````-",
                "-```````````````````````````````----",
                "-``````````````````````````````````-",
                "-``````````````````````````````````-",
                "-``````````````````````````````````-",
                "-``````````````````````````````````-",
                "-``````````````````````````````-----",
                "-``````````````````````````````-`a`-",
                "-````````````````````````````````b`-",
                "-``````````````````````````````-```-",
                "-``````````````````````````````-----",
                "-``````````````````````````````````-",
                "-----ddd------------------```-------",
                "--dddddd--               10001     -",
                "-dddddddd--    1111111111110011    -",
                "-ddddddddd-     1110000010000001    -",
                "-dddddddd--     1000000100000011   -",
                "-dddddddd-      1111000000000011   -",
                "-ddddddd--         10000000000011  -",
                "---------         11000000000000111-",
                "-                  10000000000000011",
                "-                 111100000000000001",
                "-           111111111000000000000001",
                "-           100000000000001100000011",
                "-           1AB001ss111001111100011-",
                "-           111111ssss111100011111 -",
                "-          --ssssssssssss-----     -",
                "-           -ssssssssssssssss-     -",
                "-          --sssssssssssssss--     -",
                "-         --ssssssssssssssss--     -",
                "-         -sssssssssssssssss--     -",
                "-         -ssssssssssssssssss-     -",
                "-         -sssssssssssssssss--     -",
                "-         -ssssssssssssssssss-     -",
                "-         -ssssssssssssssssss-     -",
                "-         -sssssssssssssssss--     -",
                "-         -------dddd---------     -",
                "-         --ddddddddddddddd---     -",
                "-         -dddddddddddddddddd-     -",
                "-        --ddddddddddddddddddd--   -",
                "-        -ddddddddddddddddddddd-   -",
                "-        -ddddddddddddddddddddd-   -",
                "-        -ddddddddddddddddddddd--  -",
                "-        -dddddddddddddddddddddd-- -",
                "-        -ddddddddddddddddddddddd- -",
                "-        -ddddddddddddddddddddd--- -",
                "-        -ddddddddddddddddddddd--  -",
                "------------------------------------",
        ];
var died = false;
let pindex = 0;
let posx = 0;
var sword = "";
var armor = "";
let posy = 0;
let damBuff = 1;
var inv = "";
setInterval(() => update(), 50);
setInterval(() => autoheal(), 4000);
window.onkeydown = (e) => move(e);
window.onkeyup = (e) => moveUp(e);
draw();
var v = 30;
function autoheal() {
	heal(Math.floor(maxhp/10));
}
function animate(x, y, frames, ms, w, h) {
	var object = {"x":x, "y":y, "w":w, "h":h, "tex":frames[0], "isText":false, "text":"", "opa":1};
	objects.push(object);
	animateloop(object, x, y, frames, ms);
}
function animateloop(obj, x, y, frames, ms) {
	obj.tex = frames[0];
    if (frames.length <= 0) {
    	objects.splice(objects.indexOf(obj), 1);
    	return;
    }
   	setTimeout(() => animateloop(obj, x, y, frames.slice(1), ms), ms);
}
function getUpg(code) {
	return parseInt(code.slice(1+4));
}
function decodeItemCode(code) {
	let upg = ("+" + getUpg(code)).replace("+0", "");
	if (code.startsWith("0")) return "마법구"+upg;
	else if (code.startsWith("1")) return "단검"+upg;
	else if (code.startsWith("!")) return "선홍 치마"+upg;
	else if (code.startsWith("@")) return "망각의 구"+upg;
	else if (code.startsWith("#")) return "공허의 단검"+upg;
	else if (code.startsWith("$")) return "여인의 부채"+upg;
	else if (code.startsWith("%")) return "마법 지팡이"+upg;
	else if (code.startsWith("^")) return "청룡언월도"+upg;
	else if (code.startsWith("&")) return "올라프 갑옷"+upg;
	else if (code.startsWith("*")) return "고대 주문서"+upg;
	code= code.replace("null", "");
	return code;
}
/*function encodeItemCode(name) {
	if (name=="마법구") return "0";
	if (name=="단검") return "1";
	return name;
}*/
function req() {
    let x = document.getElementById("info");
    let invt = document.getElementById("invtext");
    invt.innerText = "\n";
    var items = inv.split(",");
    for (let i = 0; i < items.length; i++) {
    	if (decodeItemCode(items[i]).trim() == "") continue;
    	invt.innerText += "[" + decodeItemCode(items[i]).trim() + "]   ";	
    }
    needexp = Math.floor(13.4316*Math.pow(Math.sqrt(level), 2.718));
    showhp=hp;
    if (hp<0)showhp=0;
    x.innerText="체력 " + showhp + "/" + maxhp + " 레벨 [" + level + "] 경험치 " + exp + "/" + needexp + " 공격력 " + ad + " 마법력 " + ap + " " + toCareerName() + " " + coin + "전";
    socket.send("x="+posx+";y="+posy + ";stealth="+stealth + ";playertex"+pindex+"="+playerimg.src);
    chatSocket.send("");
}
function dealAni(obj, l) {
	if (l >= 10) return;
	l++;
	setTimeout(() => dealAni(obj, l), 100);
    let i = objects.indexOf(obj);
    objects[i].opa -= 0.085;
    objects[i].y -= 0.07;
}
function dealText(mindex, finalDam) {
	var dealobj = {"x":monsters[mindex].x,"y":monsters[mindex].y,"isText":true,"text":""+finalDam,"opa":1};
    objects.push(dealobj);
    setTimeout(function() {
    	   dealAni(dealobj, 0);
        }, 100);
    setTimeout(function() {
        objects.splice(objects.indexOf(dealobj), 1);
        }, 1500);
}
function attack_damage(mindex, dam, noref) {
	var finalDam = dam*ad*damBuff;;
	stealth = false;
	monsters[mindex].hp-=finalDam;
	dealText(mindex, finalDam);
	monsters[mindex].flash = true;
	//setTimeout(function(){monsters[mindex].flash=false;}, 200);
	if (noref) return;
     mrefresh(mindex);
}
function ability_power(i, dam, noref) {
	var finalDam = dam*ap*damBuff;
	stealth = false;
	monsters[i].hp-=finalDam;
	dealText(i, finalDam);
	monsters[i].flash = true;
	//setTimeout(function(){monsters[mindex].flash=false;}, 200);
	if (noref) return;
    mrefresh(i);
}
function mrefresh(index) {
	socket.send("monsterhp" + index + "="+monsters[index].hp);
}
function mrefreshlist(li) {
	let s = "";
	for (let i = 0; i < li.length; i++) {
		s += "monsterhp"+li[i]+"="+monsters[li[i]].hp+";";
	}
    socket.send(s);
}
function moveUp(e) {
	if (e.key == 'a' || e.key == 'd' && diry == 0 && dirx != 0) {isMoving = false;aniTimes = 1;}
	if (e.key == 'w' || e.key == 's' && dirx == 0 && diry != 0) {isMoving = false;aniTimes = 1;}
}
function optionLoop(opt, val, dir) {
	if (opt == 'H') {
		maxhp += val*dir;
		socket.send("maxhp="+maxhp);
	}
	else if (opt == 'D') {
        ad += val*dir;
        socket.send("ad="+ad);
    }
	else if (opt == 'P') {
        ap += val*dir;
        socket.send("ap="+ap);
    }
}
function calcOption(option, dir) {
	for (let i = 0; i < 2; i++) {
		opt = option[i*2];
		val = parseInt(option[i*2+1]);
		optionLoop(opt, val, dir);
	}
}
function move(e) {
	if (died && e.key == "Enter") {
        died = false;
        hp = maxhp;
        posx=16;
        posy=18;
        socket.send("hp="+hp);
    }
	if (died) return;
	if (e.key == 'a') {
		aniTimes = 2;
		dirx = -1;
		diry = 0;
		isMoving = true;
	}
	if (e.key == 'd') {
		aniTimes = 2;
		dirx = 1;
		diry = 0;
		isMoving = true;
    }
	if (e.key == 'w') {
		aniTimes = 2;
		diry = -1;
		dirx = 0;
		isMoving = true;
    }
	if (e.key == 's') {
		aniTimes = 2;
		diry = 1;
		dirx = 0;
		isMoving = true;
    }
	if (e.key == 'f') {
		skill();
	}
	if (e.key == "r") {
		swing();
	}
	if (e.key == "q") {
		subskill();
	}
	if (e.key == "t") {
        subskill2();
    }
	if (e.key == "1") {
        subskill3();
    }
	if (e.key == "2") {
        subskill4();
    }
	aniFrames=getDirectionFrames();
	if (e.key == " ") {
		let x = currentMapX();
		let y = currentMapY();
		if (map[y][x] == 'a' && level >= 6 && career != "WIZARD") {
			stealth = false;
			career = "ASSASSIN";
			changeCareerEffect();
		}
		else if (map[y][x] == 'b' && level >= 5 && career != "WARRIOR") {
			stealth = false;
            career = "TELEPORTER";
            changeCareerEffect();
        }
		else if (map[y][x] == 'A' && level >= 25 && career == "ASSASSIN") {
            stealth = false;
            career = "WARRIOR";
            changeCareerEffect();
        }
		  else if (map[y][x] == 'B' && level >= 20 && career == "TELEPORTER") {
	            stealth = false;
	            career = "WIZARD";
	            changeCareerEffect();
	        }
		socket.send("career="+career);
	}
}
function subskill() {
	si = 2;
    if (cooldown[si] > 0) return;
	if (career == "TELEPORTER" || career == "WIZARD")
		   electricShock(si);
	else if (career == "ASSASSIN" || career == "WARRIOR")
        backstrike(si);
		
}
function subskill2() {
    si = 4;
    if (cooldown[si] > 0) return;
    if (career == "TELEPORTER" || career == "WIZARD")
           healskill(si);
    else if (career == "ASSASSIN" || career == "WARRIOR")
        speer();
        
}
function subskill3() {
    si = 5;
    if (cooldown[si] > 0) return;
    if (career == "WIZARD")
           energyblow();
    else if (career == "WARRIOR")
        trinity();
        
}
function subskill4() {
    si = 6;
    if (cooldown[si] > 0) return;
    if (career == "WIZARD")
           magicsymbol(si);
    else if (career == "WARRIOR")
        rage(si);
        
}
// main skill
function skill() {
	si = 0;
	if (cooldown[si] > 0) return;
	if (career == "TELEPORTER" || career == "WIZARD")
	   teleport(si);
	else if (career == "ASSASSIN" || career == "WARRIOR")
		darksite();
		
}
function teleport(si) {
	frames = [res_t0,res_t1];
    animate(posx, posy, frames, 100, 50, 90);
	cooldown[si] = 0.7;
	var distance = 5.5;
	posx += dirx * distance;
	posy += diry * distance;
	setTimeout(() => animate(posx, posy, frames, 120, 50, 90), 30);
}
function darksite() {
	stealth = !stealth;
}
function electricShock(si) {
	cooldown[si] = 0.68;
	let num = 0;
	let updlist = [];
    for (let i = 0; i < monsters.length; i++) {
    	let mx = monsters[i].x;
        let my = monsters[i].y;
        
        if (Math.abs(mx-posx) < 4.6 && Math.abs(my-posy) < 4.6) {
        	frames = [res_li0,res_li1];
            animate(mx, my, frames, 140, 80, 80);
              ability_power(i, 2, true);
              updlist.push(i);
             num++;
             if (num >= 3) break;
              
        }
    }
    mrefreshlist(updlist);
}
function speer() {
    si = 1;
    let num = 0;
    if (cooldown[si] > 0) return;
    cooldown[si] = 0.9;
    let updlist = [];
     for (let i = 0; i < monsters.length; i++) {
         let mx = monsters[i].x;
         let my = monsters[i].y;
         
         if (Math.abs(mx-posx) < 2.7 && Math.abs(my-posy) < 2.7) {
             frames = [res_sw0,res_sw1];
             animate(mx, my, frames, 140, 80, 80);
               attack_damage(i, 3, true);
               updlist.push(i);
               num++;
               if(num>=2)break;
         }
     }
     mrefreshlist(updlist);
}
function energyblow() {
    si = 4;
    if (cooldown[si] > 0) return;
    cooldown[si] = 0.43;
     for (let i = 0; i < monsters.length; i++) {
         let mx = monsters[i].x;
         let my = monsters[i].y;
         
         if (Math.abs(mx-posx) < 5 && Math.abs(my-posy) < 5) {
             frames = [res_eblow0,res_eblow1,res_eblow2];
             animate(mx, my, frames, 85, 85, 85);
               ability_power(i, 4);
               break;
         }
     }
}
function rage(si) {
	cooldown[si] = 150;
	frames = [res_rage0, res_rage1, res_rage2];
    animate(posx, posy, frames, 90, 80, 80);
	rageStart();
}
function rageStart() {
	damBuff = 2;
	hp /= 1.5;
	hp = Math.floor(hp);
	socket.send("ad="+ad + ";hp="+hp);
	setTimeout(() => rageEnd(), 12000);
}
function rageEnd() {
	damBuff = 1;
	socket.send("ad="+ad);
}
function trinity() {
	delay = true;
	setTimeout(function() {delay=false}, 700);
    si = 7;
    if (cooldown[si] > 0) return;
    cooldown[si] = 0.70;
     for (let i = 0; i < monsters.length; i++) {
         let mx = monsters[i].x;
         let my = monsters[i].y;
         
         if (Math.abs(mx-posx) < 3.7 && Math.abs(my-posy) < 3.7) {
             frames = [res_tr0,res_tr1,res_tr2,res_tr3,res_tr4];
             animate(mx, my, frames, 130, 80, 80);
               attack_damage(i, 4);
               setTimeout(() => attack_damage(i, 4), 80);
               break;
         }
     }
}
function swing() {
	si = 1;
    if (cooldown[si] > 0) return;
    cooldown[si] = 0.5;
     for (let i = 0; i < monsters.length; i++) {
    	 let mx = monsters[i].x;
         let my = monsters[i].y;
         
         if (Math.abs(mx-posx) < 2 && Math.abs(my-posy) < 2) {
        	 frames = [res_sw0,res_sw1];
             animate(mx, my, frames, 140, 80, 80);
        	   attack_damage(i, 1);
        	   break;
         }
     }
}
function healskill(si) {
	cooldown[si] = 8;
	frames = [res_heal0,res_heal1];
    animate(posx, posy, frames, 100, 50, 90);
	heal(Math.floor(maxhp/4));
}
function backstrike(si) {
    si = 3;
    if (cooldown[si] > 0) return;
    cooldown[si] = 1.1;
     for (let i = 0; i < monsters.length; i++) {
         let mx = monsters[i].x;
         let my = monsters[i].y;
         
         if (Math.abs(mx-posx) < 5 && Math.abs(my-posy) < 5) {
             frames = [res_sw0,res_sw1];
             animate(mx, my, frames, 140, 80, 80);
             posx = mx+0.2;
             posy = my+0.1;
               attack_damage(i, 4);
               break;
         }
     }
}
function checkSolid(xm) {
	if (xm != '1' && xm != '-') return true; else return false;
}
function currentMapX() {
	return parseInt(Math.round(posx/50*30));
}
function currentMapY() {
    return parseInt(Math.round((posy+1.5)/50*30));
}
// called per 10 ms
function update() {
	var preInv = inv;
	for (let i = 0; i < inv.length; i++) {
	    if (inv[i] == ',') {
	    	if (i == 0) inv = inv.slice(1);
	    	else if (i == inv.length-1) inv = inv.slice(0, inv.length-1);
	    	else if (inv[i+1] == ',') {
	    		inv = inv.slice(0, i+1) + inv.slice(i+2);
    		}
	    }
	}
	if (preInv != inv)
		   socket.send("inv="+inv);
	if (hp <= 0) {
		   died = true;
	}
	else died = false;
	for (let i = 0; i < cooldown.length; i++)
		   cooldown[i] -= 0.01*5;
	if (isMoving && !delay) {
		var ix = currentMapX();
		var iy = currentMapY();
		var amix = parseInt(Math.round((posx+(dirx*0.04))/50*30));
		var amiy = parseInt(Math.round(((posy+1.5)+(diry*0.04))/50*30));
		var xm = map[iy][amix];
		var ym = map[amiy][ix];
		if (checkSolid(xm))
		  posx += dirx * 0.04*5;
		if (checkSolid(ym))
		   posy += diry * 0.04*5;
	}
	draw();
}
var playerimg = "";
function drawPlayer(ctx, rx, ry) {
	if (died) {
		var corpse;
	    if (sex=="M") {
	    	corpse = res_mancorpse;
	    }
	    else if (sex=="F") {
            corpse = res_womancorpse;
        }
	    ctx.drawImage(corpse, rx*v, ry*v, 130, 130);
		return;
	}
	var alpha = 1.0;
	if (stealth) if (sex=="F")alpha = 0;else if (sex=="M")alpha = 0.3;
	ctx.globalAlpha = alpha;
	ctx.fillStyle = "rgba(255, 255, 255)";
	playerimg = aniFrames[texnum];
    ctx.drawImage(aniFrames[texnum], rx*v,ry*v,74,110);
    if (stealth) alpha = 0.6;
    ctx.globalAlpha = alpha;
    for (let i = 0; i < decos.length; i++) {
    	var deco = decos[i];
    	var img = deco.south[0];
    	if (dirx == -1) {
    		img = deco.west[texnum%deco.west.length];
    	}
    	else if (dirx == 1) {
            img = deco.east[texnum%deco.east.length];
        }
    	else if (diry == 1) {
            img = deco.south[texnum%deco.south.length];
        }
    	else if (diry == -1) {
            img = deco.north[texnum%deco.north.length];
        }
    	ctx.drawImage(img, rx*v,ry*v,74,110);
    }
    ctx.font = "20px 궁서체";
    ctx.fillText(name, rx*v+28, ry*v+120);
    ctx.globalAlpha = 1;
}
function toCareerName() {
	if (career == "CIVILIAN") return "민간인";
	if (career == "TELEPORTER") return "텔레포터";
	if (career == "ASSASSIN") return "암살자";
	if (career == "WIZARD") return "마법사";
	if (career == "WARRIOR") return "전사";
	return "unknown";
}
function equip(equipment, dir) {
	calcOption(equipment.slice(1,5), dir);
	let upg = getUpg(equipment);
	if (equipment.startsWith("0")) {
		ap += 2*dir;
		ap += dir*Math.floor(upg/2);
		if (dir!=0)
		    socket.send("ap="+ap + ";sword="+equipment);
	}
	else if (equipment.startsWith("1")) {
		ad += 2*dir;
		ad += dir*Math.floor(upg/2);
		if (dir!=0)
		    socket.send("ad="+ad + ";sword="+equipment);
    }
	else if (equipment.startsWith("&")) {
        maxhp += dir*14;
        maxhp += dir*Math.floor(upg*2.8);
        if (dir!=0)
            socket.send("maxhp="+maxhp + ";armor="+equipment);
    }
	else if (equipment.startsWith("^")) {
        ad += 9*dir;
        maxhp += 8*dir;
        ad += dir*Math.round(upg*4.3);
        if (dir!=0)
            socket.send("ad="+ad + ";sword="+equipment + ";maxhp="+maxhp);
    }
	else if (equipment.startsWith("*")) {
        ap += 9*dir;
        maxhp += 8*dir;
        ap += dir*Math.round(upg*4.3);
        if (dir!=0)
            socket.send("ap="+ap + ";sword="+equipment + ";maxhp="+maxhp);
    }
	else if (equipment.startsWith("@")) {
        ap += 7*dir;
        ap += dir*Math.round(upg*1.5);
        maxhp += 2*dir;
        if (dir!=0)
            socket.send("ap="+ap + ";sword="+equipment + ";maxhp="+maxhp);
    }
	else if (equipment.startsWith("#")) {
        ad += 7*dir;
        maxhp += 1*dir;
        ad += dir*Math.floor(upg*1.5);
        if (dir!=0)
            socket.send("ad="+ad + ";sword="+equipment + ";maxhp="+maxhp);
    }
	else if (equipment.startsWith("%")) {
        if (dir>=0)
            decos.push(wandDeco);
        else {
          let i = decos.indexOf(wandDeco);
          decos.splice(i, 1);
        }
        ap += 10*dir;
        ap += dir*Math.round(upg*2.6);
        if (dir!=0)
            socket.send("ap="+ap + ";sword="+equipment);
    }
	else if (equipment.startsWith("$")) {
		if (dir>=0)
            decos.push(fanDeco);
        else {
          let i = decos.indexOf(fanDeco);
          decos.splice(i, 1);
        }
        ad += 10*dir;
        ad += dir*Math.round(upg*2.6);
        if (dir!=0)
            socket.send("ad="+ad + ";sword="+equipment);
    }
}
function unequiparmor() {
    equip(armor, -1);
    inv += "," + armor;
    socket.send("armor= ;inv="+inv);
}
function unequipsword() {
	equip(sword, -1);
	inv += "," + sword;
	socket.send("sword= ;inv="+inv);
}
function invequip() {
	var jobValue = document.getElementById('invtextbox').value
	var items = inv.split(",");
    for (let i = 0; i < items.length; i++) {
        if (decodeItemCode(items[i]) == jobValue) {
        	var equipment = items[i];
        	equip(equipment, 1);
        	let ind = inv.indexOf(items[i]);
        	let size = items[i].length;
            inv = inv.slice(0, ind) + inv.slice(ind+size);
            if (inv==""||inv==null)inv=" ";
            socket.send("inv="+inv);
            break;
        }
    }
}
function getNeedUpgradeCoin(code) {
	var c = code[0];
	if (c=='0' || c=='1') return 25;
	if (c=='@' || c=='#') return 200;
	if (c=='$' || c=='%') return 330;
	if (c=='^' || c=='&' || c=='*') return 550;
	return 500;
}
function decodeOptionLoop(c) {
	if (c[0]=='H') return "최대 체력+"+c[1];
	if (c[0]=='D') return "물리 공격력+"+c[1];
	if (c[0]=='P') return "마법력+"+c[1];
}
function invresetoption() {
    var jobValue = document.getElementById('invtextbox').value;
    var items = inv.split(",");
    for (let i = 0; i < items.length; i++) {
        if (decodeItemCode(items[i]) == jobValue) {
            let needCoin = 400;
            if (coin < needCoin) return;
            coin -= needCoin;
            socket.send("coin="+coin);
            let ind = inv.indexOf(items[i]);
            let size = items[i].length;
            let option = "";
            let possible = ['H','D','P']
            for (let j = 0; j < 2; j++) {
            	option += possible[Math.floor(Math.random()*possible.length)];
            	var op1 = (Math.floor(Math.random() * 3) + 1);
            	var op2 = (Math.floor(Math.random() * 4) + 1);
            	op = op1;
            	if (Math.random() < 0.15) op += op2; 
            	option += op;
            	let invt = document.getElementById("optiontext");
                invt.innerText = "\n" + decodeOptionLoop(option.slice(0, 2)) + "\n" + decodeOptionLoop(option.slice(2, 4));
            }
            inv = inv.slice(0, ind+1) + option + inv.slice(ind+1+4);
            socket.send("inv="+inv);
        }
    }
}
function invup() {
	var jobValue = document.getElementById('invtextbox').value;
	var items = inv.split(",");
	for (let i = 0; i < items.length; i++) {
        if (decodeItemCode(items[i]) == jobValue) {
        	let needCoin = getNeedUpgradeCoin(items[i]);
        	if (coin < needCoin) return;
        	coin -= needCoin;
        	socket.send("coin="+coin);
        	let ind = inv.indexOf(items[i]);
            let size = items[i].length;
            let uplvl = (parseInt(items[i].slice(5)))+1;
        	var percent = 1/(0.3*(Math.pow(uplvl,1.56)));
        	if (Math.random() < percent) {
        		inv = inv.slice(0, ind+1+4) + uplvl + inv.slice(ind+size);
        		socket.send("inv="+inv);
        	}
        }
	}
}
function invsell() {
	var jobValue = document.getElementById('invtextbox').value
	var items = inv.split(",");
	for (let i = 0; i < items.length; i++) {
		if (decodeItemCode(items[i]) == jobValue) {
			let ind = inv.indexOf(items[i]);
            let size = items[i].length;
            inv = inv.slice(0, ind) + inv.slice(ind+size);
            if (inv==""||inv==null)inv=" ";
			socket.send("inv= "+inv);
			break;
		}
	}
}
function drawUI() {
    var ratio = exp / needexp;	
	var canvas = document.getElementById("uicanvas");
	var ctx = canvas.getContext("2d");
	ctx.drawImage(res_uiback, 0, 0, canvas.width, canvas.height);
	drawPlayer(ctx, 3, 3);
	ctx.font = "30px 궁서체";
	ctx.fillText(toCareerName(), 3*v-16, 50);
	ctx.font = "25px 궁서체";
	ctx.fillText("무기 " + decodeItemCode(sword), 3*v-52, 260);
	ctx.fillText("갑옷 " + decodeItemCode(armor), 3*v-52, 320);
	var hpratio = showhp / maxhp;
	ctx.fillStyle = "rgba(222, 222, 222)";
    ctx.fillRect(3*v-52, 365, 180, 30);
    ctx.fillStyle = "rgba(198, 0, 13)";
    ctx.drawImage(res_hpbar, 3*v-52, 365, 180*hpratio, 30);
    
	ctx.fillStyle = "rgba(222, 222, 222)";
	ctx.fillRect(3*v-52, 420, 180, 30);
	ctx.fillStyle = "rgba(0, 205, 23)";
	ctx.drawImage(res_expbar, 3*v-52, 420, 180*ratio, 30);
}
function chatsend() {
	var v = document.getElementById("chattextbox");
	chatSocket.send(v.value);
	v.value = "";
}
function draw() {
	drawUI();
	var canvas = document.getElementById("canvas");
	let opsx = posx - 12;
	let opsy = posy - 9;
	if (canvas.getContext) {
	    var ctx = canvas.getContext("2d");
	    ctx.clearRect(0, 0, canvas.width, canvas.height);
	    let MW = 36;
	    let MH = map.length;
	    var mapblock = 50;
	    for (let y = 0; y < MH; y++) {
	        for (let x = 0; x < MW; x++) {
	        	rx=x;ry=y;
	            if (rx < 0 || ry < 0 || rx >= MW || ry >= MH) continue;
	            var img = new Image();
	            ctx.fillStyle = "rgba(255, 255, 255)";
	                if (map[ry][rx] == '-') {
	                	img = res_dirtwall;
	                }
	                else if (map[ry][rx] == '`') {
                        img = res_dirt;
                    }
	                else if (map[ry][rx] == 'd') {
                        img = res_deepdirt;
                    }
	                else if (map[ry][rx] == 'a') {
	                	img = res_dirtwall;
                    }
	                else if (map[ry][rx] == 'b') {
	                	img = res_dirtwall;
                    }
	                else if (map[ry][rx] == 'c') {
                        img = res_dirtwall;
                    }
	                else if (map[ry][rx] == '1') {
                        img = res_cavewall;
                    }
	                else if (map[ry][rx] == '0') {
                        img = res_cave;
                    }
	                else if (map[ry][rx] == 's') {
                        img = res_grass;
                    }
	                else {
	                	img = res_dirt;
	                }
	                if (map[ry][rx] != ' ')
	                	   ctx.drawImage(img, rx*mapblock-opsx*v,ry*mapblock-opsy*v,mapblock,mapblock);
	            
	        }
	    }
	    drawPlayer(ctx, 12, 9);
	    // draw monsters
	    for (let i = 0; i < monsters.length; i++) {
	    	var mx = monsters[i].x;
	    	var my = monsters[i].y;
	    	let hp = monsters[i].hp;
	    	let ratio = hp / monsters[i].maxhp;
	    	//if (hp <= 0) continue;
	    	ctx.fillStyle = "rgba(255, 255, 255)";
	    	var img = new Image();
	    	var imgPath = monsters[i].tex.replace("\"", "");
	    	img.src = imgPath;
	    	var xd = mx*v-opsx*v;
	    	var yd = my*v-opsy*v;
	    	  
	    	  ctx.drawImage(img,xd,yd,monsters[i].w,monsters[i].h);
	    	  ctx.globalCompositeOperation='source-over';
	    	ctx.fillStyle = "rgba(0, 0, 0)";
	    	let w = 55;
	    	let h = 8;
	    	ctx.fillRect(xd-9,yd-20,w,h);
	    	let col = "0,150,0";
	    	if (ratio <= 0.6) col="189,183,10"
	    		if (ratio <= 0.25) col="144,0,0"
	    	ctx.fillStyle = "rgba(" + col + ")";
	    	let r = w*ratio;
	    	if (r<0)r=0;
	    	ctx.fillRect(xd-9,yd-20,r,h);
	    	ctx.fillStyle = "rgba(255, 255, 255)";
	    }
	    // draw players
        for (let i = 0; i < players.length; i++) {
        	if (i == pindex) continue;
            let mx = players[i].x;
            let my = players[i].y;
            ctx.fillStyle = "rgba(255, 255, 255)";
            var pimg = new Image();
            pimg.src = players[i].tex;
            ctx.drawImage(pimg, mx*v-opsx*v,my*v-opsy*v,74,110);
        }
        for (let i = 0; i < objects.length; i++) {
        	ctx.fillStyle = "rgba(255, 255, 255)";
        	ctx.globalAlpha = objects[i].opa;
        	if (!objects[i].isText)
        		ctx.drawImage(objects[i].tex, objects[i].x*v-opsx*v, objects[i].y*v-opsy*v,objects[i].w,objects[i].h);
        	else
        		ctx.fillText(objects[i].text, objects[i].x*v-opsx*v, objects[i].y*v-opsy*v);
        }
        ctx.globalAlpha = 1;
	  }
	
}

</script>
<br>
<span class="tooltip"><img src="https://i.imgur.com/8vUOpko.png"/>
  <span2 class="tooltiptext tooltip-top">현재 보고있는 방향으로 5.5만큼 텔레포트한다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/wNDD1qw.png"/>
  <span2 class="tooltiptext tooltip-top">은신을 ON/OFF한다. 공격 시 은신이 해제된다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/wlfZDRB.png"/>
  <span2 class="tooltiptext tooltip-top">2x2 정사각형 범위 내에 있는 적에게 1 물리 대미지를 입힌다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/AKe3y92.png"/>
  <span2 class="tooltiptext tooltip-top">4.6x4.6 근처 최대 3마리 적에게 2 마법 대미지를 입힌다 .</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/0rCCxc3.png"/>
  <span2 class="tooltiptext tooltip-top">최대 체력의 25%를 회복한다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/4V3ubLe.png"/>
  <span2 class="tooltiptext tooltip-top">5x5 근처 적에게 텔레포트하고 4 물리 대미지를 입힌다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/bplWnb4.png"/>
  <span2 class="tooltiptext tooltip-top">2.7x2.7 근처 최대 2마리 적에게 3 물리 대미지를 입힌다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/0NtByt0.png"/>
  <span2 class="tooltiptext tooltip-top">5.3x5.3 근처 적에게 4 마법 대미지를 입힌다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/kEL7hna.png"/>
  <span2 class="tooltiptext tooltip-top">200초동안 몬스터 처치 시 얻는 경험치와 코인를 50% 증가시킨다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/m9w4wpr.png"/>
  <span2 class="tooltiptext tooltip-top">3.7x3.7 근처 적에게 4 물리 대미지 2타를 입힌다.</span2>
</span>
<span class="tooltip"><img src="https://i.imgur.com/OXMkdxB.png"/>
  <span2 class="tooltiptext tooltip-top">체력의 33%를 소모하고 12초동안 물리 대미지를 2배 증가시킨다. </span2>
</span>
<br>
<br>
<input type="text" id='invtextbox'/>
<div id='result'></div>
<br>
<input type="button" onclick="invequip()" value="장착"/>
<input type="button" onclick="unequipsword()" value="무기 장착 해제"/>
<input type="button" onclick="unequiparmor()" value="갑옷 장착 해제"/>
<input type="button" onclick="invsell()" value="판매"/>
<input type="button" onclick="invup()" value="강화"/>
<input type="button" onclick="invresetoption()" value="잠재능력 재설정"/>
<span id="invtext">인벤토리 시스템</span>
<span id="optiontext"></span>
<br>
<textarea id="chattext" rows="10" cols="44">
</textarea>
<br>
<input type="text" id='chattextbox'/>
<input type="button" onclick="chatsend()" value="전송"/>
</body>
</html>
