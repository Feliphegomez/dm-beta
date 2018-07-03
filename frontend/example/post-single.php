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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
<div id="app">
  
<div class="container-fluid">
    <div class="bg-dark p-3 text-center">
		<h2 class=" display-4 p-3 text-white">{{ post.title }}</h2>
		<div class="display-6 p-3 text-white">
            <span class="badge badge-pill badge-primary" v-for="category in post.post_categories">{{ category.categories[0].name }}</span>  
            <span class="badge badge-pill badge-primary" v-for="tag in post.post_tags">{{ tag.tags[0].name }}</span>
        </div>
    </div>
</div>
<br><br>
<div class="container">
    <div class="autor-biografia">
    <img class="lazy avatar-autor img-fluid rounded" data-toggle="tooltip" data-placement="top" data-original-title="Miguel92"
     v-bind:src="post.users[0].user_avatars[0].avatars[0].url">

    <div class="autor-info">
        <h3> Autor: <a href="http://www.portfolio2017.skn1.com/oficial/" target="_blank">{{ post.users[0].username }}</a></h3>
        <p class="alert alert-success">Me gusta todo lo que es el diseño de páginas web, la programación web y otros lenguajes de programación. {{  }}</p>
     
            <ul class="list-group">
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Entradas totales
                <span class="badge badge-primary badge-pill">25</span>
              </li>
            </ul>

        <ul class="autor-enlaces">
            <li class="autor_web"><a href="http://portfolio2017.skn1.com/oficial" data-toggle="tooltip" data-placement="top" title="Mi web"><i class="fa fa-globe fa-fw"></i></a></li>
            <li class="autor_fb"><a href="https://facebook.com/joelmiguel.valente" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook-f fa-fw"></i></a></li>
            <li class="autor_tw"><a href="https://twitter.com/JMiguelV06" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter fa-fw"></i></a></li>
            <li class="autor_yt"><a href="https://www.youtube.com/user/xxxtheymmm" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube fa-fw"></i></a></li>
            <li class="autor_is"><a href="https://www.instagram.com/jvalentem92/'" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram fa-fw"></i></a></li>
            <li class="autor_li"><a href="https://www.linkedin.com/in/jmiguelv92/" data-toggle="tooltip" data-placement="top" title="Linkedin"><i class="fa fa-linkedin fa-fw"></i></a></li>
            <li class="autor_gh"><a href="https://github.com/joelmiguelvalente" data-toggle="tooltip" data-placement="top" title="GitHub"><i class="fa fa-github fa-fw"></i></a></li>
            <li class="autor_bh"><a href="https://www.behance.net/joel920892" data-toggle="tooltip" data-placement="top" title="Behance"><i class="fa fa-behance fa-fw"></i></a></li>
            <li class="autor_cp"><a href="https://codepen.io/Miguel9217/" data-toggle="tooltip" data-placement="top" title="Code Pen"><i class="fa fa-codepen fa-fw"></i></a></li>
        </ul>

    </div><!-- .autor-info-->
</div><!-- .autor-biografia-->
<br><hr><br>
<div class="row">
    <div class="col-sm-12 col-md-8">
        <p class="lead">{{ post.content }}</p>
    </div>
    <div class="col-sm-12 col-md-4">
        <div class="text-center" v-for="picture in post.post_pictures">
          <img class="img-thumbnail" v-bind:src="picture.pictures[0].url" />
        </div>
    </div>    
</div>

</div>
 
 <h5 class="text-center my-3 p-3">Copyright © 2018 - FelipheGomez</h5>
    

</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://rawgit.com/tuupola/jquery_lazyload/2.x/lazyload.js"></script>





<script>
  // Funciones para el tooltip
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
  
        $('.lazy').lazyload();
    });
</script>



<script>
    new Vue({
        el: '#app',
        data: {
            tabla_name: tabla,
            post: {}
        },
        methods: {
            cargar: function () {
                axios.get('/dm/api/v2/'+tabla, {
                    params: { 
                        order: 'id',
                        page: 1,
                        filter: 'id,eq,1',
                        transform: 1,
                        include: 'categories,pictures,tags,users,avatars'
                    }
                })
                .then((response)  =>  {
                    console.log(response.data[tabla])
                    this.post = response.data[tabla][0]
                    console.log(this.post)
                    
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




<style>
.autor-biografia { 
    width: 100%; 
    height: 215px; 
    display: flex; 
    padding: 6px 10px; 
    background-color: #E3E8F8; 
    position: relative; 
    margin-bottom: 10px; 
    margin: 0 auto;
}
.autor-biografia:before, 
.autor-biografia:after { 
    z-index: -1; 
    position: absolute; 
    content: ""; 
    bottom: 15px; 
    left: 10px; 
    width: 50%; 
    top: 80%;
    max-width:500px; 
    background: #777; 
    -webkit-box-shadow: 0 15px 10px #777; 
    -moz-box-shadow: 0 15px 10px #777; 
    box-shadow: 0 15px 10px #777; 
    -webkit-transform: rotate(-3deg); 
    -moz-transform: rotate(-3deg); 
    -o-transform: rotate(-3deg); 
    -ms-transform: rotate(-3deg); 
    transform: rotate(-3deg); 
}
.autor-biografia:after { 
    -webkit-transform: rotate(3deg); 
    -moz-transform: rotate(3deg); 
    -o-transform: rotate(3deg); 
    -ms-transform: rotate(3deg); 
    transform: rotate(3deg); 
    right: 10px; 
    left: auto; 
}
.autor-info { 
    height: 100%; 
    flex: 2 1 auto; 
    padding: 0 5px; 
}
.avatar-autor { 
    flex: 0 1 auto; 
    width: 200px; 
    height: 200px; 
    float: left; 
    display: inline-block; 
}
.autor-biografia h3 { 
    border-bottom: 2px solid #008080; 
    padding: 0; 
}'
.autor-enlaces { list-style: none; }
.autor-enlaces li { display: inline-block; }
.autor-enlaces a { text-decoration: none; } 
.autor-enlaces a i { 
    font-size: 24px; 
    margin: 4px 2px; 
    color: #333; 
    display: block; 
    line-height: 1.8em; 
    width: 50px; 
}

@media screen and (max-width: 575px) { 
	.autor-biografia { 	height: 250px; } 
	.autor-enlaces a i { margin: 1px 0; font-size: 20px; width: 60px; } 
}

/* EN EL CASO QUE LE QUIERAS AGREGAR COLOR */
.autor_web a { color: #333; } /* Tu página web */
.autor_fb a { color: #333; } /* Facebook */
.autor_tw a { color: #333; } /* Twitter */
.autor_yt a { color: #333; } /* Youtube */
.autor_is a { color: #333; } /* Instagram */
.autor_li a { color: #333; } /* Linkedin */
.autor_gh a { color: #333; } /* Github */
.autor_bh a { color: #333; } /* Behance */
.autor_cp a { color: #333; } /* Code Pen */
</style>


</body>
</html>

