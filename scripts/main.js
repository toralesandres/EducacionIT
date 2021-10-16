/* Declaraciones */
	const d = document
	const pBar = d.querySelector('.bar progress')
	const pIn = d.querySelector('.bar input')
	const ctx = d.querySelector('#canvas').getContext('2d')

/* Progress Bar */
	pIn.oninput = () => pBar.value = pIn.value

/* Canvas */
	// Rectangulo
	ctx.fillStyle = '#448'
	ctx.fillRect(50,50,100,100) // x, y, width, height
	// Circulo
	ctx.fillStyle = 'rgba(204,51,51,.5)'
	ctx.arc(150, 150, 50, 0, 2 * Math.PI) // cx, cy, r, start, end
	ctx.fill()
	// Triangulo
	ctx.beginPath()
	ctx.fillStyle = 'hsla(120,50%,50%,.5)'
	ctx.moveTo(150,50)
	ctx.lineTo(150,150)
	ctx.lineTo(250,100)
	ctx.fill()
	// Texto
	ctx.font = 'bold 1rem calibri, sans-serif'
	ctx.strokeText('Canvas (Mapa de Bits)', 50, 250) // text, x, y