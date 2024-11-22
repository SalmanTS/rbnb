import {
  Controller
} from "@hotwired/stimulus";

export default class extends Controller {
  removeImage(event) {
    event.preventDefault();

    const imageId = event.currentTarget.dataset.imageId;
    const imageElement = document.getElementById(`image_${imageId}`);
    const carouselItem = document.getElementById(`carousel_item_${imageId}`);

    if (imageElement) {
      imageElement.remove();
    }

    if (carouselItem) {
      carouselItem.remove();
    }

    const hiddenField = document.createElement("input");
    hiddenField.type = "hidden";
    hiddenField.name = "scooter[images_to_remove][]";
    hiddenField.value = imageId;
    this.element.appendChild(hiddenField);
  }
}
