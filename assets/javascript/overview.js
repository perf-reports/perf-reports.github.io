/*
Simple ajax techniques to move existing data into the overview page from each report.
*/

const resource = 'http://localhost:4000/02-18/';
const reports = [
	'ascent-series.html',
	'be-inspired.html',
	'blenders.html',
	'e310.html',
	'find-recipes.html',
	'home.html',
	'legacy-series.html',
	'page-not-found.html',
	'personal-series.html',
	'recommender.html',
	'shop.html',
	'support.html',
	'what-you-can-make.html',
	'why-vitamix.html'
];


for (var i = 0; i < reports.length; i++) {
	var myRequest = new Request(resource + reports[i]);
	getData();
}

function getData() {
	fetch(myRequest)
	.then(response => response.text())
	.then(text => {
		var parser = new DOMParser();
	    var htmlDocument = parser.parseFromString(text, 'text/html');
	    var elem = htmlDocument.documentElement.querySelectorAll('.lh-scores-header > a').innerHTML;
	    console.log(elem);
	    getHref(elem);
	})
}

function getHref(el) {
	for (let i=0; i<el.length; i++) {
		var href = el.getAttribute('href');
		console.log(href);
	}

}

// 			href += text.querySelectorAll('.lh-scores-header > a').getAttribute('href');

//			if(response.ok) {
//				console.log("Response ok!");
//			}
//			throw new Error('Network response was not ok.');
//		})
//		.then(function(x) {


//	header =
//};

// querySelectorAll('.lh-scores-header > a').getAttribute('href');

/*var scores = header.getElementsbyTagName('a');
var sAnchor = [];

for (var i=0; i<scores.length; i++) {
	sAnchor = scores[i].getAttribute('href');
};

console.log(scores);
console.log(sAnchor); */