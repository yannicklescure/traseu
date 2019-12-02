import "bootstrap";
import { initUpdateNavbarOnScroll } from "../navbar";
import { scrollToAnchor } from "../scroll_to_anchor";

// scrollTo();

const bannerMain = document.querySelector('#banner-main');
const traseuServices = document.querySelector('#traseu-services');
const searchExperience = document.querySelector('#search-experience');
const searchCountry = document.querySelector('#search-country');
const searchBudget = document.querySelector('#search-budget');
const searchDays = document.querySelector('#search-days');
const searchResults = document.querySelector('#search-results');

// searchCountry.classList.add('d-none');
// searchBudget.classList.add('d-none');
// searchDays.classList.add('d-none');

const navbar = document.querySelector('.navbar');
let currentPage = window.location.href.split(/.*[\/]/)[1] || null;
console.log(currentPage);

const renderHomeSearchExperience = () => {
  // bannerMain.classList.remove('d-none');
  // traseuServices.classList.remove('d-none');
  // searchExperience.classList.remove('d-none');
  // searchCountry.classList.add('d-none');
}

const renderHomeSearchCountry = () => {
  bannerMain.classList.add('d-none');
  traseuServices.classList.add('d-none');
  searchExperience.classList.add('d-none');
  searchCountry.classList.remove('d-none');
  let searchResultsBottom = document.querySelector('#search-results-0').getBoundingClientRect().top;
  let footerTop = document.querySelector('footer').getBoundingClientRect().top;
  document.querySelector('#search-country').style.minHeight = `${footerTop - searchResultsBottom}px`;
  window.scrollTo(60, 0, 'smooth');
}

// const renderHomeSearchBudget = () => {
//   searchCountry.classList.add('d-none');
//   searchBudget.classList.remove('d-none');
// }

// if (currentPage == '#search-experience') {
//   console.log('experience');
//   renderHomeSearchExperience();
// }

// if (currentPage == '#search-country') {
//   console.log('country');
//   renderHomeSearchCountry();
//   navbar.classList.add('bg-light');
//   navbar.classList.remove('navbar-traseu-yellow');
// }

if (currentPage == null || currentPage == '#search-experience') {
  // initUpdateNavbarOnScroll();
  scrollToAnchor('#search-experience');

  document.querySelector(`#search-country-link-next`).addEventListener('click', (event) => {
    renderHomeSearchCountry();
  });

  document.querySelector(`#search-experience-link-back`).addEventListener('click', (event) => {
    renderHomeSearchExperience();
  });

  document.querySelector(`#search-budget-link-next`).addEventListener('click', (event) => {
    renderHomeSearchBudget();
  });

  // document.querySelector(`#search-country-link-back`).addEventListener('click', (event) => {
  //   renderHomeSearchCountry();
  // });

  // window.addEventListener('scroll', (event) => {
  //   let pageYOffset = event.currentTarget.pageYOffset;
  //   // console.log(pageYOffset);
  //   if (searchCountry.style.display == 'block') {
  //     bannerMain.classList.add('d-none');
  //     traseuServices.classList.add('d-none');
  //     let newElement = document.querySelector('#search-country');
  //     let newElementPosition = newElement.getBoundingClientRect();
  //     if (pageYOffset >= newElementPosition.top) {
  //       searchResults.style.display = 'block';
  //     } else {
  //       searchResults.style.display = 'none';
  //     }
  //   }
  // });
} else {
  const navbar = document.querySelector('.navbar');
  navbar.classList.add('bg-light');
  // console.log(navbar.className);
}
