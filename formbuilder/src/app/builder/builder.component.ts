import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {FormItem} from '../form-item';
 import {FormItemService} from '../form-item.service';
import {Icons} from '../icons';

@Component({
  selector: 'app-builder',
  templateUrl: './builder.component.html',
  styleUrls: ['./builder.component.css']
})
export class BuilderComponent implements OnInit {

  @ViewChild('elementTab') elementTab: ElementRef;
  @ViewChild('editorTab') editorTab: ElementRef;

  templateTypes: FormItem[];
  formItems: FormItem[];
  contentBoundary = {x: 0, y: 0, width: 0, height: 0 };
  selectedIndex = -1;
  showEditor = false;

  constructor(private formService: FormItemService) {}
  ngOnInit() {
    this.getTemplateTypes();
    this.getNewTemplate();
   }
   onSubmit(): void {
      this.formService.postFormItems(this.formItems);
   }
   getTemplateTypes(): void {
      this.formService.getFormItems()
        .subscribe(items => this.templateTypes = items);
   }

   getNewTemplate(): void {
      this.formService.getNewTemplate()
        .subscribe(template => this.formItems = template);
   }

   getIcon(formItem) {
      return new Icons().icon(formItem.itemType);
   }

   selectElement(item, i) {
     if (this.selectedIndex === i) {
       this.selectedIndex = -1;
       this.elementTab.nativeElement.classList.add('active');
       this.editorTab.nativeElement.classList.remove('active');
       this.showEditor = false;
     } else {
       this.selectedIndex = i;
       this.elementTab.nativeElement.classList.remove('active');
       this.editorTab.nativeElement.classList.add('active');
       this.showEditor = true;
     }
   }

  clearSelection(){
      this.selectedIndex = -1;
      this.showEditor = false;
   }

  onStart(content_box) {
    this.contentBoundary = {x: content_box.x, y: content_box.y, width: content_box.width, height: content_box.width };
  }

  onMoveEnd(itemBound, item) {
    const movingItemBound = {x: itemBound.x, y: itemBound.y, width: itemBound.width, height: itemBound.width };
    const containInBound = this.containsBound(this.contentBoundary, movingItemBound);
    if (containInBound) {
      this.formItems.push(Object.assign(new FormItem(), item));
    }
  }

  containsBound(parent, child): boolean {
    const cX = this.midPoint(child).centerX;
    const cY = this.midPoint(child).centerY;
    return (cX >= parent.x && cY >= parent.y && cX <= parent.x + parent.width && cY <= parent.y + parent.height);
  }

  midPoint(frame) {
    const centerX = frame.x + frame.width / 2.0;
    const centerY = frame.y + frame.height / 2.0;
    return {centerX: centerX, centerY: centerY};
  }

}
