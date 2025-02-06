function modalOperation() {
  const modal = document.getElementById("modalSelf");
  const newForm = document.getElementById("newOshiProfileForm");
  const editForm = document.getElementById("editOshiProfileForm");

  function showModalIfValid(form) {
    const nameField = form.querySelector('input[name="oshi_profile[name]"]');

    if (nameField && nameField.value.trim() === "") {
      return;
    }

    modal.style.display = "block";
    document.body.style.overflow = "hidden";
  }

  if (newForm) {
    newForm.addEventListener("submit", () => {
      modal.style.display = "block";
      document.body.style.overflow = "hidden";
    });
  }

  if (editForm) {
    editForm.addEventListener("submit", () => {
      modal.style.display = "block";
      document.body.style.overflow = "hidden";
    });
  }
}

window.addEventListener("turbo:load", modalOperation);