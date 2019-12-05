const toggleCards = () => {

  const buttons = document.querySelectorAll(".fabbutton");

  const toggleActiveClass = (event) => {
    console.log(1);
    event.currentTarget.classList.toggle("active");
  };

  const bindCardToClick = (button) => {
    button.addEventListener('click', toggleActiveClass);
  };

  buttons.forEach(bindCardToClick);

};

export { toggleCards };
