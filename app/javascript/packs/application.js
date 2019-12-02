import "bootstrap";
import { initUpdateNavbarOnScroll } from "../navbar";
import { scrollToAnchor } from "../scroll_to_anchor";

scrollTo();

const currentPage = window.location.href.split(/.*[\/]/)[1] || null;
console.log(currentPage);

if (currentPage == null) {
  initUpdateNavbarOnScroll();
} else {
  const navbar = document.querySelector('.navbar');
  navbar.classList.add('bg-light');
  console.log(navbar.className);
}

scrollToAnchor('#search-country');
