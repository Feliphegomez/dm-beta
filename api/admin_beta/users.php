<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Admin </title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.16/vue.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script>
		var tabla = 'users';
		
		var campos = {
			id: 0,
			username: '',
			hash: ''
		}
		var campos_input = [
			{
				name:'id',
				type:'number',
				label:'ID Interno',
			},
			{
				name:'username',
				type:'text',
				label:'Usuario',
			},
			{
				name:'hash',
				type:'text',
				label:'Contraseña',
			}
		];
	</script>
</head>
<body>
	<div id="app" class="container">
		<h1> {{ tabla_name }} </h1>
		<div class="row">
			<div class="col-sm-6">
				<h2>Crea</h2>
				<div class="form-group" v-for="(val, index) in fields" :key="index">				 
					<div :id="index">
						{{ val.label }}
						<input v-model="item_create[val.name]" :type='val.type' :name='val.name' :placeholder='val.label' class='form-control' />				  
					</div>
				</div>
				<button @click="nuevo" class="btn btn-default btn-success btn-block">Crear</button>
			</div>
			<div class="col-sm-6">
				<h2>Modificar</h2>
				<div class="form-group" v-for="(val, index) in fields" :key="index">
					<div :id="index">
						{{ val.label }}
					  <input v-model="item_change[val.name]" :type='val.type' :name='val.name' :placeholder='val.label' class='form-control' />				  
					</div>
				</div>
				<button type="button" @click="modificar" class="btn btn-default btn-warning btn-block"><span class="glyphicon glyphicon-off"></span> Modificar</button>
			</div>
		</div>
		<hr>
		<h2> Lista </h2>
		<table class="table table-responsive">
			<tr>
				<td v-for="(val, index) in fields" :key="index">{{ val.name }}</td>
				<td>Eliminar</td>
				<td>Editar</td>
			</tr>
			<tr v-for="item in items">
				<td v-for="(val, index) in fields" :key="index">{{ item[val.name] }}</td>
				<td><button class="btn btn-danger" v-on:click="eliminar(item.id)" > Eliminar </button></td>
				<td><button class="btn btn-warning" v-on:click="select(item.id)" > Editar </button></td>
			</tr> 
		</table>
	</div>

	<script>
		new Vue({
			el: '#app',
			data: {
				tabla_name: tabla,
				fields: campos_input,
				items: [],
				item_create: campos,
				item_change: campos
			},
			methods: {
				cargar: function(){
					axios.get('/dm/api/v2/'+tabla, {
						params: { 
							transform: 1
						}
					})
					.then((response)  =>  {
						this.items = response.data[tabla]; 
					}, (error)  =>  {
						console.log('Error: ' + error);
						this.items = [];
					});
				},
				nuevo: function(){
					axios.post('/dm/api/v2/'+tabla, this.item_create)
					.then(function (response) { location.reload(); })
					.catch(function (error) { console.log(error); });
				},
				modificar: function(){
					axios.put('/dm/api/v2/'+tabla+'/'+this.item_change.id, this.item_change)
					.then(function (response) { location.reload(); })
					.catch(function (error) { console.log(error); });
				},
				eliminar: function(id){
					axios.delete('/dm/api/v2/'+tabla+'/'+id, {})
					.then(function (response) { location.reload(); })
					.catch(function (error) { console.log(error); });
				},
				select: function(select){
					axios.get('/dm/api/v2/'+tabla, {
						params: { 
							transform: 1,
							filter: "id,eq,"+select
						}
					})
					.then((response)  =>  {
						this.item_change = response.data[tabla][0];
					}, (error)  =>  {
						console.log('Error: ' + error);
						this.items = [];
					});
				}
			},
			created: function(){ 
				this.cargar();
				document.title = this.tabla_name;
			}
		});
	
	</script>

</body>
</html>
