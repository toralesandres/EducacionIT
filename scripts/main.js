/* Declaraciones */
	const d = document
	const pBar = d.querySelector('.bar progress')
	const pIn = d.querySelector('.bar input')

/* Progress Bar */
	pIn.oninput = () => pBar.value = pIn.value
	