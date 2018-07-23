import {faEdit, faQuoteLeft, faParagraph, faPause} from '@fortawesome/free-solid-svg-icons';


export class Icons {

  icon(type: string) {
      switch (type) {
        case 'textfield':
          return faEdit;
        case 'titleview':
          return faParagraph;
        case 'phoneview':
          return faPause;
        default:
          return faQuoteLeft;
      }
  }

}
