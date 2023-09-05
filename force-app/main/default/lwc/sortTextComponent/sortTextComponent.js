import { LightningElement, api } from "lwc";
import { SortJavaScriptController } from "./sortJavaScriptController.js";

const CONTROLLERS_MAP = new Map()
CONTROLLERS_MAP.set('JavaScript', new SortJavaScriptController());

export default class SortTextComponent extends LightningElement {
  text;
  @api cardTitle;
  @api controllerType;
  controller;

  connectedCallback() {
    console.log(this.controllerType);
    if(! CONTROLLERS_MAP.has(this.controllerType)) return;
    this.controller = CONTROLLERS_MAP.get(this.controllerType);
    this.text = this.controller.getDefaultText();
  }

  handleSort() {
    const currentTextValue = this.refs.textArea.value;
    this.text = this.controller.sortText(currentTextValue);
  }
}
