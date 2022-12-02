// import { Controller } from "@hotwired/stimulus"
// import TomSelect from "tom-select"

// // Connects to data-controller="tom-select"
// export default class extends Controller {
//   connect() {
//     console.log("coucou")
//     console.log(this.element)
//     new TomSelect(this.element, {
//         allowEmptyOption: true,
//         create: true,
//         maxItems: 2,
//         render: {
//             option: function (data, escape) {
//                 return `<div><img class="me-2" src="${data.src}">${data.text}</div>`;
//             },
//             item: function (item, escape) {
//           return `<div><img class="me-2" src="${item.src}">${item.text}</div>`;
//             }
//         }
//     });
//   }
// }
