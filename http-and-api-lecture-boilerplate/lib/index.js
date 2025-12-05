// TODO: Fetch an activity with the Bored API - Let's pseudocode!
const url = "https://the-fork.api.lewagon.com/api/v1/restaurants";

const button = document.querySelector("#button");
const list = document.querySelector("#restaurants");

button.addEventListener("click", () => {
  fetch(url)
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      data.forEach((restaurant) => {
        const li = document.createElement("li");
        li.classList.add("list-group-item");
        li.innerText = `${restaurant.name} - 🏠: ${restaurant.address}`;
        list.appendChild(li);
      });
    });
});
