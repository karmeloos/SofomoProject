import { LightningElement, api } from "lwc";
import { SortJavaScriptController } from "./sortJavaScriptController.js";
import { SortApexController } from "./sortApexController.js";


const CONTROLLERS_MAP = new Map()
CONTROLLERS_MAP.set('JavaScript', new SortJavaScriptController());
CONTROLLERS_MAP.set('Apex', new SortApexController());

export default class SortTextComponent extends LightningElement {
  text;
  @api cardTitle;
  @api controllerType;
  controller;

  async connectedCallback() {
    console.log(this.controllerType);
    if(! CONTROLLERS_MAP.has(this.controllerType)) return;
    this.controller = CONTROLLERS_MAP.get(this.controllerType);
    this.text = await this.controller.getDefaultText();
  }

  async handleSort() {
    const currentTextValue = this.refs.textArea.value;
    this.text = await this.controller.sortText(currentTextValue);
  }
}
