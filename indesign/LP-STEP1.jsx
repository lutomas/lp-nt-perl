//LP.jsx
//An InCopy JavaScript
// STEP 1
//Removes empty text boxes
main();
function main() {
	if (app.documents.length != 0) {

			alert("Requirement:"
				+ "\nTo see not spreads, but single pages!"
				+ "\nSTEP1:"
				+ "\nFile>Document-setup>Facing pages (unset)"
			)
			return
	}
	else {
		alert("No documents are open. Please open a document and try again.");
	}

}
