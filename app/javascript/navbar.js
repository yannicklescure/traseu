const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');
  navbar.classList.add('navbar-traseu-yellow');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        // console.log(navbar.className);
        navbar.classList.add('bg-light');
        navbar.classList.remove('navbar-traseu-yellow');
      } else {
        navbar.classList.remove('bg-light');
        navbar.classList.add('navbar-traseu-yellow');
        // console.log(navbar.className);
      }
    });
  }
};

export { initUpdateNavbarOnScroll };
