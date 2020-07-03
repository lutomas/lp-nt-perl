//LP.jsx
//An InCopy JavaScript
// STEP 1
//Removes empty text boxes
main();
function main() {
	if (app.documents.length != 0) {

			alert("Requirement:"
				+ "\nExport to HTML!"
				+ "\nSTEP3:"
				+ "\nFile>Export>HTML (select)"
				+ "\nName it: 'full_nt'"
			)
			return
	}
	else {
		alert("No documents are open. Please open a document and try again.");
	}

}
