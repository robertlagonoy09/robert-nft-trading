const searchBox = document.querySelector(".search-box");
const cards = document.querySelectorAll(".card");

if (searchBox) {
  searchBox.addEventListener("keyup", function () {
    const keyword = this.value.toLowerCase();

    cards.forEach(card => {
      const title = card.querySelector("h3").textContent.toLowerCase();

      if (title.includes(keyword)) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  });
}