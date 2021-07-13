import { createElement } from "lwc";
import titleDetails from "c/titleDetails";
//import { CurrentPageReference } from 'lightning/navigation';
//import { registerTestWireAdapter } from '@salesforce/sfdx-lwc-jest';

import { getRecord } from "lightning/uiRecordApi";

const mockGetRecord = require("./data/getRecord.json");

// Register a standard test wire adapter.
// describe('c-title-details', () => {
//   afterEach(() => {
//     // The jsdom instance is shared across test cases in a single file so reset the DOM
//     while(document.body.firstChild) {
//       document.body.removeChild(document.body.firstChild);
//     }
//   });

test("renders the current page reference in <pre> tag", () => {
  const element = createElement("c-title-details", {
    is: titleDetails
  });
  document.body.appendChild(element);

  // Select element for validation
  const card = element.shadowRoot.querySelector("lightning-card");

  // Emit data from @wire
  getRecord.emit(mockGetRecord);

  return Promise.resolve().then(() => {
    expect(card.title).toBe("Inception");
  });
});

// import { createElement } from 'lwc';
// import titleDetails from 'c/c/titleDetails';

// import { CurrentPageReference } from 'lightning/navigation';
// import { registerTestWireAdapter } from '@salesforce/sfdx-lwc-jest';

// describe('c-title-details', () => {
//   afterEach(() => {
//     // The jsdom instance is shared across test cases in a single file so reset the DOM
//     while(document.body.firstChild) {
//       document.body.removeChild(document.body.firstChild);
//     }
//   });

//   it('renders the current page reference in <pre> tag', () => {
//     const element = createElement('c-title-details', {
//       is: titleDetails
//     });
//     document.body.appendChild(element);

//     // Select element for validation
//     const preElement = element.shadowRoot.querySelector('pre');
//     expect(preElement).not.toBeNull();

//     // Emit data from @wire
//     currentPageReferenceAdapter.emit(mockCurrentPageReference);

//     return Promise.resolve().then(() => {
//       expect(preElement.textContent).toBe(
//         JSON.stringify(mockCurrentPageReference, null, 2)
//       );
//     });
//   });
// });
