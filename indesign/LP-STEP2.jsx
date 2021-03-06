﻿//LP.jsx
//An InCopy JavaScript
// Works with document of single pages.
//Removes empty text boxes
main();
function main() {
	if (app.documents.length != 0) {
		var removedNotRequiredPages = removeNotRequiredPages();
		var removedTextFrames = removeEmptyTextFramesAnComments();
		var removedPages = removeEmptyPages();
		var aligned = alignContent()
		var justifiedCount = justifyContent()

		alert("Results" +
			"\nRemoved not required: " + removedNotRequiredPages +
			"\nRemoved empty and comments: " + removedTextFrames +
			"\nRemoved pages: " + removedPages +
			"\nAligned items: " + aligned +
			"\nJustified items: " + justifiedCount
		)

	}
	else {
		alert("No documents are open. Please open a document and try again.");
	}

}

function removeNotRequiredPages() {
	var pages = app.activeDocument.pages;
	var counter = 0;
	var pagesCount = 0;
	for (i = pages.length - 1; i >= 0; i--) {
		if (pagesCount % 2 == 0) {
			pages[i].remove()
			counter++
		}
		pagesCount++
	}
	return counter
}

// Removes empty textFrames and comments
function removeEmptyTextFramesAnComments() {
	var counter = 0;
	var regex = /^[\s]*$/;
	var spreads = app.activeDocument.spreads;
	for (i = spreads.length - 1; i >= 0; i--) {
		var myTextFrames = spreads[i].textFrames
		for (j = myTextFrames.length - 1; j >= 0; j--) {
			if (myTextFrames[j].contents.match(regex)) {
				myTextFrames[j].remove();
				counter++
			} else if (myTextFrames[j].contents == '* Rengėjas ne originalą atkuria, bet derina turimų Evangelijų įvykių tvarką:  Jono Evangelijoje „žydai“ reiškia būtent tautą!') {
				myTextFrames[j].remove();
				counter++
			}
		}
	}
	return counter
}

// function removeEmptyTextFrames_org(){
// 	var counter = 0;
// 	var myStories = app.activeDocument.stories.everyItem().getElements();
// 	for (i = myStories.length - 1; i >= 0; i--){
// 		var myTextFrames = myStories[i].textContainers;
// 		for (j = myTextFrames.length - 1; j >= 0; j--)    {
// 			if (myTextFrames[j].contents == ""){
// 				myTextFrames[j].remove();
// 				counter++
// 			}
// 		}
// 	}

// 	return counter
// }

function removeEmptyPages() {
	var counter = 0;
	var spreads = app.activeDocument.spreads;
	for (i = spreads.length - 1; i >= 0; i--) {
		var elements = spreads[i].textFrames
		if (elements.length == 0) {
			spreads[i].remove()
			counter++
		}
	}
	return counter
}

function justifyContent() {
	var counter = 0;
	var stories = app.activeDocument.stories;
	for (i = stories.length - 1; i >= 0; i--) {
		var paragraphs = stories[i].paragraphs
		for (j = 0; j < paragraphs.length; j++) {
			paragraphs[j].justification = Justification.LEFT_ALIGN
			counter++
		}
	}
	return counter
}

function alignContent() {
	var counter = 0;
	var spreads = app.activeDocument.spreads;
	for (i = spreads.length - 1; i >= 0; i--) {
		var myTextFrames = spreads[i].textFrames
		myAlignObjects(myTextFrames);
		counter += myTextFrames.length
	}
	return counter
}

function myAlignObjects(myObjectList) {
	var myPageHeight = app.activeDocument.documentPreferences.pageHeight;
	var myPageWidth = app.activeDocument.documentPreferences.pageWidth;
	var myOldRulerOrigin = app.activeDocument.viewPreferences.rulerOrigin;
	app.activeDocument.viewPreferences.rulerOrigin = RulerOrigin.pageOrigin;
	app.activeDocument.zeroPoint = [0, 0];
	myPage = app.activeWindow.activePage;
	var myMarginPreferences = myPage.marginPreferences;
	if (myPage.side == PageSideOptions.leftHand) {
		var myOutsideMargin = myMarginPreferences.left;
		var myInsideMargin = myMarginPreferences.right;
		myXCenter = myOutsideMargin + ((myPageWidth - (myInsideMargin + myOutsideMargin)) / 2)
	}
	else {
		var myInsideMargin = myMarginPreferences.left;
		var myOutsideMargin = myMarginPreferences.right;
		myXCenter = myInsideMargin + ((myPageWidth - (myInsideMargin + myOutsideMargin)) / 2)
	}
	var myBottomMargin = myMarginPreferences.bottom;
	var myTopMargin = myMarginPreferences.top;
	myYCenter = myTopMargin + ((myPageHeight - (myTopMargin + myBottomMargin)) / 2)
	myX = myInsideMargin;
	for (myCounter = 0; myCounter < myObjectList.length; myCounter++) {
		myAlignObject(myObjectList[myCounter], myX);
	}
	app.activeDocument.viewPreferences.rulerOrigin = myOldRulerOrigin;
}

function myAlignObject(myObject, myX) {
	var myBounds = myObject.geometricBounds;
	myObject.move([myX, myBounds[0]]);
}
