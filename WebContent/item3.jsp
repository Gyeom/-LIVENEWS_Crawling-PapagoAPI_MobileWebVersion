<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  JSP에서 jsoup을 사용하기 위해 import -->

<%@ page import="org.jsoup.Jsoup"%>

<%@ page import="org.jsoup.nodes.Document"%>

<%@ page import="org.jsoup.nodes.Element"%>

<%@ page import="org.jsoup.select.Elements"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	box-sizing: border-box
}

body {
	font-family: Verdana, sans-serif;
	margin: auto;
}

.mySlides {
	display: none
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 15rem;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	border-top-color: black;
	border-top-style: solid;
	opacity: 0.7;
	font-size: 1.2rem;
	font-weight: bold;
	padding: 8px 12px;
	width: 100%;
	text-align: center;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}

p {
	text-align: center;
}
</style>
</head>
<body>
	<%
		ArrayList<String> newsImage = new ArrayList<String>();
		ArrayList<String> newsAddress = new ArrayList<String>();
		String newsContent = "";
		String newsContent2 = "";
		String newsContent3 = "";
		Document doc = Jsoup.connect("https://www.ccn.com/?s=Trade industry").get();

		Elements hotNews = doc.select("div.row");
		Elements news = hotNews.select("div.post-thumbnail > a");
		//newsAddress.add(news.attr("href"));      

		for (Element e : news) {
			newsAddress.add(e.attr("href"));
		}

		Document docs1 = Jsoup.connect(newsAddress.get(0)).get();
		Document docs2 = Jsoup.connect(newsAddress.get(1)).get();
		Document docs3 = Jsoup.connect(newsAddress.get(2)).get();
		String headline = docs1.select("header > h1").first().text();
		Element hotNewsin = docs1.select("div.entry-content").get(0);
		Element imgs = hotNewsin.select("div.post-thumbnail > a > img").first();
		newsImage.add(imgs.attr("src"));

		String headline2 = docs2.select("header > h1").first().text();
		Element hotNewsin2 = docs2.select("div.entry-content").get(0);
		Element imgs2 = hotNewsin2.select("div.post-thumbnail > a > img").first();
		newsImage.add(imgs2.attr("src"));

		String headline3 = docs3.select("header > h1").first().text();
		Element hotNewsin3 = docs3.select("div.entry-content").get(0);
		Element imgs3 = hotNewsin3.select("div.post-thumbnail > a > img").first();
		newsImage.add(imgs3.attr("src"));
		//Elements imgs = hotNewsin.select("div.post-thumbnail > img");

		//for(Element e : imgs) {
		//newsImage.add(e.attr("src"));
		//}

		Elements content = hotNewsin.select("div.entry-content > p");
		for (Element e : content) {

			newsContent += e.text();

		}

		Elements content2 = hotNewsin2.select("div.entry-content > p");
		for (Element e : content2) {

			newsContent2 += e.text();

		}

		Elements content3 = hotNewsin3.select("div.entry-content > p");
		for (Element e : content3) {

			newsContent3 += e.text();

		}
	%>



	<div class="slideshow-container">

		<div class="mySlides fade">
			<div class="text"><%=headline%></div>
			<img src=<%=newsImage.get(0)%>
				style="width: 100%; height: 20rem; opacity: 0.7;">
			<p id="send_text" style="opacity: 0.5;"><%=newsContent.substring(0, newsContent.indexOf(".") + 1)%>
			</p>

			<span id="test"
				style="position: relative; float: right; CURSOR: hand"
				onclick="if(plain.style.display=='none'){plain.style.display=''; test.style.display='none'; test2.style.display=''; test2.innerText = '▲ 닫기'}">▼
				더보기</span>
			<div id="plain"
				style="position: relative; float: right; display: none">
				<p id="send_text2" style="opacity: 0.5;"><%=newsContent.substring(newsContent.indexOf(".") + 1)%></p>
			</div>
			<span id="test2"
				style="position: relative; display: none; float: right; CURSOR: hand"
				onclick="if(plain.style.display==''){plain.style.display = 'none'; test.style.display=''; test2.style.display='none'; test.innerText = '▼ 더보기'}">▲
				닫기</span>
		</div>

		<div class="mySlides fade">
			<div class="text"><%=headline2%></div>
			<img src=<%=newsImage.get(1)%>
				style="width: 100%; height: 20rem; opacity: 0.7;">
			<p id="send_text3" style="opacity: 0.5;"><%=newsContent2.substring(0, newsContent2.indexOf(".") + 1)%></p>
			<span id="test3"
				style="position: relative; float: right; CURSOR: hand"
				onclick="if(plain2.style.display=='none'){plain2.style.display=''; test3.style.display='none'; test4.style.display=''; test4.innerText = '▲ 닫기'}">▼
				더보기</span>
			<div id="plain2"
				style="position: relative; float: right; display: none">
				<p id="send_text4" style="opacity: 0.5;"><%=newsContent2.substring(newsContent2.indexOf(".") + 1)%></p>
			</div>
			<span id="test4"
				style="position: relative; display: none; float: right; CURSOR: hand"
				onclick="if(plain2.style.display==''){plain2.style.display = 'none'; test3.style.display=''; test4.style.display='none'; test3.innerText = '▼ 더보기'}">▲
				닫기</span>
		</div>

		<div class="mySlides fade">
			<div class="text"><%=headline3%></div>
			<img src=<%=newsImage.get(2)%>
				style="width: 100%; height: 20rem; opacity: 0.7;">
			<p id="send_text5" style="opacity: 0.5;"><%=newsContent3.substring(0, newsContent3.indexOf(".") + 1)%></p>
			<span id="test5"
				style="position: relative; float: right; CURSOR: hand"
				onclick="if(plain3.style.display=='none'){plain3.style.display=''; test5.style.display='none'; test6.style.display=''; test6.innerText = '▲ 닫기'}">▼
				더보기</span>
			<div id="plain3"
				style="position: relative; float: right; display: none">
				<p id="send_text6" style="opacity: 0.5;"><%=newsContent3.substring(newsContent3.indexOf(".") + 1)%></p>
			</div>
			<span id="test6"
				style="position: relative; display: none; float: right; CURSOR: hand"
				onclick="if(plain3.style.display==''){plain3.style.display = 'none'; test5.style.display=''; test6.style.display='none'; test5.innerText = '▼ 더보기'}">▲
				닫기</span>
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>

	</div>
	<br>
	<div style="clear: both;"></div>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>

	<br>
	<button id="jsonConvertStringSend" type="button"
		style="display: block; margin: 0 auto; font-weight:bold">▼ 번역하기 </button>
	<br>
	<div style="display: flex; justify-content: center;">
		<textarea id="result_text" class="form-control" name="content"
			rows="5" placeholder="위에 '번역하기'버튼을 눌러주시면 한글로 번역됩니다." onkeydown="resize(this)" onkeyup="resize(this)"
			style="min-height:50px; width:100%; "></textarea>
	</div>
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
			$("#result_text").val("");
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";

			//번역을 위해서 button 이벤트를 위해서 사용하는 것
			$('#jsonConvertStringSend').click(
					function() {
						//번역할 object를 생성 
						if (slideIndex == 1) {
							var test = {
								"original_str" : $("#send_text").text()+$("#send_text2").text()
							};
						} else if (slideIndex == 2) {
							var test = {
								"original_str" : $("#send_text3").text()+$("#send_text4").text()
							};
						} else if (slideIndex == 3) {
							var test = {
								"original_str" : $("#send_text5").text()+$("#send_text6").text()
							};
						}
						jsonSend(test);
					});

			function jsonSend(test) {
				$.ajax({
					type : "POST",
					url : "http://localhost:8181/Joongang/NMTTestServlet",
					data : test, //json을 보내는 방법
					success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
						console.log(data);
						//alert(data);

						//string의 값을 object 형식으로 변환합니다.
						var resulut_obj = JSON.parse(data);

						//결과값을 textarea에 넣기 위해서
						$("#result_text").val(
								resulut_obj.message.result.translatedText);
					},
					error : function(e) {
						console.log(e);
						alert('실패했습니다.');
					}
				});
			}

		}
		
		
		
		function resize(obj){
			obj.style.height = "1px";
			obj.style.height = (12+obj.scrollHeight)+"px";
		}
	</script>

</body>
</html>
