import { Component, OnInit, Input, Output, EventEmitter} from '@angular/core';
import { FormItem } from '../form-item';

@Component({
  selector: 'app-uiview',
  templateUrl: './uiview.component.html',
  styleUrls: ['./uiview.component.css']
})
export class UiviewComponent implements OnInit {

  @Input() formItem: FormItem;
  @Input() selected: boolean;

  @Output()
    public viewClick: EventEmitter<MouseEvent> = new EventEmitter<MouseEvent>();
  constructor() {

  }

  ngOnInit() {

  }
}
