const DEFAULT_TEXT =
  "Wlazł kotek na płotek\ni mruga,\nładna to piosenka,\nnie długa.\nNie długa, nie krótka,\nlecz w sam raz,\nzaśpiewaj koteczku,\njeszcze raz";

export class SortJavaScriptController {
  getDefaultText() {
    return DEFAULT_TEXT;
  }

  sortText(inText) {
    if(!inText) return '';
    const arrayText = inText.split("\n");
    const sortedArrayText = arrayText.sort((a, b) => b.length - a.length);
    return sortedArrayText.join('\n');
  }
}
