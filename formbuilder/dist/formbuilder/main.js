(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"],{

/***/ "./src/$$_lazy_route_resource lazy recursive":
/*!**********************************************************!*\
  !*** ./src/$$_lazy_route_resource lazy namespace object ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncaught exception popping up in devtools
	return Promise.resolve().then(function() {
		var e = new Error('Cannot find module "' + req + '".');
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./src/$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./src/app/app.component.css":
/*!***********************************!*\
  !*** ./src/app/app.component.css ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n\n\nh1 {\n  color: lightblue;\n  padding: 24px;\n  display:inline-block;\n}\n\n#savebutton {\n  display:inline-block;\n  margin: 20px 0px;\n  padding: 10px 30px;\n  color: white;\n  float: right;\n  border: #606dac solid 1px;\n  border-radius: 5px;\n}\n\n#savebutton:hover {\n  border: #606dff solid 1px;\n  background-color:  #606dff;\n  color: whitesmoke;\n}\n\n#savebutton:active {\n  border: #606dff solid 1px;\n  background-color: #3a30a3;\n  color: white;\n}\n\n.container-fluid {\n  background-color: darkslateblue;\n}\n"

/***/ }),

/***/ "./src/app/app.component.html":
/*!************************************!*\
  !*** ./src/app/app.component.html ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n<div class=\"container-fluid\">\n    <div class=\"row\">\n      <div class=\"col-8\">\n        <h1 class=\"text-warning\">DocuScan</h1>\n        <div id=\"savebutton\" (click)=\"builder.onSubmit()\">Save</div>\n      </div>\n\n    </div>\n    <app-builder #builder></app-builder>\n</div>\n"

/***/ }),

/***/ "./src/app/app.component.ts":
/*!**********************************!*\
  !*** ./src/app/app.component.ts ***!
  \**********************************/
/*! exports provided: AppComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppComponent", function() { return AppComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var AppComponent = /** @class */ (function () {
    function AppComponent() {
    }
    AppComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-root',
            template: __webpack_require__(/*! ./app.component.html */ "./src/app/app.component.html"),
            styles: [__webpack_require__(/*! ./app.component.css */ "./src/app/app.component.css")]
        })
    ], AppComponent);
    return AppComponent;
}());



/***/ }),

/***/ "./src/app/app.module.ts":
/*!*******************************!*\
  !*** ./src/app/app.module.ts ***!
  \*******************************/
/*! exports provided: AppModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppModule", function() { return AppModule; });
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/fesm5/platform-browser.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _app_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app.component */ "./src/app/app.component.ts");
/* harmony import */ var _builder_builder_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./builder/builder.component */ "./src/app/builder/builder.component.ts");
/* harmony import */ var _fortawesome_angular_fontawesome__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @fortawesome/angular-fontawesome */ "./node_modules/@fortawesome/angular-fontawesome/fesm5/angular-fontawesome.js");
/* harmony import */ var angular2_draggable__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! angular2-draggable */ "./node_modules/angular2-draggable/fesm5/angular2-draggable.js");
/* harmony import */ var _uiview_uiview_component__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./uiview/uiview.component */ "./src/app/uiview/uiview.component.ts");
/* harmony import */ var ng2_dragula__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ng2-dragula */ "./node_modules/ng2-dragula/index.js");
/* harmony import */ var ng2_dragula__WEBPACK_IMPORTED_MODULE_7___default = /*#__PURE__*/__webpack_require__.n(ng2_dragula__WEBPACK_IMPORTED_MODULE_7__);
/* harmony import */ var _headerview_headerview_component__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./headerview/headerview.component */ "./src/app/headerview/headerview.component.ts");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm5/forms.js");
/* harmony import */ var _textfield_textfield_component__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./textfield/textfield.component */ "./src/app/textfield/textfield.component.ts");
/* harmony import */ var _editor_editor_component__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! ./editor/editor.component */ "./src/app/editor/editor.component.ts");
/* harmony import */ var _titleview_titleview_component__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! ./titleview/titleview.component */ "./src/app/titleview/titleview.component.ts");
/* harmony import */ var _phoneview_phoneview_component__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! ./phoneview/phoneview.component */ "./src/app/phoneview/phoneview.component.ts");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_14__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};















var AppModule = /** @class */ (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
            declarations: [
                _app_component__WEBPACK_IMPORTED_MODULE_2__["AppComponent"],
                _builder_builder_component__WEBPACK_IMPORTED_MODULE_3__["BuilderComponent"],
                _uiview_uiview_component__WEBPACK_IMPORTED_MODULE_6__["UiviewComponent"],
                _headerview_headerview_component__WEBPACK_IMPORTED_MODULE_8__["HeaderviewComponent"],
                _textfield_textfield_component__WEBPACK_IMPORTED_MODULE_10__["TextfieldComponent"],
                _editor_editor_component__WEBPACK_IMPORTED_MODULE_11__["EditorComponent"],
                _titleview_titleview_component__WEBPACK_IMPORTED_MODULE_12__["TitleviewComponent"],
                _phoneview_phoneview_component__WEBPACK_IMPORTED_MODULE_13__["PhoneviewComponent"]
            ],
            imports: [
                _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
                _fortawesome_angular_fontawesome__WEBPACK_IMPORTED_MODULE_4__["FontAwesomeModule"],
                angular2_draggable__WEBPACK_IMPORTED_MODULE_5__["AngularDraggableModule"],
                ng2_dragula__WEBPACK_IMPORTED_MODULE_7__["DragulaModule"],
                _angular_forms__WEBPACK_IMPORTED_MODULE_9__["FormsModule"],
                _angular_common_http__WEBPACK_IMPORTED_MODULE_14__["HttpClientModule"]
            ],
            providers: [],
            bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_2__["AppComponent"]]
        })
    ], AppModule);
    return AppModule;
}());



/***/ }),

/***/ "./src/app/builder/builder.component.css":
/*!***********************************************!*\
  !*** ./src/app/builder/builder.component.css ***!
  \***********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n\nli span{\n  margin: 20px;\n  text-align: center;\n}\n\n#content_boundary {\n  height:297mm;\n }\n\n#main_area {\n  padding: 40px 40px;\n  /*border-top-style: dotted;*/\n  /*border-left-style: dotted;*/\n  /*border-bottom-style: dotted;*/\n  /*background-color: aliceblue;*/\n  background: repeating-linear-gradient(\n    45deg,\n    #606dbc,\n    #606dbc 10px,\n    #465298 10px,\n    #465298 20px\n  );\n}\n\n#side_area {\n  padding: 10px 10px;\n  background-color: #606dbc;\n\n}\n\n"

/***/ }),

/***/ "./src/app/builder/builder.component.html":
/*!************************************************!*\
  !*** ./src/app/builder/builder.component.html ***!
  \************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n\n<div class=\"row\" #content_boundary id=\"content_boundary\">\n\n  <div class=\"col-8\"  #main_area id=\"main_area\" [dragula]=\"main_area_bag\">\n    <app-uiview *ngFor=\"let droppedItem of formItems; let i = index\"\n                [formItem]=\"droppedItem\"\n                (viewClick)=\"selectElement(droppedItem, i)\"\n                [selected]=\"i==selectedIndex\">\n    </app-uiview>\n  </div>\n\n    <div class=\"col-4\" id=\"side_area\" >\n    <ul class=\"nav nav-tabs\">\n      <li class=\"nav-item\"><a  data-toggle=\"tab\" href=\"#elements\" class=\"nav-link text-warning active\" (click)=\"clearSelection()\" #elementTab>Elements</a></li>\n      <li class=\"nav-item\"><a  data-toggle=\"tab\" href=\"#editor\" class=\"nav-link text-warning \" #editorTab>Editor</a></li>\n    </ul>\n\n      <div class=\"tab-content clearfix\">\n        <!--Element Tab-->\n        <ul class=\"list-group tab-pane\" id=\"elements\" [class.active]='!showEditor'>\n          <li *ngFor=\"let item of templateTypes\" #item_element\n              (click)=\"clearSelection()\"\n              class=\"list-group-item\"\n              [ngDraggable]=\"true\"\n              [trackPosition]=\"false\"\n              [bounds]=\"content_boundary\"\n              [inBounds]=\"true\"\n              (started)=\"onStart(main_area.getBoundingClientRect())\"\n              (endOffset)=\"onMoveEnd(item_element.getBoundingClientRect(), item)\">\n            <fa-icon [icon]=\"getIcon(item)\"></fa-icon> <span>{{item.displayName}}</span>\n          </li>\n        </ul>\n        <!--Editor Tab-->\n        <div id=\"editor\" class=\"tab-pane active\" [class.active]='showEditor'>\n          <app-editor *ngIf=\"selectedIndex !== -1\" [formItem]=\"formItems[selectedIndex]\"></app-editor>\n          {{formItems[selectedIndex] | json }}\n\n        </div>\n      </div>\n  </div>\n</div>\n"

/***/ }),

/***/ "./src/app/builder/builder.component.ts":
/*!**********************************************!*\
  !*** ./src/app/builder/builder.component.ts ***!
  \**********************************************/
/*! exports provided: BuilderComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "BuilderComponent", function() { return BuilderComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item_service__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item.service */ "./src/app/form-item.service.ts");
/* harmony import */ var _icons__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../icons */ "./src/app/icons.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var BuilderComponent = /** @class */ (function () {
    function BuilderComponent(formService) {
        this.formService = formService;
        this.contentBoundary = { x: 0, y: 0, width: 0, height: 0 };
        this.selectedIndex = -1;
        this.showEditor = false;
    }
    BuilderComponent.prototype.ngOnInit = function () {
        this.getTemplateTypes();
        this.getNewTemplate();
    };
    BuilderComponent.prototype.onSubmit = function () {
    };
    BuilderComponent.prototype.getTemplateTypes = function () {
        var _this = this;
        this.formService.getFormItems()
            .subscribe(function (items) { return _this.templateTypes = items; });
    };
    BuilderComponent.prototype.getNewTemplate = function () {
        var _this = this;
        this.formService.getNewTemplate()
            .subscribe(function (template) { return _this.formItems = template; });
    };
    BuilderComponent.prototype.getIcon = function (formItem) {
        return new _icons__WEBPACK_IMPORTED_MODULE_2__["Icons"]().icon(formItem.itemType);
    };
    BuilderComponent.prototype.selectElement = function (item, i) {
        if (this.selectedIndex === i) {
            this.selectedIndex = -1;
            this.elementTab.nativeElement.classList.add('active');
            this.editorTab.nativeElement.classList.remove('active');
            this.showEditor = false;
        }
        else {
            this.selectedIndex = i;
            this.elementTab.nativeElement.classList.remove('active');
            this.editorTab.nativeElement.classList.add('active');
            this.showEditor = true;
        }
    };
    BuilderComponent.prototype.clearSelection = function () {
        this.selectedIndex = -1;
        this.showEditor = false;
    };
    BuilderComponent.prototype.onStart = function (content_box) {
        this.contentBoundary = { x: content_box.x, y: content_box.y, width: content_box.width, height: content_box.width };
    };
    BuilderComponent.prototype.onMoveEnd = function (itemBound, item) {
        var movingItemBound = { x: itemBound.x, y: itemBound.y, width: itemBound.width, height: itemBound.width };
        var containInBound = this.containsBound(this.contentBoundary, movingItemBound);
        item.newUUID(); // mark unqiue
        if (containInBound) {
            this.formItems.push(item);
        }
    };
    BuilderComponent.prototype.containsBound = function (parent, child) {
        var cX = this.midPoint(child).centerX;
        var cY = this.midPoint(child).centerY;
        return (cX >= parent.x && cY >= parent.y && cX <= parent.x + parent.width && cY <= parent.y + parent.height);
    };
    BuilderComponent.prototype.midPoint = function (frame) {
        var centerX = frame.x + frame.width / 2.0;
        var centerY = frame.y + frame.height / 2.0;
        return { centerX: centerX, centerY: centerY };
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ViewChild"])('elementTab'),
        __metadata("design:type", _angular_core__WEBPACK_IMPORTED_MODULE_0__["ElementRef"])
    ], BuilderComponent.prototype, "elementTab", void 0);
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ViewChild"])('editorTab'),
        __metadata("design:type", _angular_core__WEBPACK_IMPORTED_MODULE_0__["ElementRef"])
    ], BuilderComponent.prototype, "editorTab", void 0);
    BuilderComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-builder',
            template: __webpack_require__(/*! ./builder.component.html */ "./src/app/builder/builder.component.html"),
            styles: [__webpack_require__(/*! ./builder.component.css */ "./src/app/builder/builder.component.css")]
        }),
        __metadata("design:paramtypes", [_form_item_service__WEBPACK_IMPORTED_MODULE_1__["FormItemService"]])
    ], BuilderComponent);
    return BuilderComponent;
}());



/***/ }),

/***/ "./src/app/editor/editor.component.css":
/*!*********************************************!*\
  !*** ./src/app/editor/editor.component.css ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n.row {\n  background-color: white;\n  padding: 20px;\n}\n\n#editor {\n  height: 100%;\n  width: 100%;\n}\n\n.align_right {\n  text-align: right;\n  width: 100%;\n  color: gray;\n}\n"

/***/ }),

/***/ "./src/app/editor/editor.component.html":
/*!**********************************************!*\
  !*** ./src/app/editor/editor.component.html ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n<div class=\"container-fluid\" id=\"editor\">\n\n  <!-- title view -->\n  <div *ngIf=\"formItem.itemType ==='header'\">\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Form Title</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.title\">\n    </div>\n  </div>\n\n\n  <!-- title view -->\n  <div *ngIf=\"formItem.itemType ==='titleview'\">\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Title</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.title\">\n    </div>\n  </div>\n\n  <!-- textfield view -->\n  <div *ngIf=\"formItem.itemType==='textfield'\">\n\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Title</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.title\">\n    </div>\n\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Place Holder Text</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.placeHolder\">\n    </div>\n\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Information</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.information\">\n    </div>\n  </div>\n\n  <!-- phone view -->\n  <div *ngIf=\"formItem.itemType==='phoneview'\">\n\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Title</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.title\">\n    </div>\n\n    <div class=\"row\">\n      <label class=\"col-6 align_right\">Place Holder Text</label>\n      <input class=\"col-6\" type=\"text\" [(ngModel)]=\"formItem.placeHolder\">\n    </div>\n  </div>\n\n\n</div>\n"

/***/ }),

/***/ "./src/app/editor/editor.component.ts":
/*!********************************************!*\
  !*** ./src/app/editor/editor.component.ts ***!
  \********************************************/
/*! exports provided: EditorComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "EditorComponent", function() { return EditorComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item */ "./src/app/form-item.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var EditorComponent = /** @class */ (function () {
    function EditorComponent() {
    }
    EditorComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", _form_item__WEBPACK_IMPORTED_MODULE_1__["FormItem"])
    ], EditorComponent.prototype, "formItem", void 0);
    EditorComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-editor',
            template: __webpack_require__(/*! ./editor.component.html */ "./src/app/editor/editor.component.html"),
            styles: [__webpack_require__(/*! ./editor.component.css */ "./src/app/editor/editor.component.css")]
        }),
        __metadata("design:paramtypes", [])
    ], EditorComponent);
    return EditorComponent;
}());



/***/ }),

/***/ "./src/app/form-item.service.ts":
/*!**************************************!*\
  !*** ./src/app/form-item.service.ts ***!
  \**************************************/
/*! exports provided: FormItemService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "FormItemService", function() { return FormItemService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./form-item */ "./src/app/form-item.ts");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm5/index.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var FormItemService = /** @class */ (function () {
    function FormItemService(http) {
        this.http = http;
        this.formTemplate = [];
        this.formTemplate.push(this.makeHeaderTemplate());
    }
    FormItemService.prototype.getFormItems = function () {
        return Object(rxjs__WEBPACK_IMPORTED_MODULE_2__["of"])(_form_item__WEBPACK_IMPORTED_MODULE_1__["default"]);
    };
    FormItemService.prototype.getNewTemplate = function () {
        return Object(rxjs__WEBPACK_IMPORTED_MODULE_2__["of"])(this.formTemplate);
    };
    FormItemService.prototype.makeHeaderTemplate = function () {
        var header = new _form_item__WEBPACK_IMPORTED_MODULE_1__["HeaderItem"]();
        header.itemType = 'header';
        header.displayName = 'Header';
        header.title = 'New Patient Form';
        header.formUUID = header.uuid;
        header.qrcodeURL = 'qr.png';
        return header;
    };
    FormItemService = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"])({
            providedIn: 'root'
        }),
        __metadata("design:paramtypes", [_angular_common_http__WEBPACK_IMPORTED_MODULE_3__["HttpClient"]])
    ], FormItemService);
    return FormItemService;
}());



/***/ }),

/***/ "./src/app/form-item.ts":
/*!******************************!*\
  !*** ./src/app/form-item.ts ***!
  \******************************/
/*! exports provided: FormItem, HeaderItem, TextFieldItem, TitleItem, PhoneItem, default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "FormItem", function() { return FormItem; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "HeaderItem", function() { return HeaderItem; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TextFieldItem", function() { return TextFieldItem; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TitleItem", function() { return TitleItem; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PhoneItem", function() { return PhoneItem; });
/* harmony import */ var angular2_uuid__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! angular2-uuid */ "./node_modules/angular2-uuid/index.js");
/* harmony import */ var angular2_uuid__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(angular2_uuid__WEBPACK_IMPORTED_MODULE_0__);
var __extends = (undefined && undefined.__extends) || (function () {
    var extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();

var FormItem = /** @class */ (function () {
    function FormItem() {
        this.uuid = angular2_uuid__WEBPACK_IMPORTED_MODULE_0__["UUID"].UUID();
    }
    FormItem.prototype.newUUID = function () {
        this.uuid = angular2_uuid__WEBPACK_IMPORTED_MODULE_0__["UUID"].UUID();
    };
    return FormItem;
}());

var HeaderItem = /** @class */ (function (_super) {
    __extends(HeaderItem, _super);
    function HeaderItem() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return HeaderItem;
}(FormItem));

var TextFieldItem = /** @class */ (function (_super) {
    __extends(TextFieldItem, _super);
    function TextFieldItem() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return TextFieldItem;
}(FormItem));

var TitleItem = /** @class */ (function (_super) {
    __extends(TitleItem, _super);
    function TitleItem() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return TitleItem;
}(FormItem));

var PhoneItem = /** @class */ (function (_super) {
    __extends(PhoneItem, _super);
    function PhoneItem() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return PhoneItem;
}(FormItem));

function textfieldTemplate() {
    var textfield = new TextFieldItem();
    textfield.itemType = 'textfield';
    textfield.displayName = 'Text Field';
    textfield.title = 'Full Name';
    textfield.placeHolder = 'Jon Snow';
    textfield.information = 'Please enter both first and last name';
    return textfield;
}
function titleTemplate() {
    var titleItem = new TitleItem();
    titleItem.itemType = 'titleview';
    titleItem.displayName = 'Title View';
    titleItem.title = 'Patient information';
    return titleItem;
}
function phoneTemplate() {
    var phoneItem = new PhoneItem();
    phoneItem.itemType = 'phoneview';
    phoneItem.displayName = 'Phone Number';
    phoneItem.title = 'Phone Number';
    phoneItem.placeHolder = '413-123-4563';
    return phoneItem;
}
var template_items = [titleTemplate(), textfieldTemplate(), phoneTemplate()];
/* harmony default export */ __webpack_exports__["default"] = (template_items);


/***/ }),

/***/ "./src/app/headerview/headerview.component.css":
/*!*****************************************************!*\
  !*** ./src/app/headerview/headerview.component.css ***!
  \*****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "img {\n  width: 100px;\n  float: left;\n}\n\n#title {\n  text-align: center;\n}\n\n#form_info {\n  text-align: center ;\n}\n"

/***/ }),

/***/ "./src/app/headerview/headerview.component.html":
/*!******************************************************!*\
  !*** ./src/app/headerview/headerview.component.html ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n\n  <img src=\"../../assets/{{formItem.qrcodeURL}}\">\n  <p id=\"title\">{{formItem.title}}</p>\n  <p id=\"form_info\">{{formItem.formUUID}} </p>\n"

/***/ }),

/***/ "./src/app/headerview/headerview.component.ts":
/*!****************************************************!*\
  !*** ./src/app/headerview/headerview.component.ts ***!
  \****************************************************/
/*! exports provided: HeaderviewComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "HeaderviewComponent", function() { return HeaderviewComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item */ "./src/app/form-item.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var HeaderviewComponent = /** @class */ (function () {
    function HeaderviewComponent() {
    }
    HeaderviewComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", _form_item__WEBPACK_IMPORTED_MODULE_1__["HeaderItem"])
    ], HeaderviewComponent.prototype, "formItem", void 0);
    HeaderviewComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-headerview',
            template: __webpack_require__(/*! ./headerview.component.html */ "./src/app/headerview/headerview.component.html"),
            styles: [__webpack_require__(/*! ./headerview.component.css */ "./src/app/headerview/headerview.component.css")]
        }),
        __metadata("design:paramtypes", [])
    ], HeaderviewComponent);
    return HeaderviewComponent;
}());



/***/ }),

/***/ "./src/app/icons.ts":
/*!**************************!*\
  !*** ./src/app/icons.ts ***!
  \**************************/
/*! exports provided: Icons */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Icons", function() { return Icons; });
/* harmony import */ var _fortawesome_free_solid_svg_icons__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @fortawesome/free-solid-svg-icons */ "./node_modules/@fortawesome/free-solid-svg-icons/index.es.js");

var Icons = /** @class */ (function () {
    function Icons() {
    }
    Icons.prototype.icon = function (type) {
        switch (type) {
            case 'textfield':
                return _fortawesome_free_solid_svg_icons__WEBPACK_IMPORTED_MODULE_0__["faEdit"];
            case 'titleview':
                return _fortawesome_free_solid_svg_icons__WEBPACK_IMPORTED_MODULE_0__["faParagraph"];
            case 'phoneview':
                return _fortawesome_free_solid_svg_icons__WEBPACK_IMPORTED_MODULE_0__["faPhone"];
            default:
                return _fortawesome_free_solid_svg_icons__WEBPACK_IMPORTED_MODULE_0__["faQuoteLeft"];
        }
    };
    return Icons;
}());



/***/ }),

/***/ "./src/app/phoneview/phoneview.component.css":
/*!***************************************************!*\
  !*** ./src/app/phoneview/phoneview.component.css ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n\n.form-control {\n  text-align: center;\n}\n"

/***/ }),

/***/ "./src/app/phoneview/phoneview.component.html":
/*!****************************************************!*\
  !*** ./src/app/phoneview/phoneview.component.html ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n<p>{{formItem.title}}</p>\n<div class=\"row\">\n  <div class=\"col-6\">\n    <input class=\"form-control\" placeholder=\"{{formItem.placeHolder}}\" maxlength=\"10\">\n  </div>\n</div>\n"

/***/ }),

/***/ "./src/app/phoneview/phoneview.component.ts":
/*!**************************************************!*\
  !*** ./src/app/phoneview/phoneview.component.ts ***!
  \**************************************************/
/*! exports provided: PhoneviewComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PhoneviewComponent", function() { return PhoneviewComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item */ "./src/app/form-item.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var PhoneviewComponent = /** @class */ (function () {
    function PhoneviewComponent() {
    }
    PhoneviewComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", _form_item__WEBPACK_IMPORTED_MODULE_1__["PhoneItem"])
    ], PhoneviewComponent.prototype, "formItem", void 0);
    PhoneviewComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-phoneview',
            template: __webpack_require__(/*! ./phoneview.component.html */ "./src/app/phoneview/phoneview.component.html"),
            styles: [__webpack_require__(/*! ./phoneview.component.css */ "./src/app/phoneview/phoneview.component.css")]
        }),
        __metadata("design:paramtypes", [])
    ], PhoneviewComponent);
    return PhoneviewComponent;
}());



/***/ }),

/***/ "./src/app/textfield/textfield.component.css":
/*!***************************************************!*\
  !*** ./src/app/textfield/textfield.component.css ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\ninput {\n  background-color: rgba(255, 255, 255, 0);\n}\n"

/***/ }),

/***/ "./src/app/textfield/textfield.component.html":
/*!****************************************************!*\
  !*** ./src/app/textfield/textfield.component.html ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div >\n  <label>{{formItem.title}}</label>\n  <input class=\"form-control\" placeholder=\"{{formItem.placeHolder}}\" >\n  <small  class=\"form-text\">{{formItem.information}}</small>\n</div>\n"

/***/ }),

/***/ "./src/app/textfield/textfield.component.ts":
/*!**************************************************!*\
  !*** ./src/app/textfield/textfield.component.ts ***!
  \**************************************************/
/*! exports provided: TextfieldComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TextfieldComponent", function() { return TextfieldComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item */ "./src/app/form-item.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var TextfieldComponent = /** @class */ (function () {
    function TextfieldComponent() {
    }
    TextfieldComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", _form_item__WEBPACK_IMPORTED_MODULE_1__["TextFieldItem"])
    ], TextfieldComponent.prototype, "formItem", void 0);
    TextfieldComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-textfield',
            template: __webpack_require__(/*! ./textfield.component.html */ "./src/app/textfield/textfield.component.html"),
            styles: [__webpack_require__(/*! ./textfield.component.css */ "./src/app/textfield/textfield.component.css")]
        }),
        __metadata("design:paramtypes", [])
    ], TextfieldComponent);
    return TextfieldComponent;
}());



/***/ }),

/***/ "./src/app/titleview/titleview.component.css":
/*!***************************************************!*\
  !*** ./src/app/titleview/titleview.component.css ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/titleview/titleview.component.html":
/*!****************************************************!*\
  !*** ./src/app/titleview/titleview.component.html ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div>\n  <strong>{{formItem.title}}</strong>\n  <hr>\n</div>\n"

/***/ }),

/***/ "./src/app/titleview/titleview.component.ts":
/*!**************************************************!*\
  !*** ./src/app/titleview/titleview.component.ts ***!
  \**************************************************/
/*! exports provided: TitleviewComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TitleviewComponent", function() { return TitleviewComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item */ "./src/app/form-item.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var TitleviewComponent = /** @class */ (function () {
    function TitleviewComponent() {
    }
    TitleviewComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", _form_item__WEBPACK_IMPORTED_MODULE_1__["TitleItem"])
    ], TitleviewComponent.prototype, "formItem", void 0);
    TitleviewComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-titleview',
            template: __webpack_require__(/*! ./titleview.component.html */ "./src/app/titleview/titleview.component.html"),
            styles: [__webpack_require__(/*! ./titleview.component.css */ "./src/app/titleview/titleview.component.css")]
        }),
        __metadata("design:paramtypes", [])
    ], TitleviewComponent);
    return TitleviewComponent;
}());



/***/ }),

/***/ "./src/app/uiview/uiview.component.css":
/*!*********************************************!*\
  !*** ./src/app/uiview/uiview.component.css ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n.bound {\n  width: 100%;\n  background-color: white;\n  padding: 20px 10px;\n  overflow: auto;\n}\n\n.bound:hover {\n  border-radius: 5x;\n  background-color: lightgrey;\n}\n\n.selected {\n  background-color: rgba(100, 150, 200, 0.8);\n}\n\n"

/***/ }),

/***/ "./src/app/uiview/uiview.component.html":
/*!**********************************************!*\
  !*** ./src/app/uiview/uiview.component.html ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "\n\n<div class=\"bound\" [class.selected]=\"selected\" (click)=\"viewClick.emit($event);\">\n  <app-headerview *ngIf=\"formItem.itemType==='header'\" [formItem]=\"formItem\"></app-headerview>\n  <app-textfield *ngIf=\"formItem.itemType==='textfield'\" [formItem]=\"formItem\"></app-textfield>\n  <app-titleview *ngIf=\"formItem.itemType==='titleview'\" [formItem]=\"formItem\"></app-titleview>\n  <app-phoneview *ngIf=\"formItem.itemType==='phoneview'\" [formItem]=\"formItem\"></app-phoneview>\n</div>\n"

/***/ }),

/***/ "./src/app/uiview/uiview.component.ts":
/*!********************************************!*\
  !*** ./src/app/uiview/uiview.component.ts ***!
  \********************************************/
/*! exports provided: UiviewComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "UiviewComponent", function() { return UiviewComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _form_item__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../form-item */ "./src/app/form-item.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var UiviewComponent = /** @class */ (function () {
    function UiviewComponent() {
        this.viewClick = new _angular_core__WEBPACK_IMPORTED_MODULE_0__["EventEmitter"]();
    }
    UiviewComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", _form_item__WEBPACK_IMPORTED_MODULE_1__["FormItem"])
    ], UiviewComponent.prototype, "formItem", void 0);
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", Boolean)
    ], UiviewComponent.prototype, "selected", void 0);
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Output"])(),
        __metadata("design:type", _angular_core__WEBPACK_IMPORTED_MODULE_0__["EventEmitter"])
    ], UiviewComponent.prototype, "viewClick", void 0);
    UiviewComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-uiview',
            template: __webpack_require__(/*! ./uiview.component.html */ "./src/app/uiview/uiview.component.html"),
            styles: [__webpack_require__(/*! ./uiview.component.css */ "./src/app/uiview/uiview.component.css")]
        }),
        __metadata("design:paramtypes", [])
    ], UiviewComponent);
    return UiviewComponent;
}());



/***/ }),

/***/ "./src/environments/environment.ts":
/*!*****************************************!*\
  !*** ./src/environments/environment.ts ***!
  \*****************************************/
/*! exports provided: environment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "environment", function() { return environment; });
// This file can be replaced during build by using the `fileReplacements` array.
// `ng build ---prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.
var environment = {
    production: false
};
/*
 * In development mode, to ignore zone related error stack frames such as
 * `zone.run`, `zoneDelegate.invokeTask` for easier debugging, you can
 * import the following file, but please comment it out in production mode
 * because it will have performance impact when throw error
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/platform-browser-dynamic */ "./node_modules/@angular/platform-browser-dynamic/fesm5/platform-browser-dynamic.js");
/* harmony import */ var _app_app_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app/app.module */ "./src/app/app.module.ts");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./environments/environment */ "./src/environments/environment.ts");




if (_environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].production) {
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["enableProdMode"])();
}
Object(_angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_1__["platformBrowserDynamic"])().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_2__["AppModule"])
    .catch(function (err) { return console.log(err); });


/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./src/main.ts ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! /Users/rixing/Desktop/cantina/formbuilder/src/main.ts */"./src/main.ts");


/***/ })

},[[0,"runtime","vendor"]]]);
//# sourceMappingURL=main.js.map