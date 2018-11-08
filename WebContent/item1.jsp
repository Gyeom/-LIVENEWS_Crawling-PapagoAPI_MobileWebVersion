
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

    <!--  JSP에서 jsoup을 사용하기 위해 import -->

<%@ page import="org.jsoup.Jsoup" %>

<%@ page import="org.jsoup.nodes.Document" %>

<%@ page import="org.jsoup.nodes.Element" %>

<%@ page import="org.jsoup.select.Elements" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin : auto;}
.mySlides {display: none}
img {vertical-align: middle;}

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
  background-color: rgba(0,0,0,0.8);
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

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
p{text-align: center;}
</style>
</head>
<body>
<%
/* String KOREAN = "ko";
String ENGLISH = "en";

// 파파고 API 서버 주소
String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
// 애플리케이션 클라이언트 아이디 값
String clientId = "6jxVIB0bYIj1h1NJleqK";
// 애플리케이션 클라이언트 시크릿 값
String clientSecret = "VAF76f9X5C";

// 차례대로 '변환할 언어', '변환될 언어', '변환할 문장'
String text = "hello";
String str ="";
	try {
    	// 변환할 문장을 UTF-8 유니코드로 인코딩합니다.
    	text = URLEncoder.encode(text, "UTF-8");
    	// 파파고 API 서버와 연결합니다.
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        // 파파고 API 서버로 전달할 파라미터를 설정합니다.
        System.out.println(text);
        String postParams = "source=" + ENGLISH + "&target=" + KOREAN + "&text=" + text;
        // 파파고 API 서버로 번역할 문장을 전송합니다.
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(postParams);
        wr.flush();
        wr.close();
        // 파파고 API 서버로부터 번역된 메시지를 전달 받습니다.
        int responseCode = con.getResponseCode();
        BufferedReader br;
        // 번역에 성공한 경우
        if(responseCode == 200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        }
        // 오류가 발생한 경우
        else {  
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
        // 전달받은 메시지를 출력합니다.
        String inputLine;
        StringBuffer responseBuffer = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            responseBuffer.append(inputLine);
        }
        br.close();
       str = responseBuffer.toString();
	} catch (Exception e) {
		str = "파파고 API 통신 중에 오류가 발생했습니다.";
	}


	System.out.print(str);
 */


















ArrayList<String> newsImage = new ArrayList<String>();
ArrayList<String> newsAddress = new ArrayList<String>();
String newsContent = "";
String newsContent2 = "";
String newsContent3 = "";
    Document doc = Jsoup.connect("https://www.ccn.com/?s=Management industry").get();
   

      Elements hotNews = doc.select("div.row");
      Elements news = hotNews.select("div.post-thumbnail > a");
   //newsAddress.add(news.attr("href"));      

  for(Element e : news){
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
for(Element e : content){
   
   newsContent += e.text();
   
      }

Elements content2 = hotNewsin2.select("div.entry-content > p");
for(Element e : content2){
   
   newsContent2 += e.text();
   
      }

Elements content3 = hotNewsin3.select("div.entry-content > p");
for(Element e : content3){
   
   newsContent3 += e.text();
   
      }

%>


   
<div class="slideshow-container">

<div class="mySlides fade">
    <div class="text"><%=headline%></div>
  <img src=<%=newsImage.get(0)%> style="width:100%; height: 20rem;  opacity: 0.7;">
  <p style=" opacity: 0.5;"><%=newsContent.substring(0,newsContent.indexOf(".")+1)%> </p>
  
  <span id="test" style="position:relative; float:right; CURSOR: hand" onclick="if(plain.style.display=='none'){plain.style.display=''; test.style.display='none'; test2.style.display=''; test2.innerText = '▲ 닫기'}">▼ 더보기</span>
  <div id="plain" style="position:relative; float:right; display: none"><p style=" opacity: 0.5;"><%=newsContent.substring(newsContent.indexOf(".")+1)%></p></div>
    <span id="test2" style="position:relative; display: none; float:right; CURSOR: hand" onclick="if(plain.style.display==''){plain.style.display = 'none'; test.style.display=''; test2.style.display='none'; test.innerText = '▼ 더보기'}">▲ 닫기</span>
</div>

<div class="mySlides fade">
        <div class="text"><%=headline2%></div>
  <img src=<%=newsImage.get(1)%> style="width:100%; height: 20rem; opacity: 0.7;">
  <p style=" opacity: 0.5;"><%=newsContent2.substring(0,newsContent2.indexOf(".")+1)%></p>
  <span id="test3" style="position:relative; float:right; CURSOR: hand" onclick="if(plain2.style.display=='none'){plain2.style.display=''; test3.style.display='none'; test4.style.display=''; test4.innerText = '▲ 닫기'}">▼ 더보기</span>
  <div id="plain2" style="position:relative; float:right; display: none"><p style=" opacity: 0.5;"><%=newsContent2.substring(newsContent2.indexOf(".")+1)%>
</p></div>
    <span id="test4" style="position:relative; display: none; float:right; CURSOR: hand" onclick="if(plain2.style.display==''){plain2.style.display = 'none'; test3.style.display=''; test4.style.display='none'; test3.innerText = '▼ 더보기'}">▲ 닫기</span>
</div>

<div class="mySlides fade">
    <div class="text" ><%=headline3%></div>
  <img src=<%=newsImage.get(2)%> style="width:100%; height: 20rem; opacity: 0.7;">
  <p style=" opacity: 0.5;"><%=newsContent3.substring(0,newsContent3.indexOf(".")+1)%></p>
  <span id="test5" style="position:relative; float:right; CURSOR: hand" onclick="if(plain3.style.display=='none'){plain3.style.display=''; test5.style.display='none'; test6.style.display=''; test6.innerText = '▲ 닫기'}">▼ 더보기</span>
  <div id="plain3" style="position:relative; float:right; display: none"><p style=" opacity: 0.5;"><%=newsContent3.substring(newsContent3.indexOf(".")+1)%>
</p></div>
    <span id="test6" style="position:relative; display: none; float:right; CURSOR: hand" onclick="if(plain3.style.display==''){plain3.style.display = 'none'; test5.style.display=''; test6.style.display='none'; test5.innerText = '▼ 더보기'}">▲ 닫기</span>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>
<div style="clear :both;"></div>
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html> 