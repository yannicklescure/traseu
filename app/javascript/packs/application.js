import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapBox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from '../navbar';
import { scrollToAnchor } from "../scroll_to_anchor";

initMapBox();

// scrollTo();

let currentPage = window.location.href.split(/.*[\/]/)[1] || null;
console.log(currentPage);

if (currentPage == null || currentPage == '#experience' || currentPage == '#country' || currentPage == '#budget' || currentPage == '#days') {
  initUpdateNavbarOnScroll();
  scrollToAnchor('#experience');

  const countryNextBtn = document.querySelector("#country-next");
  countryNextBtn.addEventListener("click", (event) => {
    console.log("country-next clicked");
    document.querySelector("#experience").classList.add("d-none");
    document.querySelectorAll(".homepage").forEach((element) => {
      element.classList.add("d-none");
    });
    document.querySelector("#country").classList.remove("d-none");
  });

  const budgetNextBtn = document.querySelector("#budget-next");
  budgetNextBtn.addEventListener("click", (event) => {
    console.log("budget-next clicked");
    document.querySelector("#country").classList.add("d-none");
    document.querySelector("#budget").classList.remove("d-none");
  });

  const daysNextBtn = document.querySelector("#days-next");
  daysNextBtn.addEventListener("click", (event) => {
    console.log("days-next clicked");
    document.querySelector("#budget").classList.add("d-none");
    document.querySelector("#days").classList.remove("d-none");
  });

} else {
  const navbar = document.querySelector('.navbar');
  navbar.classList.add('bg-light');
  // console.log(navbar.className);
}
