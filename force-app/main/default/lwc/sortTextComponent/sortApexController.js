import sortText from "@salesforce/apex/SortController.sortText";
import getDefaultText from "@salesforce/apex/SortController.getDefaultText";

export class SortApexController {
  getDefaultText() {
    const value = getDefaultText();
    return value;
  }

  sortText(inText) {
    const value = sortText({inText: inText});
    return value;
  }
}
