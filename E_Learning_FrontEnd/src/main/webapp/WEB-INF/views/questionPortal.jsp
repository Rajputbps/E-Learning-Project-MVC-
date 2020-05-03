<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/css/questionPortal.css" rel="stylesheet" type="text/css"> 
 <script src="resources/JavaScript/questionPortal.js"></script>
</head>
 <%@include file="header.jsp"%>
<body>


 <section class="section" style="padding-top: 10%;">
    <div class="container-fluid">
       <div class="columns">
  <div class="column is-one-fifth" style="border-right-style: solid;border-color: blue;">

<aside class="menu">
  <p class="menu-label">
    General
  </p>
  <nav class="tabs is-boxed is-fullwidth is-large is-hidden">
        <div class="container">
          <ul>
          <li class="tab is-active" onclick="openTab(event,'allQuestion')"><a >All</a></li>
            <li class="tab " onclick="openTab(event,'WebDev')"><a >Web Development</a></li>
            <li class="tab" onclick="openTab(event,'WebAud')"><a >Website Audit</a></li>
            <li class="tab" onclick="openTab(event,'Support')"><a >Support</a></li>
             <li class="tab" onclick="openTab(event,'answerofquestion')"><a></a></li>
              <li class="tab" onclick="openTab(event,' askquestion')"><a>Ask Question</a></li>
          </ul>
        </div>
      </nav>
  <ul class="menu-list">
   <li class="tab is-active" onclick="openTab(event,'allQuestion')"><a >All</a></li>
    <li class="tab" onclick="openTab(event,'WebDev')"><a>Languages</a></li>
    <li class="tab" onclick="openTab(event,'WebAud')"><a>Framework</a></li>
    <li class="tab" onclick="openTab(event,'Support')"><a >Users</a></li>
    <hr>
    <li class="tab" onclick="openTab(event,'askquestion')"><button class="button is-success is-outlined">Ask Question</button></li>
  </ul>
   
</aside>   

  </div>
  <div class="column">  
  <div>
  <!-- All Question -->
  
  <div class="container">
    <div id="allQuestion" class="content-tab" >
        <div>
 <strong class="is-size-3">All Questions</strong>
 </div>
 <br>
<div>
<div>
<a class="question"  class="tab" onclick="openTab(event,'answerofquestion')"><b class="is-size-4">Q </b>:- On Button Click Data is not inserted in MySQL Database through android code</a> 
</div>
<div class="questionDiscription">
I am developing one application and in that i am using mysqli database. When i click on submit button it submitted successfully but data is not inserted in my database table. This is my php code: In ...
</div> 
<div style="padding-top: 1%;">
<nav class="level">
  <div class="level-item has-text-centered">
    <div>
    <p class="heading">asked 4 mins ago</p>
    <a href="#" class="is-size-6">Bhanu pratap singh </a>
    </div>
  </div>
  <div class="level-item has-text-centered">  
    <div>
      <p class="heading">Votes</p>
      <p class="is-size-6"><button class="button is-white"><i class="far fa-hand-point-up "></i>123</button></p>
    </div>
  </div>
  <div class="level-item has-text-centered">
    <div>
    <p class="heading">Answers</p>
     <a href="#" class="is-size-6">456
      </a>
    </div> 
  </div> 
</nav>
</div>
<hr>
<div class="is-divider 5rem"></div>
</div>
    </div>
    <div  id="WebDev" class="content-tab" style="display:none"> 
    <div class="columns">
  <div class="column ">
    
  </div>
  <div class="column">
    Second column
  </div>
  <div class="column">
    Third column
  </div>
  <div class="column">
    Fourth column
  </div>
</div>
    </div>
    <div id="WebAud" class="content-tab" style="display:none">
    B
    </div>
    <div id="Support" class="content-tab" style="display:none"> 
    
    
     <div class="columns">
  <div class="column ">
    <article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="content">
      <p>
        <a href="#"><strong>Yash Bhagat</strong></a> <br><small>yb@gmail.com</small>
        <br>
           Java,Python,php
      </p>
    </div>
  </div>
</article>
  </div>
  <div class="column">
   <article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="content">
      <p>
        <a href="#"><strong>John Smith</strong></a> <br><small>@johnsmith</small>
        <br>
           Java,Python,php
      </p>
    </div>
  </div>
</article>
  </div>
  <div class="column">
   <article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="content">
      <p>
        <a href="#"><strong>John Smith</strong></a> <br><small>@johnsmith</small> 
        <br>
           Java,Python,php
      </p>
    </div>
  </div>
</article>
  </div>
  <div class="column">
    <article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="content">
      <p>
        <a href="#"><strong>Bhanu Pratap Singh</strong></a> <br><small>bhanupratapsingh4433@gmail.com</small> 
        <br>
           Java,Python,php
      </p>
    </div>
  </div>
</article>
  </div>
</div>
    </div>
</div>
  </div>
  
  <!-- ------------------------------------------- Question Tab ------------------------------------------- -->
  
  
    <div id="askquestion" class="content-tab" style="display:none">
  
  <div>
  <article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="field">
      <p class="control">
        <textarea class="textarea" placeholder="Your Question..."></textarea>
      </p>
    </div>
     <div class="field">
      <p class="control">
        <textarea class="textarea" placeholder="Description of your question..."></textarea>
      </p>
    </div>
    <div class="field">
      <p class="control">
        <textarea class="textarea" placeholder="Code..."></textarea>
      </p>
    </div>
    <nav class="level">
      <div class="level-left">
        <div class="level-item">
          <a class="button is-info">Submit</a>
        </div>
      </div> 
    </nav>
  </div>
</article>
  </div>
  
  </div>
  
  
  
  <!-- ---------------------------------------------------- Answer tab ---------------------------------------------------- -->
  
  <div id="answerofquestion" class="content-tab" style="display:none">
  
  <div>
  <article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="content">
      <p>
       <b class="is-size-4">Q :- On Button Click Data is not inserted in MySQL Database through android code</b>
        <br>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta eros lacus, nec ultricies elit blandit non. Suspendisse pellentesque mauris sit amet dolor blandit rutrum. Nunc in tempus turpis.
        <br>
        <div><small><a>10 Votes<i class="far fa-hand-point-up"></i></a> <span class="is-pulled-right"> <a>Hari </a>  .3 hrs</span></small></div>
      </p>
    </div>

    <article class="media">
      <figure class="media-left">
        <p class="image is-48x48">
          <img src="https://bulma.io/images/placeholders/96x96.png">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong>Sean Brown</strong>
            <br>
            Donec sollicitudin urna eget eros malesuada sagittis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam blandit nisl a nulla sagittis, a lobortis leo feugiat.
            <br>
            <small><a> 55 Like <i class="fas fa-thumbs-up"></i></a>· 2 hrs</small>
          </p>
        </div>
      </div>
    </article>

    <article class="media">
      <figure class="media-left">
        <p class="image is-48x48">
          <img src="https://bulma.io/images/placeholders/96x96.png">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong>Kayli Eunice </strong>
            <br>
            Sed convallis scelerisque mauris, non pulvinar nunc mattis vel. Maecenas varius felis sit amet magna vestibulum euismod malesuada cursus libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacinia non nisl id feugiat.
            <br>
            <small><a>22 Like <i class="fas fa-thumbs-up"></i></a>· 2 hrs</small>
          </p>
        </div>
      </div>
    </article>
  </div>
</article>
<article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="field">
      <p class="control">
        <textarea class="textarea" placeholder="Add a comment..."></textarea>
      </p>
    </div>
    <div class="field">
      <p class="control">
        <button class="button">Post comment</button>
      </p>
    </div>
  </div>
</article>
  </div>
  
  </div>
  
  
  
  </div> 
</div>


<!-- -------------------------------------- User Detail part --------------------------------------------  -->



    </div>
  </section>




 
</body>
</html>