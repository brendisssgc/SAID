<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%! String email=null;%>
<% HttpSession sesion= request.getSession();
if(sesion.getAttribute("email")==null){response.sendRedirect("../index.jsp");}else{
        email=(String)sesion.getAttribute("email");}
        %>
        

<!DOCTYPE html>

<html>
	<head>
		<meta name="author" content=""></meta>
		<meta name="keywords" content=""></meta> 

		<title>Fisica I</title>
		<link rel='stylesheet' href='style.css'>
	
		<script language="javascript" type="text/javascript"> 
			function BrowserCheck() {
				var b = navigator.appName
				this.mac = (navigator.appVersion.indexOf('Mac') != -1)
				if (b=="Netscape") this.b = 'ns'
				else if (b=="Micros;oft Internet Explorer") this.b = 'ie'
				else this.b = b
				this.version = navigator.appVersion
				this.v = parseInt(this.version)
				this.ns = (this.b=="ns" && this.v>=5)
				this.ns5 = (this.b=="ns" && this.v==5)
				this.ns6 = (this.b=="ns" && this.v==5)
				this.ie = (this.b=="ie" && this.v>=4)
				this.ie4 = (this.version.indexOf('MSIE 4')>0)
				this.ie5 = (this.version.indexOf('MSIE 5')>0)
				if (this.mac) this.ie = this.ie5
				this.ie5mac = (this.ie5 && this.mac);
				this.min = (this.ns||this.ie)
			}

			is = new BrowserCheck();

			if ((is.min == false)||(is.ie5mac)){
				alert('Your browser can\'t handle this page. You need NS6 or IE5 on Windows, or NS6 on Mac.');
			}

			function Card(ID){
				this.elm=document.getElementById(ID);
				this.name=ID;
				this.css=this.elm.style;
				this.elm.style.left = 0 +'px';
				this.elm.style.top = 0 +'px';
				this.HomeL = 0;
				this.HomeT = 0;
				this.tag=-1;
				this.index=-1;
			}

			function CardGetL(){return parseInt(this.css.left)}
			Card.prototype.GetL=CardGetL;

			function CardGetT(){return parseInt(this.css.top)}
			Card.prototype.GetT=CardGetT;

			function CardGetW(){return parseInt(this.elm.offsetWidth)}
			Card.prototype.GetW=CardGetW;

			function CardGetH(){return parseInt(this.elm.offsetHeight)}
			Card.prototype.GetH=CardGetH;

			function CardGetB(){return this.GetT()+this.GetH()}
			Card.prototype.GetB=CardGetB;

			function CardGetR(){return this.GetL()+this.GetW()}
			Card.prototype.GetR=CardGetR;

			function CardSetL(NewL){this.css.left = NewL+'px'}
			Card.prototype.SetL=CardSetL;

			function CardSetT(NewT){this.css.top = NewT+'px'}
			Card.prototype.SetT=CardSetT;

			function CardSetW(NewW){this.css.width = NewW+'px'}
			Card.prototype.SetW=CardSetW;

			function CardSetH(NewH){this.css.height = NewH+'px'}
			Card.prototype.SetH=CardSetH;

			function CardInside(X,Y)
			{
				var Result=false;
				if(X>=this.GetL()){if(X<=this.GetR()){if(Y>=this.GetT()){if(Y<=this.GetB()){Result=true;}}}}
				return Result;
			}
			Card.prototype.Inside=CardInside;

			function CardSwapColours()
			{
				var c=this.css.backgroundColor;
				this.css.backgroundColor=this.css.color;
				this.css.color=c;
			}
			Card.prototype.SwapColours=CardSwapColours;

			function CardHighlight()
			{
				this.css.backgroundColor='#000000';
				this.css.color='#b6efdf';
			}
			Card.prototype.Highlight=CardHighlight;

			function CardUnhighlight()
			{
				this.css.backgroundColor='#b6efdf';
				this.css.color='#000000';
			}
			Card.prototype.Unhighlight=CardUnhighlight;

			function CardOverlap(OtherCard)
			{
				var smR=(this.GetR()<(OtherCard.GetR()+10))? this.GetR(): (OtherCard.GetR()+10);
				var lgL=(this.GetL()>OtherCard.GetL())? this.GetL(): OtherCard.GetL();
				var HDim=smR-lgL;
				if (HDim<1){return 0;}
				var smB=(this.GetB()<OtherCard.GetB())? this.GetB(): OtherCard.GetB();
				var lgT=(this.GetT()>OtherCard.GetT())? this.GetT(): OtherCard.GetT();
				var VDim=smB-lgT;
				if (VDim<1){return 0;}
				return (HDim*VDim);	
			}
			Card.prototype.Overlap=CardOverlap;

			function CardDockToR(OtherCard)
			{
				this.SetL(OtherCard.GetR() + 5);
				this.SetT(OtherCard.GetT());
			}

			Card.prototype.DockToR=CardDockToR;

			function CardSetHome()
			{
				this.HomeL=this.GetL();
				this.HomeT=this.GetT();
			}
			Card.prototype.SetHome=CardSetHome;

			function CardGoHome()
			{
				this.SetL(this.HomeL);
				this.SetT(this.HomeT);
			}

			Card.prototype.GoHome=CardGoHome;

			var CorrectResponse = 'Bien';
			var IncorrectResponse = 'Incorrecto! Prueba otra vez';
			var YourScoreIs = 'Tu puntuaci&#243;n es:';
			var Correction = '[strCorrection]';
			var DivWidth = 400; 
			var FeedbackWidth = 200; 
			var ExBGColor = '#b6efdf';
			var PageBGColor = '#02bdbd';
			var TextColor = '#000000';
			var TitleColor = '#000000';
			var Penalties = 0;

			var CurrDrag = -1;
			var topZ = 100;

			function PageDim()
			{
				this.W = 600;
				this.H = 400;
				if (is.ns) this.W = window.innerWidth;
				if (is.ie) this.W = document.body.clientWidth;
				if (is.ns) this.H = window.innerHeight;
				if (is.ie) this.H = document.body.clientHeight;
			}

			var pg = null;
			var DivWidth = 600;
			var DragWidth = 200;
			var LeftColPos = 100;
			var RightColPos = 500;
			var DragTop = 120;

			FC = new Array();
			DC = new Array();

			function doDrag(e) 
			{
				if (CurrDrag == -1) {return};
				if (is.ie){var Ev = window.event}else{var Ev = e}
				var difX = Ev.clientX-window.lastX; 
				var difY = Ev.clientY-window.lastY; 
				var newX = DC[CurrDrag].GetL()+difX; 
				var newY = DC[CurrDrag].GetT()+difY; 
				DC[CurrDrag].SetL(newX); 
				DC[CurrDrag].SetT(newY);
				window.lastX = Ev.clientX; 
				window.lastY = Ev.clientY; 
				return false;
			} 

			function beginDrag(e, DragNum) 
			{ 
				CurrDrag = DragNum;
				if (is.ie)
				{
					var Ev = window.event;
					document.onmousemove=doDrag;
					document.onmouseup=endDrag;
				}
				else{
					var Ev = e;
					window.onmousemove=doDrag; 
					window.onmouseup=endDrag;
				} 
				DC[CurrDrag].Highlight();
				topZ++;
				DC[CurrDrag].css.zIndex = topZ;
				window.lastX=Ev.clientX; 
				window.lastY=Ev.clientY;
				return true;  
			} 

			function endDrag(e) 
			{ 
				if (CurrDrag == -1) {return};
				DC[CurrDrag].Unhighlight();
				if (is.ie){document.onmousemove=null}
				else{window.onmousemove=null;}
				onEndDrag();	
				CurrDrag = -1;
				return true;
			} 

			function onEndDrag()
			{ 
				var Docked = false;
				var DropTarget = DroppedOnFixed(CurrDrag);
				if (DropTarget > -1)
				{
					for (var i=0; i<DC.length; i++)
					{
						if (DC[i].tag == DropTarget+1)
						{
							DC[i].GoHome();
							DC[i].tag = 0;
							D[i][2] = 0;
						}
					}

					DC[CurrDrag].DockToR(FC[DropTarget]);
					D[CurrDrag][2] = F[DropTarget][1];
					DC[CurrDrag].tag = DropTarget+1;
					Docked = true;
				}

				if (Docked == false)
				{
					DC[CurrDrag].GoHome();
					DC[CurrDrag].tag = 0;
					D[CurrDrag][2] = 0;
				}
			} 

			function DroppedOnFixed(DNum)
			{
				var Result = -1;
				var OverlapArea = 0;
				var Temp = 0;
				for (var i=0; i<FC.length; i++)
				{
					Temp = DC[DNum].Overlap(FC[i]);
					if (Temp > OverlapArea)
					{
						OverlapArea = Temp;
						Result = i;
					}
				}
				return Result;
			}

			function StartUp()
			{
				pg = new PageDim();
				DivWidth = Math.floor((pg.W*4)/5);
				DragWidth = Math.floor((DivWidth*3)/10);
				LeftColPos = Math.floor(pg.W/10);
				RightColPos = pg.W - (DragWidth + LeftColPos);
				DragTop = parseInt(document.getElementById('TitleDiv').offsetHeight) + 10;

				var CurrDiv = document.getElementById('FeedbackDiv');
				CurrDiv.style.top = DragTop + 5 + 'px';
				CurrDiv.style.left = Math.floor((pg.W)/3) + 'px';
				CurrDiv.style.width = Math.floor(pg.W/3) + 'px';
				CurrDiv.style.display = 'none';

				D = Shuffle(D);

				var CurrTop = DragTop;
				var TempInt = 0;
				var DropHome = 0;
				var Widest = 0;

				for (var i=0; i<F.length; i++)
				{
					FC[i] = new Card('F' + i);
					FC[i].elm.innerHTML = F[i][0] + '<br clear="all" />';

					if (FC[i].GetW() > Widest)
					{
						Widest = FC[i].GetW();
					}
				}

				if (Widest > DragWidth){Widest = DragWidth;}

				CurrTop = DragTop;

				DragWidth = Math.floor((DivWidth-Widest)/2) - 24;
				RightColPos = DivWidth + LeftColPos - (DragWidth + 14);
				var Highest = 0;
				var WidestRight = 0;

				for (i=0; i<D.length; i++)
				{
					DC[i] = new Card('D' + i);
					DC[i].elm.innerHTML = D[i][0] + '<br clear="all" />';
					if (DC[i].GetW() > DragWidth){DC[i].SetW(DragWidth);}
					DC[i].css.cursor = 'move';
					DC[i].css.backgroundColor = '#b6efdf';
					DC[i].css.color = '#000000';
					TempInt = DC[i].GetH();
					if (TempInt > Highest){Highest = TempInt;}
					TempInt = DC[i].GetW();
					if (TempInt > WidestRight){WidestRight = TempInt;}
				}

				var HeightToSet = Highest;
				if (is.ns||is.ie5mac){HeightToSet -= 12;}
				var WidthToSet = WidestRight;
				if (is.ns||is.ie5mac){WidthToSet -= 12;}

				for (i=0; i<D.length; i++)
				{
					DC[i].SetT(CurrTop);
					DC[i].SetL(RightColPos);
					if (DC[i].GetH() < Highest)
					{
						DC[i].SetH(HeightToSet);
					}
					if (DC[i].GetW() < WidestRight)
					{
						DC[i].SetW(WidthToSet);
					}
					DC[i].SetHome();
					DC[i].tag = -1;
					CurrTop = CurrTop + DC[i].GetH() + 5;
				}

				CurrTop = DragTop;

				for (var i=0; i<F.length; i++)
				{
					FC[i].SetW(Widest);
					if (FC[i].GetH() < Highest)
					{
						FC[i].SetH(HeightToSet);
					}
					FC[i].SetT(CurrTop);
					FC[i].SetL(LeftColPos);
					FC[i].SetHome();
					TempInt = FC[i].GetH();
					CurrTop = CurrTop + TempInt + 5;
				}
			}

			F = new Array();
			F[0] = new Array();
			F[0][0]='Prodcuto cruz';
			F[0][1] = 1;
			F[1] = new Array();
			F[1][0]='Producto punto';
			F[1][1] = 2;
			F[2] = new Array();
			F[2][0]='La __________ es v/t';
			F[2][1] = 3;
			F[3] = new Array();
			F[3][0]='En la grafica aceleracion contra tiempo representa';
			F[3][1] = 4;
			F[4] = new Array();
			F[4][0]='La diferencia entre la medici�n y el valor promedio';
			F[4][1] = 5;
			F[5] = new Array();
			F[5][0]='Es el cociente entre el error absoluto y el valor promedio';
			F[5][1] = 6;
			F[6] = new Array();
			F[6][0]='Es la comparacion de un ojbeto con un patron de medida';
			F[6][1] = 7;

			D = new Array();
			D[0] = new Array();
			D[0][0]='r x s';
			D[0][1] = 1;
			D[0][2] = 0;
			D[1] = new Array();
			D[1][0]='r*s';
			D[1][1] = 2;
			D[1][2] = 0;
			D[2] = new Array();
			D[2][0]='aceleraci&oacute;n';
			D[2][1] = 3;
			D[2][2] = 0;
			D[3] = new Array();
			D[3][0]='El desplazamiento';
			D[3][1] = 4;
			D[3][2] = 0;
			D[4] = new Array();
			D[4][0]='Error absoluto';
			D[4][1] = 5;
			D[4][2] = 0;
			D[5] = new Array();
			D[5][0]='Error relativo';
			D[5][1] = 6;
			D[5][2] = 0;
			D[6] = new Array();
			D[6][0]='Medir';
			D[6][1] = 7;
			D[6][2] = 0;

			function Shuffle(InArray){
				Temp = new Array();
				var Len = InArray.length;

				var j = Len;

				for (var i=0; i<Len; i++){
					Temp[i] = InArray[i];
				}

				for (i=0; i<Len; i++){
					Num = Math.floor(j  *  Math.random());
					InArray[i] = Temp[Num];

					for (var k=Num; k < j; k++) {
						Temp[k] = Temp[k+1];
					}
					j--;
				}
				return InArray;
			}

			function TimerStartUp(){
				setTimeout('StartUp()', 300);
			}

			function CheckAnswer(){
				var TotalCorrect = 0;
				var Score = 0;
				var Response = '';
                                var ajax=null;
                                var rresponse=null;
                                if (window.XMLHttpRequest) {
                                    // Si es Mozilla, Safari etc
                                    ajax = new XMLHttpRequest ();
                                   }else{alert("Exception AJAX");} 

				var i, j;
				for (i=0; i<D.length; i++){
					if ((D[i][2] == D[i][1])&&(D[i][2] > 0)){
						TotalCorrect++;
					}
					else{
						DC[i].GoHome();
					}
				}

				Score = Math.floor((100*(TotalCorrect-Penalties))/F.length);

				if (TotalCorrect == F.length) {
					Response = YourScoreIs + ' ' + Score + '%.<br />' + CorrectResponse;
					WriteFeedback(Response);

				}
				else {
					Response = IncorrectResponse + '<br />' + YourScoreIs + ' ' + Score + '%.';
					WriteFeedback(Response);
					Penalties++;
				}
                                
	
                         //alert("ola");
                            ajax.open("POST","Cpun.jsp",true);

                            ajax.onreadystatechange = function() {

                                if (ajax.readyState==4) {
                                    rresponse=ajax.responseText;
                                    alert(rresponse);
                                    if(rresponse.indexOf("si")!=-1){alert("Nuevo record");}else{alert("Sigue practicando para superarte");}
                                }

                            }

                            ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                alert("<%=email%>");
                                ajax.send("pun="+Score+"&email=<%=email%>");
                                
       
        




  
			}

			function WriteFeedback(Feedback){
				var Output = Feedback + '<br /><br />';
				Output += '<form><input type="button" value="Aceptar"';
				Output += ' onclick="HideFeedback()"></form>';
				var FDiv = document.getElementById('FeedbackDiv');
				FDiv.innerHTML = Output;
				topZ++;
				FDiv.style.zIndex = topZ;
				document.getElementById('FeedbackDiv').style.borderStyle = 'solid';
				FDiv.style.display='';
			}

			function HideFeedback(){
				var FDiv = document.getElementById('FeedbackDiv');
				FDiv.innerHTML = '';
				FDiv.style.display='none';
			}
		</script>
	</head> 

	<body onload="TimerStartUp()" background=""> 
		<div class="Titles" id="TitleDiv">
				<form name="NavButtons1" action="">
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td class="NavBar">
									<input type="button" value="Regresar el menu anterior" onclick="location=''"></input>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<h3>Conceptos b�sicos</h3>
				Completa los conceptos moviendo los cuadros con la palabra de la derecha hac�a la izquierda <br/>
				Una vez que termines oprime el bot�n comprobar <br/>
				
				<form action="" class='com'>
					<input type="button" value="Comprobar" onclick="CheckAnswer()">
					</input>
				</form>
		</div>
		
		<div class="Feedback" id="FeedbackDiv"> </div>

		<script language="javascript" type="text/javascript">
			for (var i=0; i<F.length; i++)
			{
				document.write('<div id="F' + i + '" class="CardStyle1"> </div>');
			}

			for (var i=0; i<D.length; i++)
			{
				document.write('<div id="D' + i + '" class="CardStyle1" onmousedown="beginDrag(event, ' + i + ')"> </div>');
			}
		</script>
		
		<script type="text/javascript">
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		</script>
		
		<script type="text/javascript">
			try {
				var pageTracker = _gat._getTracker("UA-10297523-1");
				pageTracker._trackPageview();
			} catch(err) {}
		</script>
	</body>
</html>