document.addEventListener("turbo:load", () => {
  const flashMessage = document.querySelector('.fixed.top-28');
  if (flashMessage) {
    setTimeout(() => {
      flashMessage.style.display = 'none';
    }, 5000);
  }
});
