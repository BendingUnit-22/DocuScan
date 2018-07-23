
export class FormItem {
  itemType: string;
  displayName: string;
}

export class HeaderItem extends FormItem{
  title: string;
  formUUID: string;
  qrcodeURL: string;
}

export class TextFieldItem extends FormItem {
  title: string;
  placeHolder: string;
  information: string;
}

export class TitleItem extends FormItem {
  title: string;
}

export class PhoneItem extends FormItem {
  title1: string;
  placeHolder1: string;
  title2: string;
  placeHolder2: string;
}


function textfieldTemplate(): TextFieldItem {
  const textfield = new TextFieldItem();
  textfield.itemType = 'textfield';
  textfield.displayName = 'Text Field';
  textfield.title = 'Address';
  textfield.placeHolder = '123 Huntington Ave, Boston MA';
  textfield.information = 'Please fill completely';
  return textfield;
}

function titleTemplate(): TitleItem {
  const titleItem = new TitleItem();
  titleItem.itemType = 'titleview';
  titleItem.displayName = 'Title View';
  titleItem.title = 'Patient information';
  return titleItem;
}

function phoneTemplate(): PhoneItem {
  const phoneItem = new PhoneItem();
  phoneItem.itemType = 'phoneview';
  phoneItem.displayName = 'Column';
  phoneItem.title1 = 'First Name';
  phoneItem.placeHolder1 = 'Jon';
  phoneItem.title2 = 'Last Name';
  phoneItem.placeHolder2 = 'Snow';
  return phoneItem;
}

const template_items = [titleTemplate(), textfieldTemplate(), phoneTemplate()];

export default template_items;
