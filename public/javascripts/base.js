var playerStatus = new Array();
playerStatus[0] = 'NA';
playerStatus[1] = '';
playerStatus[2] = '';
playerStatus[3] = '';

var lastPlayer = 0;

function changeBgColor(elem, c) { elem.style.backgroundColor = c; }
function changeColor(elem, c) { elem.style.color = c; }

var numOfImages = 12; /* Change this to the number of images you want to use */
var prevIndx = 1;
function changeExample(elem) {
	if (prevIndx == 1) {indx=Math.floor(Math.random()*(numOfImages-1))+1;}
	elem.style.backgroundImage = "url(/images/examples/" + indx + ".jpg)"; 
	if (indx == numOfImages) { indx = 1; } else { indx++; }
	prenIndx = indx;
}

var r = new Array();
r[0] = 20;
r[1] = 30;
r[2] = 40;
var cnt = 0;
function startExamples() {
	runExamples(r[0],1);runExamples(r[1],2);runExamples(r[2],3);
}

function runExamples(n, i) {
	if (cnt > 20) {
		r[0] = 10000;r[1] = 4300;r[2] = 3600;
	}
	changeExample(document.getElementById('example' + i));
	setTimeout("runExamples("+r[i-1]+","+i+")",r[i-1]);
	cnt++;
} 

var tStart  = new Date();
var m = 19; s = 0; ms = 0;
function updateTimer() {
   	var tDate = new Date();

   	tDate.setTime(tDate.getTime() - tStart.getTime());
   	s = tDate.getSeconds();
   	ms= tDate.getMilliseconds();
   	if 		(ms < 10) {ms = '00' + ms;}
   	else if	(ms < 100 && ms > 9) {ms = '0' + ms};
   	if 		(s < 10) { str = '12:19:0' + s + '.' + ms; }
   	else if	(s < 60) { str = '12:19:' + s + '.' + ms; }
   	else { str = '12:19:00.' + ms; }
   	document.getElementById("display1").innerHTML = '<div style="font-weight:normal;color:#fff;text-align:left;padding:38px">' + s + '</div>';
	document.getElementById("display2").innerHTML = '<div style="font-weight:normal;color:#fff;text-align:right;padding:38px">' + ms + '</div>';
	
	if (s % 65 == 0) {
		if (playerStatus[1] != 'playing' && playerStatus[2] != 'playing' && playerStatus[3] != 'playing') {
			startPlayer(0);
		}
	}
	
   	setTimeout("updateTimer()", 45);
}


function doOnload() {
	startPlayer(1);
	startExamples();	
	updateTimer();
}

var lastVideo = '3.flv';
function startPlayer(n) {
	n=Math.floor(Math.random()*(2))+1;
	if (lastVideo == '3.flv') lastVideo = '3.flv'; else lastVideo = '3.flv';
	var player = 'player' + n;
	document.getElementById(player).style.display = 'block';
	flowplayer(player, "/flowplayer/flowplayer.swf", {
		clip: {
			url: '/video/' + lastVideo,
			autoPlay: true,
			onLastSecond: function(clip) {
				hidePlayer(n);
			}	
		},
		logo: { 
		    fullscreenOnly: true
		},
		plugins: {
			controls: null
		}
	});
	document.getElementById("display" + n).style.display = 'none';
	playerStatus[n] = 'playing';
	lastPlayer = n;
}

function hidePlayer(n) {
	document.getElementById('display'+n).style.display = 'block';
	document.getElementById('player'+n).style.display = 'none';
	
	playerStatus[n] = 'hidden';
}







