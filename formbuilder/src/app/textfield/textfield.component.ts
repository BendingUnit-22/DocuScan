import {Component, Input, OnInit} from '@angular/core';
import {FormItem, TextFieldItem} from '../form-item';

@Component({
  selector: 'app-textfield',
  templateUrl: './textfield.component.html',
  styleUrls: ['./textfield.component.css']
})
export class TextfieldComponent implements OnInit {
  @Input() formItem: TextFieldItem;

  constructor() { }

  ngOnInit() {
  }

}
