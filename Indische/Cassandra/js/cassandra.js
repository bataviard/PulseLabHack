$("#exitTolButton").click(function(){
	createNotif("TE","GT Buah Batu");
})
$("#gerbangButton").click(function(){
	createNotif("TG","GT Bekasi Barat");
})
$("#restButton").click(function(){
	createNotif("RA","KM 57");
})


var notifID = 0;
var notifSound = document.getElementById("ding");
// input: jenis notif(TollExit/TollGate/RestArea), Nama event notif(eg. Gerbang Tol Buah Batu, Rest Area KM.57))
function createNotif(eventKind,eventName) {
	notifID += 1;
	var notif = document.createElement("div");
	var icon = document.createElement("div");
	var teks = document.createElement("div");
	if (eventKind=="TE") {
		notif.style.background = "#89f886";
		icon.innerHTML = "<img src='images/exit.png' style='vertical-align:top'>";
		teks.innerHTML = "<span style='margin-left:10px'>Toll Exit</span><br><b><span style='margin-left:10px'>"+eventName+"</span></b>";
	}else if (eventKind=="TG") {
		notif.style.background = "#f886f4";
		icon.innerHTML = "<img src='images/gate.png' style='vertical-align:top'>";
		teks.innerHTML = "<span style='margin-left:10px'>Toll Gate</span><br><b><span style='margin-left:10px'>"+eventName+"</span></b>";
	}else {
		notif.style.background = "#9186f8";
		icon.innerHTML = "<img src='images/rest.png' style='vertical-align:top'>";
		teks.innerHTML = "<span style='margin-left:10px'>Rest Area</span><br><b><span style='margin-left:10px'>"+eventName+"</span></b>";
	};
	notif.id = notifID;
	notif.style.color = "#FFF";
	notif.style.position = "relative";
	notif.style.width = "100%";
	notif.style.height = "200px";
	notif.style.position = "relative";
	notif.style.marginTop = "3px";
	
	icon.style.paddingTop = "20px";
	icon.style.paddingLeft = "20px";
	icon.style.width = "120px";
	icon.style.height= "120px";
	icon.style.position = "relative";
	icon.style.float = "left";

	teks.style.position = "relative";
	teks.style.paddingTop = "20px";
	//teks.style.Left = "100px";
	teks.style.float = "left";

	var container = document.getElementById("listContainer");
	container.appendChild(notif);
	var container1 = document.getElementById(""+notifID+"");
	container1.appendChild(icon);
	container1.appendChild(teks);
	var temp = notifID-1;
	if (notifID != 1){
		$("#"+notifID+"").insertBefore("#"+temp+"");
	}
	notifSound.play();
} 

$(function(){});