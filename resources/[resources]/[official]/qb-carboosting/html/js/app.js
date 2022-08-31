let inQueue = null;
let contractData = [];
let display = false;
let started = false;
let crypto = 0.0;

let vinPrices = [{ // Make sure that this corresponds with your sh_config!
	'D': 251,
	'C': 252,
	'B': 253,
	'A': 254,
	'S': 255,
	'S+': 256
}]

const CountdownTimer = (index, element) => {
	const countDownDate = element.expire;
	let Timer = setInterval(() => {
		if (document.getElementById(`timer${index}`) === null) {
			clearInterval(Timer)
		} else {
			let now = new Date(Date.now()).getTime();
			let distance = countDownDate - now;
			let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			let seconds = Math.floor((distance % (1000 * 60)) / 1000);
			let colour = "lightgreen"
			if (hours === 0) { colour = "red" }
			document.getElementById(`timer${index}`).innerHTML = "Expires In: " + (hours + "h " + minutes + "m " + seconds + "s ").fontcolor(colour);

			if (element.started === true) {
				document.getElementById(`start-contract${index}`).disabled = true;
				document.getElementById(`transfer-contract${index}`).disabled = true;
				document.getElementById(`decline-contract${index}`).innerHTML = "Cancel Contract";
				document.getElementById(`timer${index}`).innerHTML = "Expires In: " + "Started".fontcolor("orange")
				clearInterval(Timer)
			} else if (distance < 0) {
				document.getElementById(`timer${index}`).innerHTML = "Expires In: " + "Expired".fontcolor("red")
				document.getElementById(`start-contract${index}`).disabled = true;
				document.getElementById(`transfer-contract${index}`).disabled = true;
				document.getElementById(`decline-contract${index}`).disabled = true;
				$.post('https://qb-carboosting/NUI:deletecontract', JSON.stringify({ 'contract': element.id }));
				clearInterval(Timer);
			} else if (started === true) {
				document.getElementById(`start-contract${index}`).disabled = true;
			} else if (display === false) {
				clearInterval(Timer);
			}
		}
	}, 50);
}

const CloseButton = () => {
	$.post('https://qb-carboosting/NUI:close', JSON.stringify({}));
	display = false;
	document.getElementById("html").style.display = 'none';
	document.getElementById('insufficient-crypto').innerHTML = '';
	document.getElementById('transfer-container').innerHTML = '';
	document.getElementById('transfer-contract-container').innerHTML = '';
	document.getElementById('accepted-container').innerHTML = '';
}

const VinScratch = (id, index, price, vinPrice) => {
	if (crypto - price - vinPrice >= 0) {
		document.getElementById(`timer${index}`).innerHTML = "Expires In: Started"
		document.getElementById(`transfer-contract${index}`).disabled = true;
		document.getElementById(`decline-contract${index}`).disabled = true;
		document.getElementById('accepted-container').innerHTML = '';
		for (let i = 0; i < contractData.length; i++) { document.getElementById(`start-contract${i}`).disabled = true; }
		$.post('https://qb-carboosting/NUI:vinscratch', JSON.stringify({ 'index': id }));
		started === true;
	} else {
		let Div = document.getElementById('insufficient-crypto');
		Div.innerHTML += `
		<div class="popup">
		<button onclick={Cancel()} class="popup-button"></button>
		<p class="popuptext">Insufficient crypto</p>
		</div>`
		// Can't start popup
		document.getElementById('accepted-container').innerHTML = '';
	}
}

const NormalDropOff = (id, index, price) => {
	if (crypto - price >= 0) {
		document.getElementById(`timer${index}`).innerHTML = "Expires In: Started"
		document.getElementById(`transfer-contract${index}`).disabled = true;
		document.getElementById(`decline-contract${index}`).disabled = true;
		document.getElementById('accepted-container').innerHTML = '';
		for (let i = 0; i < contractData.length; i++) { document.getElementById(`start-contract${i}`).disabled = true; }
		$.post('https://qb-carboosting/NUI:normaldropoff', JSON.stringify({ 'index': id }));
		started === true;
	} else {
		let Div = document.getElementById('insufficient-crypto');
		Div.innerHTML += `
		<div class="popup">
		<button onclick={Cancel()} class="popup-button"></button>
		<p class="popuptext">Insufficient crypto</p>
		</div>`
		// Can't start popup
		document.getElementById('accepted-container').innerHTML = '';
	}
}

const Contract = (id, index, price, vinPrice) => {
	document.getElementById('transfer-container').innerHTML = '';
	document.getElementById('transfer-contract-container').innerHTML = '';
	document.getElementById('insufficient-crypto').innerHTML = '';
	let Div = document.getElementById('accepted-container');
	Div.innerHTML = '';
	return (
		Div.innerHTML +=
		`<div class="accepted-contract-container" id="accepted-contract-container">
        <button onclick={RanOutOfFunctionNames()} class="accepted-contract-closeButton"></button>
        <div class="accepted-contract-title-flex">
            <h4 class="accepted-contract-title"> Select Type</h4>
        </div>
        
        <p class="accepted-contract-text">If you choose to VIN scratch it will cost an <br> additional ${vinPrice} QBit to claim
            ownership.</p>
        <div class="accepted-contract-optionButton-flex">
            <button class="accepted-contract-optionButton" onclick={VinScratch(${id},${index},${price},${vinPrice})}>VIN SCRATCH</button>
            <button class="accepted-contract-optionButton" onclick={NormalDropOff(${id},${index},${price})}>NORMAL DROPOFF</button>
        </div>`
	)
}

const Cancel = () => {
	document.getElementById('transfer-container').innerHTML = '';
	document.getElementById('transfer-contract-container').innerHTML = '';
	document.getElementById('insufficient-crypto').innerHTML = '';
}

const RanOutOfFunctionNames = () => {
	document.getElementById('accepted-contract-container').innerHTML = ''
	document.getElementById('accepted-container').innerHTML = '';
}

const Continue = (contractId) => {
	let input = document.getElementById("inputfieldid").value
	document.getElementById('transfer-container').innerHTML = '';
	let elem = document.getElementById(`decline-id${contractId}`);
	elem.remove()
	$.post('https://qb-carboosting/NUI:transfercontract', JSON.stringify({
		targetId: input,
		contract: contractId
	}));
}

const TransferContract = (contract) => {
	document.getElementById('insufficient-crypto').innerHTML = '';
	document.getElementById('accepted-container').innerHTML = '';
	let Div = document.getElementById('transfer-container');
	Div.innerHTML = '';
	return (
		Div.innerHTML +=
		`<div class="transfer-contract-container">
        <h4 class="transfer-contract-title">Transfer Contract:</h4>
        <input class="transfer-contract-inputfield" type="number" id="inputfieldid" placeholder="Enter Server Id" min="1">
        <div class="transfer-contract-optionButton-flex">
            <button class="transfer-contract-optionButton-continue" onclick={Continue(${contract})}>CONTINUE</button>
            <button class="transfer-contract-optionButton-cancel" onclick={Cancel()}>CANCEL</button>
        </div>
    </div>`
	)
}

const ToggleQueue = () => {
	inQueue = !inQueue
	if (inQueue === true) { $.post('https://qb-carboosting/NUI:togglequeue', JSON.stringify({})); }
	else { $.post('https://qb-carboosting/NUI:togglequeue', JSON.stringify({})); }
	SetQueueButton()
}

const SetQueueButton = () => {
	if (inQueue === true) { document.getElementById("ToggleQueue").innerHTML = "Leave Queue"; }
	else { document.getElementById("ToggleQueue").innerHTML = "Join Queue"; }
}

const RemoveFunction = (id) => {
	let elem = document.getElementById(`decline-id${id}`);
	elem.remove()
	$.post('https://qb-carboosting/NUI:deletecontract', JSON.stringify({ 'contract': id }));
	document.getElementById('transfer-contract-container').innerHTML = '';
}

const DeclineContract = (id) => {
	document.getElementById('insufficient-crypto').innerHTML = '';
	document.getElementById('accepted-container').innerHTML = '';
	let Div = document.getElementById('transfer-contract-container');
	Div.innerHTML +=
		`<div class="transfer-contract-container">
        <h4 class="transfer-contract-title">Are you sure you want to cancel</h4>
        <div class="transfer-contract-optionButton-flex">
            <button class="transfer-contract-optionButton-continue" onclick={RemoveFunction(${id})}>CONTINUE</button>
            <button class="transfer-contract-optionButton-cancel" onclick={Cancel()}>CANCEL</button>
        </div>
    </div>`
}

const SetProgressBar = (rank, nextrank, pct) => {
	document.getElementById("current-rank").innerHTML = rank;
	document.getElementById("next-rank").innerHTML = nextrank;
	document.getElementById("progress-bar-width").style.width = `${pct}%`;
}

window.onload = ('message', (event) => {
	window.addEventListener("message", (event) => {
		let data = event.data;
		inQueue = data.inqueue;
		crypto = data.crypto;
		contractData = data.contracts;
		started = data.started;

		SetQueueButton();
		SetProgressBar(data.rank, data.nextrank, data.pct);

		if (data.display === true) {
			document.getElementById("html").style.display = '';
			display = true;
		} else {
			document.getElementById("html").style.display = 'none';
			display = false;
		}
		let counter = 0;
		let contractDiv = document.getElementById('contracts');
		contractDiv.innerHTML = '';
		if (contractData.length === 0) { return };
		contractData.forEach(element => {
			CountdownTimer(counter, element);
			console.log(typeof element.tier)
			return (
				contractDiv.innerHTML +=
				`<div class="contract-cards" id="decline-id${element.id}">
					<div class="contract-rank">
						<div class="contract-rank-text">${element.tier.toUpperCase()}</div>
					</div>
					<div class="contract-details">
						<ul class="contract-details-text">
							<p>Car: ${element.vehlabel}</p>
							<p>Plate: ${element.plate}</p>
							<p>Buy in: ${element.price} QBit</p>
							<p id="timer${counter}">Expires In: </p>
						</ul>
					</div>
					<div class="contract-buttons-flex">
						<button id="start-contract${counter}" onclick={Contract(${element.id},${counter},${element.price},${vinPrices[0][element.tier]})} class="contract-buttons">Start Contract</button>
						<button id="transfer-contract${counter}" onclick={TransferContract(${element.id})} class="contract-buttons">Transfer Contract</button>
						<button id="decline-contract${counter++}" onclick={DeclineContract(${element.id})} class="contract-buttons">Decline Contract</button>
					</div>
				</div>
				`
			)
		});
	})
})

// Escape to close
window.addEventListener("keydown", function () {
	if (event.keyCode === 27) {
		CloseButton()
	}
})