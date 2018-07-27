import {Component, Input, OnInit} from '@angular/core';
import {FormItem} from '../form-item';

@Component({
  selector: 'app-editor',
  templateUrl: './editor.component.html',
  styleUrls: ['./editor.component.css']
})
export class EditorComponent implements OnInit {

  @Input() formItem: FormItem;
  constructor() { }

  ngOnInit() {
  }

}
