import { LightningElement } from 'lwc';
import {SortJavaScriptController} from './sortJavaScriptController.js';

export default class SortTextComponent extends LightningElement {
    text;
    cardTitle = 'Sort text by JS';
    controller;

    connectedCallback() {
        this.controller = new SortJavaScriptController();
        this.text = this.controller.getDefaultText();
    }

    handleSort() {
        const currentTextValue = this.refs.textArea.value;
        this.text = this.controller.sortText(currentTextValue);
    }
}