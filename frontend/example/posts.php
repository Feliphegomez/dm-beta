<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> Admin </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
      var tabla = 'posts';
      $.noConflict();
      jQuery( document ).ready(function( $ ) {
        // Code that uses jQuery's $ can follow here.
      });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.16/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
    <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/ryanparag/pen/oWrLPr?depth=everything&order=popularity&page=5&q=card+list&show_forks=false" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'><link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>    
  </head>
<body>

<div id="app" class="container">
  <h1> {{ tabla_name }} </h1>
  <div id="movie-card-list">
    <div class="movie-card" v-for="post in posts"  v-bind:style="{ 'background-image': 'url(' + post.post_pictures[0].pictures[0].url + ')' }">
      <div class="color-overlay">
        <div class="movie-share">
          <a class="movie-share__icon" href="#">
            <i class="material-icons">&#xe87d</i>
          </a>
          <a class="movie-share__icon" href="#">
            <i class="material-icons">&#xe253</i>
          </a>
          <a class="movie-share__icon" href="#">
            <i class="material-icons">&#xe80d</i>
          </a>
          </div>
          <div class="movie-content">
            <div class="movie-header">
                <h1 class="movie-title">{{ post.title }}</h1>
                <h4 class="movie-info" v-for="post_categories in post.post_categories">{{ post_categories.id }}</h4>
            </div>
            <p class="movie-desc">{{ post.content }}</p>
            <a class="btn btn-outline" href="#">Watch Pubish</a>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>
  new Vue({
    el: '#app',
    data: {
      tabla_name: tabla,
      posts: []
    },
    methods: {
      cargar: function () {
        axios.get('/dm/api/v2/'+tabla, {
          params: { 
            transform: 1,
            order:'id',
            page:1,
            //filter:'id,eq,1',
            include:'pictures,post_categories,users,tags'
          }
        })
        .then((response)  =>  {
          console.log(response.data[tabla])
          this.posts = response.data[tabla]
          console.log(this.posts)
                        
        }, (error)  =>  {
          console.log('Error: ' + error);
          //this = [];
        })
      }
    },
    created: function(){ 
      this.cargar();
      document.title = this.tabla_name;
    }
  })
</script>

<style class="cp-pen-styles">@import url("https://fonts.googleapis.com/css?family=Montserrat:300,400,700,800");
  body {
    background-color: #dce1e5;
    font-family: "Montserrat", helvetica, arial, sans-serif;
    font-size: 14px;
    color: #cfd6e1;
    line-height: 1.5;
    font-weight: 400;
    max-width: 100%;
    overflow-x: hidden;
  }

  * {
    -webkit-transition: .4s;
    transition: .4s;
  }

  a {
    text-decoration: none;
  }

  .movie-card {
    background-image: url(http://digitalspyuk.cdnds.net/15/47/1600x800/landscape-1447754794-harrison-ford-blade-runner.jpg);
    background-size: contain;
    background-position: -40% 80%;
    background-repeat: no-repeat;
    width: 75%;
    max-width: 800px;
    height: 300px;
    display: block;
    margin: 8vh auto;
    border-radius: 8px;
    -webkit-box-shadow: 0px 8px 12px 0px rgba(0, 0, 0, 0.25);
            box-shadow: 0px 8px 12px 0px rgba(0, 0, 0, 0.25);
  }

  .movie-card:nth-child(2) {
    background-image: url("http://www.blastr.com/sites/blastr/files/back-to-the-future-part-ii-original.jpg");
    background-position: -20% 80%;
  }

  .movie-card:nth-child(3) {
    background-image: url("http://www.dvdactive.com/images/reviews/screenshot/2011/5/akirabdcap8_original.jpg");
    background-position: -20% 80%;
  }

  .color-overlay {
    width: 100%;
    height: 100%;
    border-radius: 8px;
    background: -webkit-gradient(linear, left top, right top, from(rgba(42, 159, 255, 0.2)), color-stop(60%, #212120), to(#212120));
    background: linear-gradient(to right, rgba(42, 159, 255, 0.2) 0%, #212120 60%, #212120 100%);
    background-blend-mode: multiply;
  }

  h1, h2, h3 {
    font-family: "Montserrat", helvetica, arial, sans-serif;
    text-transform: uppercase;
    letter-spacing: 2px;
    line-height: 1;
    font-weight: 400;
  }

  .movie-content {
    width: 40%;
    display: block;
    position: relative;
    float: right;
    padding-right: 1em;
  }
  .movie-content .movie-title {
    color: #ffffff;
    margin-bottom: .25em;
    opacity: .75;
  }
  .movie-content .movie-info {
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: .8em;
    color: #2a9fff;
    line-height: 1;
    margin: 0;
    font-weight: 700;
    opacity: .5;
  }
  .movie-content .movie-header {
    margin-bottom: 2em;
  }
  .movie-content .movie-desc {
    font-weight: 300;
    opacity: .84;
    margin-bottom: 2em;
  }

  .btn {
    padding: .8em 2em;
    background-color: rgba(255, 255, 255, 0.2);
    color: white;
  }

  .btn-outline {
    background-color: transparent;
    border: 3px solid #ffffff;
  }

  .btn::before {
    font-family: 'Material Icons';
    content: '\e037';
    vertical-align: middle;
    font-size: 1.5em;
    padding-right: .5em;
  }

  .btn-outline:hover {
    border-color: #2a9fff;
    color: #2a9fff;
    -webkit-box-shadow: 0px 1px 8px 0px rgba(245, 199, 0, 0.2);
            box-shadow: 0px 1px 8px 0px rgba(245, 199, 0, 0.2);
  }

  .movie-share {
    padding: 1em;
    display: inline-block;
    width: 15%;
  }

  .movie-share__icon i {
    font-size: 1.2em;
    margin-left: .5em;
    color: #ffffff;
    mix-blend-mode: lighten;
    opacity: .4;
  }

  .movie-share__icon i:hover {
    opacity: 1;
    mix-blend-mode: lighten;
  }

  @media (max-width: 1000px) {
    .movie-content {
      width: 50%;
      max-width: 95%;
    }
  }
  @media (max-width: 800px) {
    .movie-card {
      width: 95%;
      max-width: 95%;
    }
  }
  @media (max-width: 600px) {
    .movie-card, .movie-card:nth-child(2), .movie-card:nth-child(3) {
      background-position: 50% 0%;
      background-size: cover;
      height: 400px;
    }

    .color-overlay {
      background: -webkit-gradient(linear, left top, left bottom, from(rgba(42, 159, 255, 0.2)), color-stop(60%, #212120), to(#212120));
      background: linear-gradient(to bottom, rgba(42, 159, 255, 0.2) 0%, #212120 60%, #212120 100%);
    }

    .movie-content {
      margin-top: 4.2em;
      width: 90%;
    }

    .movie-share {
      display: block;
      width: 100%;
    }
  }
</style>
</body>
</html>
