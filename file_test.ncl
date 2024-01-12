<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Exemplo de sincronismo sem a interacao do usuario e com reuso apenas de relacoes-->
<ncl id="syncEx" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase>
			<causalConnector id="onBeginStart_delay">
				<connectorParam name="delay"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="start" delay="$delay" max="unbounded" qualifier="par"/>
			</causalConnector>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>
			</causalConnector>
			<causalConnector id="onEndStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop" max="unbounded" qualifier="par"/>
			</causalConnector>
		</connectorBase>
	</head>

	<body>
		<port id="entry" component="animation"/>
		<media id="animation" src="../media/animGar.mp4">
		<area id="segDrible" begin="15s"/>
		<area id="segPhoto" begin="35s"/>
		<property name="width" value="80%"/>
		<property name="height" value="80%"/>         
		<property name="zIndex" value="1"/>
	</media>
	<media id="choro" src="../media/choro.mp4">
		<property name="left" value="10%"/>
		<property name="top" value="10%"/>           
		<property name="width" value="30%"/>
		<property name="height" value="30%"/>         
		<property name="zIndex" value="4"/>
	</media>
	<media id="drible" src="../media/drible.mp4">
		<property name="left" value="50%"/>
		<property name="top" value="50%"/>           
		<property name="width" value="25%"/>
		<property name="height" value="25%"/>         
		<property name="zIndex" value="5"/>
	</media>
	<media id="photo" src="../media/photo.png">
		<property name="left" value="20%"/>
		<property name="top" value="40%"/>           
		<property name="width" value="35%"/>
		<property name="height" value="25%"/>         
		<property name="zIndex" value="2"/>
		<property name="explicitDur" value="10s"/>          
	</media>
	<media id="photo" src="../media/photo.png">
		<property name="left" value="75%"/>
		<property name="top" value="5%"/>            
		<property name="width" value="20%"/>
		<property name="height" value="20%"/>         
		<property name="zIndex" value="3"/>
		<property name="explicitDur" value="7s"/>           
	</media>
	<media id="photo" src="../media/photo.png">
		<property name="left" value="85%"/>
		<property name="top" value="75%"/>            
		<property name="width" value="10%"/>
		<property name="height" value="10%"/>         
		<property name="zIndex" value="2"/>
		<property name="explicitDur" value="4s"/>           
	</media>

		<link  id="lMusic" xconnector="onBeginStart_delay">
			<bind role="onBegin" component="animation"/>
			<bind role="start" component="choro">
				<bindParam name="delay" value="5s"/>
			</bind>				
		</link>
		<link  id="lDrible" xconnector="onBeginStart">
			<bind role="onBegin" component="animation" interface="segDrible"/>
			<bind role="start" component="drible"/>			
		</link>	
		<link  id="lPhoto" xconnector="onBeginStart">
			<bind role="onBegin" component="animation" interface="segPhoto"/>
			<bind role="start" component="photo"/>			
		</link>	
		<link  id="lEnd" xconnector="onEndStop">
			<bind role="onEnd" component="animation"/>
			<bind role="stop" component="choro"/>			
		</link>
	</body>
</ncl>