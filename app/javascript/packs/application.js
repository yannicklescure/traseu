import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapBox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from '../navbar';
import { scrollToAnchor } from "../scroll_to_anchor";
import { dynamicText } from "../dynamic-text";
import { progressBar } from "../progress-bar";
import { backButton } from "../back-button";

// scrollTo();

// let currentPage = window.location.href.split(/.*[\/]/)[1] || null;
let currentPage = window.location.pathname.split("/")[1] || null;

if (currentPage == "itineraries") {
  initMapBox();
}

if (currentPage == null || currentPage == '#experience' || currentPage == '#country' || currentPage == '#budget' || currentPage == '#days' || currentPage == '#page-content') {
  initUpdateNavbarOnScroll();
  scrollToAnchor();
  dynamicText();
  progressBar();
  backButton();

  const countryNextBtn = document.querySelectorAll("a.country-next").forEach((el) => {
    el.addEventListener("click", (event) => {
      console.log("country-next clicked");
      document.querySelector("#experience").classList.add("d-none");
      document.querySelector("#homepage-onboarding").classList.remove("d-none");
      document.querySelectorAll(".homepage").forEach((element) => {
        element.classList.add("d-none");
      });
      document.querySelector("#country").classList.remove("d-none");
      countryLoad();
    });
  });

  const budgetNextBtn = document.querySelector("#budget-next");
  budgetNextBtn.addEventListener("click", (event) => {
    console.log("budget-next clicked");
    document.querySelector("#country").classList.add("d-none");
    document.querySelector("#homepage-onboarding").classList.remove("d-none");
    document.querySelector("#budget").classList.remove("d-none");
    budgetLoad();
  });

  const daysNextBtn = document.querySelector("#days-next");
  daysNextBtn.addEventListener("click", (event) => {
    console.log("days-next clicked");
    document.querySelector("#budget").classList.add("d-none");
    document.querySelector("#homepage-onboarding").classList.remove("d-none");
    document.querySelector("#days").classList.remove("d-none");
    daysLoad();
  });

} else {
  const navbar = document.querySelector('.navbar');
  navbar.classList.add('bg-light');
  // console.log(navbar.className);
}

const countryLoad = () => {
    const progressPoint2 = document.querySelector("#progress-point2");
    progressPoint2.click();
}

const budgetLoad = () => {
    console.log(3);
    const progressPoint3 = document.querySelector("#progress-point3");
    progressPoint3.click();
}

const daysLoad = () => {
    console.log(4);
    const progressPoint4 = document.querySelector("#progress-point4");
    progressPoint4.click();
}


