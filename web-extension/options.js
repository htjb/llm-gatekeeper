function saveOptions(e) {
  e.preventDefault();
  browser.storage.sync.set({
    blocked: document.querySelector("#blocked").value,
    friction: document.querySelector("#friction").value
  });
}

browser.storage.sync.set({
  blocked: "0 1",
  friction: " "
})
document.querySelector("form").addEventListener("submit", saveOptions);